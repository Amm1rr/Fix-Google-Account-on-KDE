# Fix Google Account and Drive Integration on KDE

Easily resolve Google Account and Drive integration issues on KDE with this simple script.

---

## 🚀 Quick Fix

1. **Download the script**:  
   The script `fix_kde_google_integration.sh` is located alongside this README. Download it to your system.

2. **Run the script**:

   ```bash
   chmod +x fix_kde_google_integration.sh
   ./fix_kde_google_integration.sh
   ```

3. **Restart the KDE service** (Optional):
   ```bash
   kquitapp6 kded6
   ```

Done! 🎉 Your Google Account and Drive integration should now work seamlessly.

---

## 🛠 What It Fixes

1. **"This browser or app is not secure" error**

   - **Cause**: The `fake-user-agent.patch` in the `signon-ui` package disrupts Google’s authentication.

2. **"This app is blocked" error**
   - Occurs when accessing Google Drive due to misconfigurations in KDE's settings.

The script updates your KDE configuration files and resolves both issues automatically.

---

## 📋 Notes

- Tested on **Manjaro**, **Arch**, **KDE Neon**, **Fedora**, and **OpenSUSE**.
- Creates a backup of original files for safety.
- Reapplication may be needed after KDE updates.

---

## 🌟 References

This fix is based on [Bruno_Goncalves](https://discuss.kde.org/u/Bruno_Goncalves)'s contribution on the [KDE Forum Discussion](https://discuss.kde.org/t/kde-online-accounts-not-signing-in/3411/38?u=amir).
