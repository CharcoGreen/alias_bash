#!/bin/bash
# AUTOR: Daniel Glez dani.flaco0@gmail.com
# Descripción: Instalacion de software importante para entornos de comandos 
# Habituales en mi entorno

# Usuario para docker
UDocker='virtual'

# Descarga y Actualizacion de paquetes
yum update && yum upgrade -y 

# Instalación de paquetes

function install_paq(){

	yum install -y git\
		nano
}


# Instalación de docker


function remove_old_docker(){

	yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
}

function install_docker(){

	# FINGERPRINT 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35"

	yum install -y yum-utils \
  	device-mapper-persistent-data \
  	lvm2

	yum-config-manager \
	    	--add-repo \
    		https://download.docker.com/linux/centos/docker-ce.repo
	
	yum install -y docker-ce
	systemctl start docker
	usermod -aG docker $UDocker
}

# install_paq
remove_old_docker
install_docker
