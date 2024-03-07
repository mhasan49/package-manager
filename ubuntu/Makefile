
INVENTORY_FILE=inventory.ini
PLAYBOOK=master.yml
EXTRA_PLAYBOOK = extra.yml
ANSIBLE_PLAYBOOK = ansible-playbook
MINICONDA_LOC="~/home/$(USER)/miniconda3"
PIP_LOC="$(CURRENT_DIR)/venv"
CURRENT_DIR=$(shell pwd)
INVENTOR_LOC="$(CURRENT_DIR)/$(INVENTORY_FILE)"

defalut: help	

.PHONY: venv_pip venv_miniconda clean install_system install_editor install_media install_application install_webbrowser backup restore

venv_pip:
	$(ANSIBLE_PLAYBOOK) $(EXTRA_PLAYBOOK) --tags pip_install

clean:
	rm -rf $(PIP_LOC)
	rm -rf $(MINICONDA_LOC)

install_system:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog10  

install_editor:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog20

install_media:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog30

install_application:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog40

install_webbrowser:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog50

backup:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog60

restore:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTOR_LOC) $(PLAYBOOK) --tags prog70

help:
	@echo ""
	@echo "+-------------------------------------------+"
	@echo "| Usage: make [target]                      |"
	@echo "+-------------------------------------------+"
	@echo "| Targets:                                  |"
	@echo "|                                           |"
	@echo "|   ________Database Operations________     |"
	@echo "|                                           |"
	@echo "|   venv_pip:           Create virtual env  |"
	@echo "|   venv_miniconda:     Create env using    |"
	@echo "|   clean:              Clean venv          |"
	@echo "|   install_media:      Install media       |"
	@echo "|   install_system:     Install system      |"
	@echo "|   install_application: Install application|"
	@echo "|   install_webbrowser: Install webbrowser |"
	@echo "|   backup:             Backup              |"
	@echo "|   restore:            Restore             |"
	@echo "|                                           |"
	@echo "+-------------------------------------------+"


















	



