#!/bin/bash

# 1- Download the script: wget https://gist.githubusercontent.com/maky-hnou/bbb936857a67a614e9fba0dbe2c87233/raw/889b2cf637a6c1af8dc886a996276e7878ed4187/install_cuda10.1_ubuntu18.04.sh
# 2- sudo chmod +x install_cuda10.1_ubuntu18.04.sh
# 3- sudo ./install_cuda10.1_ubuntu18.04.sh
# 4- Restart your computer.

if [[ $EUID -ne 0 ]];then echo "Please run as root";exit 1;fi
if [ ! -n "$BASH" ];then echo Please run this script $0 with bash;exit 1;fi

echo "***************Removing Nvidia***************"
# Let's start clean!
apt purge -y nvidia*
apt remove -y nvidia-*
rm /etc/apt/sources.list.d/cuda*
apt autoremove -y && apt autoclean -y
rm -rf /usr/local/cuda*

echo "***************Upgrading***************"
# Update the system
apt update
apt upgrade -y

echo "***************Installing dependencies***************"
# Install some dependencies
apt install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev


# Add the CUDA PPA
add-apt-repository ppa:graphics-drivers/ppa -y
echo "***************Adding CUDA rep Key***************"
apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub -y
echo "***************Adding CUDA repo to sources.list***************"
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | tee /etc/apt/sources.list.d/cuda.list
echo "***************Downloading CUDA repo***************"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
echo "***************Installing CUDA repo***************"
apt install -y ./cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
echo "***************Updating***************"
apt update
echo "***************Downloading machine learning repo***************"
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
echo "***************Installing machine learning repo***************"
apt install -y ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb


# Run update
echo "***************Updating***************"
apt update

# Install Nvidia Driver 440
echo "***************Installing Nvidia Drivers***************"
apt install -y nvidia-driver-440

# Install cuda 10.1
echo "***************Installing CUDA***************"
apt-get install -y --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.5.32-1+cuda10.1  \
    libcudnn7-dev=7.6.5.32-1+cuda10.1

# Install tensorrt 6.0.1
echo "***************Installing Tensorrt***************"
apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 \
    libnvinfer-dev=6.0.1-1+cuda10.1 \
    libnvinfer-plugin6=6.0.1-1+cuda10.1



# Setup CUDA paths
echo "***************Setting CUDA paths***************"
echo 'export PATH=/usr/local/cuda-10.1/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
echo "***************Running ldconfig***************"
ldconfig


# Install Tensorflow-gpu==1.15.2
# pip3 install --user tensorflow-gpu==1.15.2

# Ref1: https://gist.github.com/Mahedi-61/2a2f1579d4271717d421065168ce6a73
# Ref2: https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_101
