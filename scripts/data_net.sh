sudo apt -y install iperf3
sudo apt update && sudo apt install net-tools traceroute ping whois dnsutils curl -y

sudo apt -y install build-essential linux-headers-generic make git wget tar linux-modules-extra-$(uname -r)
wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile
git clone https://github.com/HewlettPackard/PacketRusher
cd PacketRusher
echo "export PACKETRUSHER=$PWD" >> $HOME/.profile && source $HOME/.profile
cd $PACKETRUSHER/lib/gtp5g
make clean && make -j && sudo make install
cd $PACKETRUSHER
go mod download
go build cmd/packetrusher.go