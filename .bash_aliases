# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Get names of all containers
alias docker-containers='docker ps -a | awk '"'"'{if(NR>1) print $NF}'"'"''
# Get ids of all containers
alias docker-container-ids='docker ps -a | awk '"'"'{print $1}'"'"''
# Get names of all images
alias docker-images='docker images | awk '"'"'{if(NR>1) print $1 ":" $2}'"'"''
# Remove all dangling docker images
alias docker-rmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)' 
# Shorcut for updating and upgrading packages
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y'
# Shortcut for updating the dotfiles repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
