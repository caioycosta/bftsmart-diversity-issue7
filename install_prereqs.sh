#!/bin/bash
sudo apt install build-essential autoconf libtool make openjdk-8-jdk python-setuptools
pushd $HOME
if [ ! -d go192 ]
then
	if [ ! -f go1.9.2.linux-amd64.tar.gz ]
	then
		wget https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
	fi
	mkdir go192
	pushd go192
	tar -zvxf ../go1.9.2.linux-amd64.tar.gz
	popd
	mv go192/go/* go192/
fi
export GOROOT=$HOME/go192
export PATH=$GOROOT/bin:$PATH
popd




