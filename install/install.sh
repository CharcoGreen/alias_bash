#!/bin/bash
# AUTOR: Daniel Glez dani.flaco0@gmail.com
# Descripción: Instalacion de software importante para entornos de comandos 
# Habituales en mi entorno CentOS

# Usuario para docker
UDocker='virtual'

# Descarga y Actualizacion de paquetes

function update_upgrade(){

	yum update && yum upgrade -y 

}

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

# Instalación de docker

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

# Instalar docker-machine

function install_docker_machine(){

	base=https://github.com/docker/machine/releases/download/v0.14.0 &&
  	curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  	sudo install /tmp/docker-machine /usr/local/bin/docker-machine
	
	docker-machine version

	# instalación de script complementarios 
	
	base=https://raw.githubusercontent.com/docker/machine/v0.14.0
	for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
	do
  		wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
	done
}

# Instalar docker compose

function install_docker_compose(){

	curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	docker-compose --version
}



# init

function init(){

	update_upgrade
	# install_paq
	# remove_old_docker
	# install_docker
	# install_docker_machine
	install_docker_compose
}


init
