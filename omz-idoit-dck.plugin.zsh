#easy work
##open yml,yaml,json,properties files directly with vim
alias -s {yml,yaml,json,properties}=vim

##pipeline with grep
alias -g G=' | grep -i'

function start_lima() {
  docker ps

  check=$?

  if [ "$check" -eq 1 ]; then
    echo "start vm"
    sleep 1
    limactl start $HOME/lima_machines/docker.yaml --tty=false
    echo "started vm"
  else
    echo "vm already started"
  fi
}

function stop_lima() {
  limactl stop docker && limactl delete docker
}

#docker
function start_podman() {
  local vmName=${1:-"workstation"}
  echo 'init podman vm'
  podman machine init --cpus=1 --disk-size=1024 --memory=1024 ${vmName}
  echo 'start podman vm'
  podman machine start ${vmName}
}

function destroy_podman() {
  local vmName=${1:-"workstation"}
  echo 'stop podman vm'
  podman machine stop ${vmName}
  echo 'destroy podman vm'
  podman machine rm ${vmName}
}

function docker_login() {
  local proxy=${1:-"index.docker.io"}
  if [ -z ${2+x} ]
    then echo 'username is not set!'
  else
    echo "login to ${proxy} with username ${2}";
    docker login ${proxy} --username ${2}
  fi
}

#alias docker='podman'
alias dck_lgn='docker_login $1 $2'

#alias dck_start='start_podman $1'
#alias dck_destroy='destroy_podman $2'
alias dck_start='start_lima'
alias dck_destroy='stop_lima'

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
