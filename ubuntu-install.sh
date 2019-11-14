echo Instalador 

mkdir robocup-source
cd robocup-source

echo Instalando pacotes essensiais para compilação
sudo apt-get install -y build-essential libboost-all-dev g++

echo Instalando dependencias
sudo apt-get install -y libqt4-dev libxpm-dev libaudio-dev libxt-dev libpng-dev libglib2.0-dev libfreetype6-dev libxrender-dev libxext-dev libfontconfig-dev libxi-dev git

echo Instalando QT4
sudo apt-get install qt4*

echo Instalando Flex e Bison
sudo apt-get install flex bison

#################################

echo Baixando rcssserver-15.5.0 
wget https://github.com/rcsoccersim/rcssserver/releases/download/rcssserver-15.5.0/rcssserver-15.5.0.tar.gz

echo Extraindo rcssserver-15.5.0 
tar xvzf rcssserver-15.5.0.tar.gz

cd rcssserver-15.5.0
sudo chmod +x configure
./configure
make 
sudo make install

cd ..

#################################

echo Baixando rcssmonitor-15.2.1
wget https://github.com/rcsoccersim/rcssmonitor/releases/download/rcssmonitor-15.2.1/rcssmonitor-15.2.1.tar.gz

echo Extraindo rcssmonitor-15.2.1
tar xvzf rcssmonitor-15.2.1.tar.gz

cd rcssmonitor-15.2.1
sudo chmod +x configure
./configure
make 
sudo make install

cd ..

#################################

echo Baixando rcsslogplayer-15.2.1
wget https://github.com/rcsoccersim/rcsslogplayer/releases/download/rcsslogplayer-15.2.1/rcsslogplayer-15.2.1.tar.gz

echo Extraindo rcsslogplayer-15.2.1
tar xvzf rcsslogplayer-15.2.1.tar.gz

cd rcsslogplayer-15.2.1
sudo chmod +x configure
./configure 
make 
sudo make install

cd ..

#################################

echo Baixando rctools
git clone https://github.com/KN2C/rctools.git

cd rctools/librcsc-4.1.0
sudo chmod +x configure
./configure 
make 
sudo make install

cd ../..

cd ~
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib rcssclient' >> .bashrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib rcssclient

