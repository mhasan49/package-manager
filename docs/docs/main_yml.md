## Purpose

The Ansible playbook consists of tasks aimed at managing package repositories, updating the package cache, removing outdated packages, performing autocleaning, extracting package names from a Python script, installing packages based on the extracted names, and displaying information about installed packages. These tasks ensure system cleanliness and update installed packages to their latest versions.


## File locations

- The `master.yml` file is the main playbook file that includes all the tasks. And is located almost in every role directory.

```
├── ansible.cfg
├── backup
│   └── tasks
│       └── main.yml
├── install_application
│   └── tasks
│       └── main.yml
├── install_cuda
│   └── tasks
│       └── main.yml
├── install_editor
│   └── tasks
│       └── main.yml
├── install_media
│   └── tasks
│       └── main.yml
├── install_system
│   └── tasks
│       └── main.yml
├── install_webbrowser
│   └── tasks
│       └── main.yml
├── inventory.ini
├── Makefile
├── master.yml
└── restore
    └── tasks
        └── main.yml

```

## Tasks Overview

### Task 1: Update apt cache

- **Purpose**: Updates the apt package cache to ensure the latest package information is available.
- **Module Used**: `ansible.builtin.apt`
- **Options**:
  - `update_cache`: Ensures the cache is updated.
  - `cache_valid_time`: Sets the cache validity time to 3600 seconds.
- **Notes**:
  - Error handling is implemented with `ignore_errors` set to true.
  - Tagged with `system` (commented out).

### Task 2: Remove outdated packages

- **Purpose**: Removes outdated packages from the system.
- **Module Used**: `ansible.builtin.apt`
- **Options**:
  - `autoremove`: Removes outdated packages automatically.
- **Notes**:
  - Error handling is implemented with `ignore_errors` set to true.
  - Tagged with `system` (commented out).

### Task 3: Autoclean

- **Purpose**: Performs an autoclean operation to remove obsolete package files.
- **Module Used**: `ansible.builtin.apt`
- **Options**:
  - `autoclean`: Cleans up package files.
- **Notes**:
  - Error handling is implemented with `ignore_errors` set to true.

### Task 4: Run a Python script "extract.py" to extract package names

- **Purpose**: Executes a Python script to extract package names.
- **Module Used**: `ansible.builtin.shell`
- **Options**:
  - `cmd`: Executes the `extract.py` Python script.
  - `chdir`: Specifies the directory where the script is located.
  - `executable`: Sets the executable to `/bin/bash`.
- **Notes**:
  - Output is registered for further use.

### Task 5: Read package names from file

- **Purpose**: Reads package names from a file.
- **Module Used**: `ansible.builtin.shell`
- **Options**:
  - `cat`: Reads the content of the `system.txt` file.
  - `args`: Sets the directory and executable.
- **Notes**:
  - Output is registered for further use.

### Task 6: Show package names

- **Purpose**: Displays the package names extracted from the file.
- **Module Used**: `ansible.builtin.debug`
- **Notes**:
  - Displays the package names extracted in the previous tasks.

### Task 7: Install packages

- **Purpose**: Installs packages extracted from the file.
- **Module Used**: `ansible.builtin.apt`
- **Options**:
  - `update_cache_retries`: Sets the number of retries for updating the cache.
  - `name`: Specifies the package to install.
  - `state`: Sets the state of the package to the latest.
  - `fail_on_autoremove`: Fails if any package is marked for autoremoval.
- **Notes**:
  - The loop iterates over the extracted package names.

### Task 8: Show information about installed packages

- **Purpose**: Displays information about the installed packages.
- **Module Used**: `ansible.builtin.shell`
- **Notes**:
  - The loop iterates over the extracted package names.
  - Output is registered for further use.

## Debugging

The playbook includes debug tasks (commented out) to assist in troubleshooting if needed. These tasks can be uncommented and executed to inspect variables or debug specific tasks.

## Notes

- Ensure the Python script `extract.py` is available in the specified directory.
- Review the playbook and customize it according to specific system requirements.
- Error handling is implemented for robustness, but manual intervention may be required in case of errors or unexpected behavior.
- Ensure proper permissions and directory paths are set for executing tasks successfully.

For any further assistance or inquiries, refer to the playbook documentation or contact the playbook's author.

