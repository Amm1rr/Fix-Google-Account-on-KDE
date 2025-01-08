# Fix Google Account and Drive Integration on KDE

Easily resolve Google Account and Drive integration issues on KDE with this simple script.

This repository provides a script to address common problems with KDE's integration with Google services, including calendar, contacts, and Drive access.

<p align="center">
  <img src="./assets/this-app-is-blocked.jpg" alt="This app is blocked">
</p>

## Features:

- Fixes authentication issues with Google accounts on KDE.
- Simple and straightforward execution.
- Optionally restarts KDE services for immediate effect.
- Replaces Google Account KDE configuration file with GNOME Google Account configuration file, resolving both issues automatically.

## 🚀 Quick Fix

1. **Download and execute the script**:  
   Use the following single command to download, make executable, and run the script:

   ```bash
   curl -sSL https://raw.githubusercontent.com/Amm1rr/Fix-Google-Account-on-KDE/refs/heads/main/fix_kde_google_integration.sh -o fix_kde_google_integration.sh && chmod +x fix_kde_google_integration.sh && ./fix_kde_google_integration.sh
   ```

2. **Restart the KDE service** (Optional):
   ```bash
   kquitapp6 kded6
   ```

Done! 🎉 Your Google Account and Drive integration should now work seamlessly.

## 🛠 What It Fixes

1. **"This browser or app is not secure" error**:

   - **Cause**: The `fake-user-agent.patch` in the `signon-ui` package disrupts Google’s authentication.

2. **"This app is blocked" error**:
   - Occurs when accessing Google Drive due to misconfigurations in KDE's settings.

The script replaces Google Account KDE configuration file with GNOME Google Account configuration file and resolves both issues automatically.

## 📋 Notes

- Tested on **Manjaro**, **Arch**, **KDE Neon**, **Fedora**, and **OpenSUSE**.
- Creates a backup of original files for safety.
- Reapplication may be needed after KDE updates.

## 🌟 References

This fix is based on [Bruno_Goncalves](https://discuss.kde.org/u/Bruno_Goncalves)'s contribution on the [KDE Forum Discussion](https://discuss.kde.org/t/kde-online-accounts-not-signing-in/3411/38?u=amir).
