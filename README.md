# AmazonKinesisProducerCpp

## Cross-compile Environment (armhf)

### OS
Tested Debian 10.7.0-amd64 on VirtualBox

### Packages
```
sudo apt install git build-essential cmake g++ wget curl
sudo apt install libssl-dev libcurl4-openssl-dev liblog4cplus-1.1-9 liblog4cplus-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools
```

### Enable Multi-arch for Cross-compiling
```
sudo dpkg --add-architecture armhf
sudo apt update 
sudo apt install libgstreamer1.0-dev:armhf libgstreamer-plugins-base1.0-dev:armhf
```

## Usage

### Build
```
./build_armhf.sh
```

To build linux host app (x86_64),
```
./build_local.sh
```

### Run 
```
cd build && ./run.sh
```
(AWS credentials should be provided in run.sh)
