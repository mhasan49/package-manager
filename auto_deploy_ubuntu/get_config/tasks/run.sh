#!/bin/bash


sudo apt install python3 python3-dev git curl
git clone https://github.com/jupyterhub/jupyterhub
chmod 777 jupyterhub	
cd jupyterhub
sudo npm install -g configurable-http-proxy
python3 -m pip install -r dev-requirements.txt
python3 -m pip install -r requirements.txt
python3 -m pip install --editable .
jupyterhub -f testing/jupyterhub_config.py

