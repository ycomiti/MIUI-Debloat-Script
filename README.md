# MIUI-Debloat-Script

This repository contains a script designed to debloat your Xiaomi device that supports multiple users. The script removes unwanted pre-installed applications, helping to optimize your device's performance and free up storage space.

## Features

- **Multi-User Support**: The script can uninstall packages for all users on the device.
- **Customizable Package List**: Easily modify the list of packages to uninstall based on your preferences.

## Prerequisites

- A Xiaomi device with USB debugging enabled.
- ADB (Android Debug Bridge) installed on your computer.
- Basic knowledge of using the command line.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ycomiti/MIUI-Debloat-Script.git
   cd MIUI-Debloat-Script
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x debloat.sh
   ```

3. **Run the Script**:
   ```bash
   ./debloat.sh
   ```

4. **Follow the Prompts**:
   - The script will prompt you to enter the device ID. You can find this by running `adb devices`.
   - Ensure your device is connected and recognized by ADB.

## Script Overview

The script contains a predefined list of packages to uninstall. Here are some of the packages included:

- `com.miui.analytics`
- `com.miui.cleaner`
- `com.google.android.apps.maps`
- `com.android.chrome`
- `com.facebook.system`

You can customize the `packages` array in the script to add or remove packages as needed.

## Important Notes

- **Backup Your Data**: Before running the script, it's recommended to back up your data, as uninstalling certain packages may affect your device's functionality.
- **Risk of Bricking**: This script has the potential to cause your device to become unresponsive or "brick" it if critical system applications are removed. Use it at your own risk, and ensure you understand the implications of removing system applications.
- **Use at Your Own Risk**: This script is provided as-is. Ensure you understand the risks involved in modifying system applications.

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! If you have suggestions for improvements or additional features, feel free to open an issue or submit a pull request.
