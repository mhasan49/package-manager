## Purpose

The installation script is designed to automate the installation process of various packages on Debian/Ubuntu systems. It aims to streamline the setup process by checking for root privileges, verifying the system's distribution, installing required packages, and executing Ansible playbooks for different tasks based on user selection.

## Prerequisites

Before using the installation script, ensure the following prerequisites are met:

- **Root Privileges**: The script requires root privileges to install packages and perform system-level operations. If executed without sufficient privileges, it will prompt the user to run it with `sudo`.
- **Supported Distribution**: The script is intended for Debian/Ubuntu systems. If you are using a different Linux distribution, the script will terminate.
- **Internet Connection**: A stable internet connection is necessary for downloading and installing packages during the execution of the script.

## Usage

Follow these steps to use the installation script:

1. **Download**: Download the script to your local system.
2. **Permissions**: Grant execution permissions to the script using the command: `chmod +x script_name.sh`.
3. **Execution**: Execute the script with root privileges using the command: `sudo ./script_name.sh`.
4. **Selection**: Follow the on-screen instructions to select the desired installation options.

## Available Options

The script provides the following installation options:

- **install_system**: Installs system-related packages necessary for basic system functionality and configuration.
- **install_editors**: Installs editor-related packages for development and text editing purposes.
- **install_media**: Installs media-related packages for multimedia handling and playback.
- **install_application**: Installs application-related packages tailored for specific applications or utilities.
- **install_browser**: Installs browser-related packages for web browsing capabilities.
- **backup**: Initiates a backup process to safeguard important data or configurations.
- **restore**: Initiates a restore process to recover backed-up data or configurations.

Users can select one or more options based on their requirements and preferences.

## Logs

During the execution of the script, logs are generated to track the progress and outcomes of each installation task. Logs are saved in the `log` directory within the script's directory. Each log file is prefixed with a specific identifier indicating the type of installation:

- **system_YYYYMMDD.log**: Logs related to system package installation.
- **media_YYYYMMDD.log**: Logs related to media package installation.
- **web_YYYYMMDD.log**: Logs related to web-related package installation.
- **editor_YYYYMMDD.log**: Logs related to editor package installation.
- **settings_YYYYMMDD.log**: Logs related to settings configuration.
- **docker_YYYYMMDD.log**: Logs related to Docker installation.
- **app_YYYYMMDD.log**: Logs related to application-specific package installation.
- **restore_YYYYMMDD.log**: Logs related to the restore process.
- **backup_YYYYMMDD.log**: Logs related to the backup process.

These logs can be referenced for troubleshooting purposes in case of installation errors or issues.

## Notes

- **Internet Connection**: Ensure a stable internet connection during the execution of the script to prevent interruptions during package installation.
- **Manual Installation**: If any package installation fails, users can attempt manual installation using the provided error messages and instructions.
- **Use at Own Risk**: The script is provided as-is without any warranty. Users are advised to use it at their own risk and review the script's contents before execution.

For any further assistance or inquiries, refer to the documentation or contact the script's author.

