Before Starting, please do the following steps in client and server side.


A. Server Side

Server Side is designated to be Raspberry Pi. So, it should be running on Linux Environment (e.g Raspbian)

Steps

1. Get the latest version of Raspbian image from Raspberry Pi official site
2. Open Terminal
3. In terminal, type the following commands to install gstreamer framework

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install git libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools -y

git clone https://github.com/nozomiplan/gstreamermulticam.git


4. Open editor to view & edit transmit.sh if necessary (Please make sure IP address must be the host one)

5. Execute ./transmit.sh on host, execute ./receive.sh on client side (for linux, OSX) or receive.bat (Windows)
6. To quit, press Ctrl + C
7. Get 3 newly added mp4 files. Open them with VLC Player or Media Player Classic for view recording


B. Client Side

Steps

1. Install this version of gstreamer for Windows   
    https://gstreamer.freedesktop.org/data/pkg/windows/1.14.4/gstreamer-1.0-x86_64-1.14.4.msi  (64 bit Windows)
    https://gstreamer.freedesktop.org/data/pkg/windows/1.14.4/gstreamer-1.0-x86-1.14.4.msi (32 bit Windows)
2. In selection menu, please click "Install All"
3.  If Client side uses Ubuntu or Rasbian, do the step A3.
4.  Get the code in https://github.com/nozomiplan/gstreamermulticam.git  
5.  execute ./receive.sh on client side (for linux, OSX) or receive.bat (Windows)
6.  To quit, press Ctrl + C

