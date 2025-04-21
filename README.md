# openwrt_autoupdate

This script automates the process of updating and upgrading packages on an OpenWrt router using the `opkg` package manager. It logs all actions, including errors, to a file named `auto_update_log.log` for easy tracking and debugging.

## How It Works

1. Captures the current timestamp to log the start and end times of the update process.
2. Refreshes the package list using `opkg update`.
3. Retrieves a list of upgradable packages and iterates through them to perform upgrades.
4. Logs all actions, including package names and any errors, to `auto_update_log.log`.

## Usage

1. Place the script in your OpenWrt router.
2. Make the script executable:
   ```bash
   chmod +x openwrt_autoupdate
3. Run the script.
    ```bash
    ./openwrt_autoupdate

4. Check the `auto_update_log.log` file for details about the update process.

## Log File

The script appends all logs to `auto_update_log.log` This includes:

- Start and end timestamps.
- Output from opkg update and opkg upgrade.
- Any errors encountered during the process.

## Further steps

**Potential Improvements**:

- Use a unique timestamp for the end time instead of reusing the initial time variable, as the update process duration might vary.

- Add error handling to detect and respond to failures during opkg update or opkg upgrade.

- Consider rotating or archiving the log file to prevent it from growing indefinitely.

- Automate the script by month or specifict datetime.
