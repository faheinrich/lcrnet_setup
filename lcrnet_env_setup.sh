
mkdir -p lcrnet_env && cd lcrnet_env

# MINICONDA_INSTALLER_SCRIPT=Miniconda3-4.5.4-Linux-x86_64.sh
# MINICONDA_PREFIX=/usr/local
# wget -nc https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT
# chmod +x $MINICONDA_INSTALLER_SCRIPT
# ./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX

# conda update -y -n base conda



git clone https://github.com/roytseng-tw/Detectron.pytorch
# git clone https://github.com/roytseng-tw/mask-rcnn.pytorch.git

wget -nc http://pascal.inrialpes.fr/data2/grogez/LCR-Net/LCRNet_v2.0.zip
unzip -o LCRNet_v2.0.zip



conda env remove -y -n lcrnet
conda create -n lcrnet -y python=2.7

echo ------------------------------------------------
echo ------------------------------------------------

source activate lcrnet

which python
python --version

echo ------------------------------------------------
echo ------------------------------------------------

# laut readme cuda 7 und 9 getestet
# conda install -y pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=9.2 -c pytorch
# conda install -y pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=9.0 -c pytorch
# conda install -y pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=9.0 -c pytorch
# conda install -y pytorch==1.0 torchvision==0.2.2 cudatoolkit=9.0 -c pytorch
# conda install -y pytorch==1.0 torchvision==0.2.2 cuda90 -c pytorch
# conda install -y pytorch==0.4 cuda90 cudatoolkit=9.0 -c pytorch
conda install -y pytorch=0.4.1 cuda90 cudatoolkit=9.0 -c pytorch
# conda install -y pytorch==1.2.0 torchvision==0.4.0 cudatoolkit=10.0 -c pytorch

echo ------------------------------------------------
echo ------------------------------------------------

conda install -y -c conda-forge opencv

echo ------------------------------------------------
echo ------------------------------------------------

conda install -y -c conda-forge nvcc_linux-64
export CUDA_HOME='/usr/local/cuda-9.0'
echo $CUDA_HOME
nvcc --version
which nvcc

echo ------------------------------------------------
echo ------------------------------------------------

pip install cython matplotlib numpy scipy pyyaml packaging pycocotools h5py cffi Pillow

echo ------------------------------------------------
echo ------------------------------------------------

cd Detectron.pytorch/lib
sh make.sh
cd ../..

echo ------------------------------------------------
echo ------------------------------------------------

# mv ~/lcrnet_env/mask-rcnn.pytorch ~/lcrnet_env/Detectron.pytorch
ln -s ~/lcrnet_env/Detectron.pytorch ~/lcrnet_env/LCRNet_v2.0/ --force

echo ------------------------------------------------
echo ------------------------------------------------

cd LCRNet_v2.0
python demo.py InTheWild-ResNet50 058017637.jpg 0




