#!/bin/bash


# Declaracion de Alias
alias	upup='yum update && yum upgrade -y'
alias 	install='yum install -y'


# Instalacion de software importante para entornos de comandos

upup
install git 
install nano
