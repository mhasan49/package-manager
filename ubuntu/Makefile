
all: ansible install_software 

ansible:
	
	 sudo apt update
	 sudo apt install software-properties-common
	 sudo add-apt-repository --yes --update ppa:ansible/ansible
	 sudo apt install ansible
	
	
inventory_file := "[default] \nlocalhost    ansible_connection=local"

ansible_config_file := "[defaults] \ninventory = inventory \nhost_key_checking = False\
			\ndeprecation_warnings=False"


config:
	
	echo $(inventory_file) >> inventory
	echo $(ansible_config_file) >> ansible.cfg
ping:
	ansible all -m ping

install_software:
	
	ansible-playbook  master.yml
	

clean:
	rm inventory *.cfg

remove:
	sudo apt remove docker -y
	sudo apt remove portainer -y
	sudo apt remove python3 -y
