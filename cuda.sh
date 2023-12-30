#!/bin/bash

# Verify if GPU is CUDA-enabled
lspci | grep -i nvidia

# Remove previous NVIDIA driver installation
sudo apt-get purge nvidia* -y
sudo apt remove nvidia-* -y
sudo rm /etc/apt/sources.list.d/cuda* -y
sudo apt-get autoremove && sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda* -y

# System update
sudo apt-get update -y
sudo apt-get upgrade -y

# Install essential packages
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev -y
sudo apt-get install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y

# Add PPA repository for NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update -y

# Install NVIDIA driver and dependencies
sudo apt-get install -y cuda-drivers
# sudo apt install libnvidia-common-470 -y
# sudo apt install libnvidia-gl-470 -y
# sudo apt install nvidia-driver-470 -y

# Download and set up CUDA repository
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.3.1/local_installers/cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update -y

# Install CUDA Toolkit 12.3
sudo apt-get -y install cuda-toolkit-12-3

# Set up paths for CUDA
echo 'export PATH=/usr/local/cuda-12.3/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.3/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

# Install cuDNN v11.3
# Register at https://developer.nvidia.com/developer-program/signup
CUDNN_TAR_FILE="cudnn-11.3-linux-x64-v8.2.1.32.tgz"
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.2.1.32/11.3_06072021/cudnn-11.3-linux-x64-v8.2.1.32.tgz
tar -xzvf ${CUDNN_TAR_FILE}

# Copy cuDNN files to CUDA toolkit directory
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-12.3/include 
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-12.3/lib64/
sudo chmod a+r /usr/local/cuda-12.3/lib64/libcudnn*

# Install nvtop for monitoring
sudo apt install nvtop -y

# Verify the installation
nvidia-smi
nvcc -V
