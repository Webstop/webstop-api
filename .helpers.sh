#!/usr/bin/env bash

#FAILED_CHECKS=false

# args:
#   $1 - service
#   $2 - .env var name
#check_service_ports() {
#  if [[ $(docker-compose ps $1 | grep Up | wc -l) -eq 0 ]]; then
#    # get service host port
#    EGREP_EXPRESSION="$2=\d+"
#    SED_STATEMENT="s/^.*$2=([0-9]+).*$/\1/"
#    PORT=$(cat .env | egrep "$EGREP_EXPRESSION" | sed -E "$SED_STATEMENT")
#    if [[ $(nc -vz 127.0.0.1 $PORT 2>&1 | grep succeeded | wc -l) -eq 1 ]]; then
#      echo "ERROR: \"$1\" port $PORT is already in use on host!"
#      FAILED_CHECKS=true
#    fi
#  fi
#}

# call this then check status in $? - 0=success, 1=fail
#check_all_service_ports() {
#  check_service_ports mysql EXPOSED_DB_PORT
#  check_service_ports web EXPOSED_WEB_PORT
#  check_service_ports redis EXPOSED_REDIS_PORT
#
#  if [[ $FAILED_CHECKS = true ]]; then
#    echo
#    echo "You appear to have other services running on your laptop already with the same ports."
#    echo "Either stop those other services or change the EXPOSED ports for this docker-compose"
#    echo "project.  See the 'Port collisions' section under 'Troubleshooting' in the README."
#    return 1
#  else
#    return 0
#  fi
#}

# ensure that .bash_history file is setup correctly
if [[ -d .bash_history ]]; then
  echo
  echo "  fixing .bash_history"
  echo
  rm -r .bash_history
fi
if [[ ! -f .bash_history ]]; then
  echo
  echo "  creating .bash_history to persist bash history for container"
  echo
  echo 'echo "commands executed on bash command line in docker container will be persisted here"' > .bash_history
fi

# ensure that .irb_history file is setup correctly
if [[ -d .irb_history ]]; then
  echo
  echo "  fixing .irb_history"
  echo
  rm -r .irb_history
fi
if [[ ! -f .irb_history ]]; then
  echo
  echo "  creating .irb_history to persist irb & rails console history for container"
  echo
  echo 'puts "commands executed in irb or rails console in docker container will be persisted here"' > .irb_history
fi

# ensure that .mysql_history file is setup correctly
#if [[ -d .mysql_history ]]; then
#  echo
#  echo "  fixing .mysql_history"
#  echo
#  rm -r .mysql_history
#fi
#if [[ ! -f .mysql_history ]]; then
#  echo
#  echo "  creating .mysql_history to persist mysql cli history for container"
#  echo
#  echo 'show databases;' > .mysql_history
#fi

# automatically remove stopped named container if blocking
# compose_prefix="$(echo "$(basename $(pwd))" | tr '[:upper:]' '[:lower:]')"
#if [ "$(docker ps -aq -f status=exited -f name=core-web)" ]; then
#  echo "  NOTE: cleaning up exited container: core-web"
#  # echo "$(docker ps -a -f status=exited -f name=core-web)"
#  docker rm core-web
#  echo
#  echo
#fi
