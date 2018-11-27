# Alias Debian

# Upgrade system
alias upup='apt-get update && apt-get upgrade'
alias onlyup='apt-get update'

# For user su
# Alias for CentOS
# Actualizar sistema
alias onlyup='yum update'  
alias upup='yum update && yum upgrade'
# Restablecer red 
alias restens33='ifdown ens33 && ifup ens33'
#init


# Docker Alias

alias dps='docker ps'
alias di='docker inspect '
alias ds='docker service'
alias dsvc='docker service'
alias dnet='docker network'
alias dneti='docker network inspect'
alias dnode='docker node'
alias dvol='docker volume'
alias dimages='docker images'
alias dcont='docker ps -a'
alias dsf='docker service ls --format'
alias dexec='docker exec -ti'
