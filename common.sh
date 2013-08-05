source /vagrant/.controller

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update

# Setup Proxy
export APT_PROXY="172.16.0.110"
export APT_PROXY_PORT=3142
#APT_PROXY="192.168.1.1"
#APT_PROXY_PORT=3128
#
# If you have a proxy outside of your VirtualBox environment, use it
if [[ ! -z "$APT_PROXY" ]]
then
	echo 'Acquire::http { Proxy "http://'${APT_PROXY}:${APT_PROXY_PORT}'"; };' | sudo tee /etc/apt/apt.conf.d/01apt-cacher-ng-proxy
fi

# Grizzly Goodness
sudo apt-get -y install ubuntu-cloud-keyring
echo "deb  http://ubuntu-cloud.archive.canonical.com/ubuntu precise-proposed/grizzly main" | sudo tee -a /etc/apt/sources.list.d/grizzly.list
sudo apt-get update

#sudo apt-get -y install
