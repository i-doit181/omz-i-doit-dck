#easy work
##open yml,yaml,json,properties files directly with vim
alias -s {yml,yaml,json,properties}=vim
##pipeline with grep
alias -g G=' | grep -i'
#docker
function docker_login() {
  local proxy=${1:-"index.docker.io"}
  if [ -z ${2+x} ]
    then echo 'username is not set!'
  else
    echo "login to ${proxy} with username ${2}";
    docker login ${proxy} --username ${2}
  fi
}

alias dck_lgn='docker_login $1 $2'

#terraform
alias trf='docker run -it -w="/.terraform" -v $(pwd)/:/.terraform/ hashicorp/terraform:1.0.7'

#devops
alias devops='docker run -it -v $(pwd)/:/project/ salvax86/tools:2.0.0 /bin/bash'

