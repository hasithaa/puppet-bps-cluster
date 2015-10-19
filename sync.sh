#!/bin/bash
sudo service puppetmaster stop
echo "----- Starting cleanup -----"
sudo rm /etc/puppet/modules/ /etc/puppet/hieradata/ -rf
echo "----- Copying Latest code -----"
sudo cp manifests/  modules/  hieradata/ fileserver.conf  hiera.yaml  puppet.conf /etc/puppet/ -rf
sudo service puppetmaster start
sudo service puppetmaster status 