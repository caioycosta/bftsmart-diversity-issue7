#!/bin/bash
sudo apt install build-essential autoconf libtool make openjdk-8-jdk python-setuptools
cd $HOME
wget https://redirector.gvt1.com/edgedl/go/go1.6.3.linux-amd64.tar.gz
tar -zvxf go1.6.3.linux-amd64.tar.gz
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin




