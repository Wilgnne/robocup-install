echo Instalador 

mkdir robocup-source
cd robocup-source

echo Instalando pacotes essensiais para compilação
sudo dnf install -y @development-tools boost boost-devel g++

echo Instalando dependencias
sudo dnf install -y qt-devel qt automoc git
sudo dnf install -y libQtCore.so.4 libQtGui.so.4 libQtNetwork.so.4 libboost_program_options.so.1.69.0 libc.so.6 libgcc_s.so.1 libm.so.6 libstdc++.so.6 rtld

echo Instalando Flex e Bison
sudo dnf install flex* bison*

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

wget http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/30/Everything/x86_64/os/Packages/r/rcssmonitor-15.1.1-27.fc30.x86_64.rpm
sudo dnf install rcssmonitor-15.1.1-27.fc30.x86_64.rpm

#echo Extraindo rcssmonitor-15.2.1
#tar xvzf rcssmonitor-15.2.1.tar.gz

#cd rcssmonitor-15.2.1
#sudo chmod +x configure

#./configure
#make 
#sudo make install

#cd ..

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

