# About the packages.txt File

The `packages.txt` file serves as a configuration file containing a list of packages that the installation script will handle. Users can customize this file to include or exclude packages according to their preferences. The structure of the file is organized into categories, each preceded by a section header denoted by `#`.

## File Structure

The `packages.txt` file follows this structure:

```plaintext
#-------------system
make
htop
git
fish

#-------------------editors
nano
vim
gedit

#------------------media

vlc
gimp
inkscape

#------------------webbrowser

google-chrome-stable
mozilla-firefox

#----------------------application
gnuplot
```

- The `#` symbol at the beginning of a line indicates a comment and is ignored during processing.
- Each category is separated by a section header, starting with `#-------------`.
- Under each section header, package names are listed one per line, representing the packages to be installed in that category.

## Usage of Extract.py Script

Additionally, there is a Python script named `extract.py`, which facilitates the extraction of package names from `packages.txt`. This script creates a new file named `system.txt`, specifically containing package names for system-related packages. The `system.txt` file is then utilized by the Ansible playbook to install the specified packages.

The workflow involving the `extract.py` script is as follows:

1. The `extract.py` script reads the `packages.txt` file.
2. It extracts package names categorized under the `system` section.
3. The extracted package names are written to a new file named `system.txt`.
4. The Ansible playbook utilizes the `system.txt` file to install the system-related packages.

This structured approach allows for easy management and customization of packages, streamlining the installation process according to user requirements.

