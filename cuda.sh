#!/bin/bash

# The script will first check if the NVIDIA driver is installed, remove it if it is, and 
# then install the CUDA driver.
### to verify your gpu is cuda enable check
lspci | grep -i nvidia

### If you have previous installation remove it first. 
sudo apt-get purge nvidia* -y
sudo apt remove nvidia-*  -y
sudo rm /etc/apt/sources.list.d/cuda* -y
sudo apt-get autoremove && sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda* -y

# system update
sudo apt-get update -y
sudo apt-get upgrade -y

# install other import packages
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev -y
sudo apt-get install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y

# first get the PPA repository driver
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update -y

# install nvidia driver with dependencies
sudo apt install libnvidia-common-470 -y
sudo apt install libnvidia-gl-470  -y
sudo apt install nvidia-driver-470 -y

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub 
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update -y
 
 # installing CUDA-11.3
sudo apt install cuda-11-3 -y

# setup your paths
echo 'export PATH=/usr/local/cuda-11.3/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

# install cuDNN v11.3
# First register here: https://developer.nvidia.com/developer-program/signup

CUDNN_TAR_FILE="cudnn-11.3-linux-x64-v8.2.1.32.tgz"
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.2.1.32/11.3_06072021/cudnn-11.3-linux-x64-v8.2.1.32.tgz
tar -xzvf ${CUDNN_TAR_FILE}

# copy the following files into the cuda toolkit directory.
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-11.3/include 
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-11.3/lib64/
sudo chmod a+r /usr/local/cuda-11.3/lib64/libcudnn*

sudo apt install nvtop -y
# Finally, to verify the installation, check
nvidia-smi
nvcc -V

# install Pytorch (an open source machine learning framework)
#pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113