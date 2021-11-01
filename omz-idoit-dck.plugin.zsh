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

#todo: use docker credential storage instead of volatile credentials
alias dck_lgn='docker_login $1 $2'

#terraform
alias trf='docker run -it -w="/.terraform" -v $(pwd)/:/.terraform/ hashicorp/terraform:1.0.7'

#gradle
alias gradle='docker run -it -w="/project" -v $(pwd)/:/project gradle:7.2-jdk17 gradle'

#nodejs
alias npm='docker run -it -v $(pwd)/:/project/ -w /project node:slim npm $2'

#openapi
alias openapi-generator-cli='docker run -it -v $(pwd)/:/project/ -w /project openapitools/openapi-generator-cli:latest-release'

#devops
alias devops='docker run -it -v $(pwd)/:/project/ salvax86/tools:2.0.0 /bin/bash'

#container-structure-tests
#example test --image salvax86/tools --config test/tests.yaml
alias cst='docker run -it -v $(pwd):/project -w /project -v /var/run/docker.sock:/var/run/docker.sock gcr.io/gcp-runtimes/container-structure-test:latest $@'
