#!/bin/bash

# Script to fix Google Drive integration issue by updating the google.provider file in KDE

# Google Service
PROVIDER_FILE="/usr/share/accounts/providers/kde/google.provider"

# Backup the original file
if [ -f "$PROVIDER_FILE" ]; then
  echo "Backing up the original file..."
  sudo cp "$PROVIDER_FILE" "${PROVIDER_FILE}.backup"
  echo "Backup created at ${PROVIDER_FILE}.backup"
else
  echo "Error: google.provider file not found at $PROVIDER_FILE. Exiting."
  exit 1
fi

# Write the updated configuration to the file
echo "Updating the google.provider file..."
sudo tee "$PROVIDER_FILE" >/dev/null <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<provider id="google">
  <name>Google</name>
  <description>GNOME-ID, Google Drive and YouTube</description>
  <icon>im-google</icon>
  <translations>kaccounts-providers</translations>
  <domains>.*google\.com</domains>
  <template>
    <group name="auth">
      <setting name="method">oauth2</setting>
      <setting name="mechanism">web_server</setting>
      <group name="oauth2">
        <group name="web_server">
          <setting name="Host">accounts.google.com</setting>
          <setting name="AuthPath">o/oauth2/auth?access_type=offline</setting>
          <setting name="TokenPath">o/oauth2/token</setting>
          <setting name="RedirectUri">http://localhost/oauth2callback</setting>
          <setting name="ResponseType">code</setting>
          <setting type="as" name="Scope">[
            'https://www.googleapis.com/auth/userinfo.email',
            'https://www.googleapis.com/auth/userinfo.profile',
            'https://www.googleapis.com/auth/calendar',
            'https://www.googleapis.com/auth/tasks',
            'https://www.googleapis.com/auth/drive'
          ]</setting>
          <setting type="as" name="AllowedSchemes">['https']</setting>
          <setting name="ClientId">44438659992-7kgjeitenc16ssihbtdjbgguch7ju55s.apps.googleusercontent.com</setting>
          <setting name="ClientSecret">-gMLuQyDiI0XrQS_vx_mhuYF</setting>
          <setting type="b" name="ForceClientAuthViaRequestBody">true</setting>
        </group>
      </group>
    </group>
  </template>
</provider>
EOL

if [ $? -eq 0 ]; then
  echo "google.provider file updated successfully."
else
  echo "Error: Failed to update the google.provider file."
  exit 1
fi

# Restart the system or relevant services to apply changes
echo "Restarting the account management service..."
kquitapp6 kded6

echo "Done. Please re-add your Google account to verify the fix."