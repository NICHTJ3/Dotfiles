#!/usr/bin/env bash

set -e

MYNAME=${0##*/}  # Short program name for diagnostic messages.
INSTALL_CONFIG_FILE="install.conf.yaml"
CONFIGS=$(ls configs | grep -vFxf .dots-ignore)

META_DIR="."
CONFIG_DIR="configs"
PROFILES_DIR="profiles"

DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

profile=""  # Default to empty package

# Create an array of 1's representing an option is available to be installed
declare -A AVAILABLE_CONFIG
for constant in $CONFIGS
do
  AVAILABLE_CONFIG[$constant]=1
done


# Parse options to the `install` command
while getopts ":h" opt; do
  case ${opt} in
    h )
      echo "Usage:"
      echo "    ${MYNAME} -h                      Display this help message."
      echo "    ${MYNAME} install -p <profile>       Install <profile>."
      echo "    ${MYNAME} install <config>       Install <config>."
      echo "    ${MYNAME} uninstall -p <profile>       Uninstall <profile>."
      echo "    ${MYNAME} uninstall <config>       Uninstall <config>."
      exit 0
      ;;
   \? )
     echo "Invalid Option: -$OPTARG" 1>&2
     exit 1
     ;;
  esac
done
shift $((OPTIND -1))

subcommand=$1; shift  # Remove 'pip' from the argument list
case "$subcommand" in
  # Parse options to the install sub command
  install)
    # Process package options
    while getopts ":p:" opt; do
      case ${opt} in
        p )
          profile=$OPTARG
          while IFS= read -r config; do
            CONFIGS_TO_INSTALL+=" ${config}"
          done < "${META_DIR}/${PROFILES_DIR}/$profile/${INSTALL_CONFIG_FILE}"
          ;;
        \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          exit 1
          ;;
        : )
          echo "Invalid Option: -$OPTARG requires an argument" 1>&2
          exit 1
          ;;
      esac
    done
    shift $((OPTIND -1))

    echo ${CONFIGS_TO_INSTALL} ${@}

    for config in ${CONFIGS_TO_INSTALL} ${@}; do
      echo -e "\nConfigure $config"
      if [[ ${AVAILABLE_CONFIG[$config]} ]];then
        "${BASE_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASE_DIR}/$CONFIG_DIR/$config" -c "${BASE_DIR}/$CONFIG_DIR/$config/${INSTALL_CONFIG_FILE}"
      else
        echo "Config: $config was not available."
      fi
    done
    ;;
  uninstall)
    # Process package options
    while getopts ":p:" opt; do
      case ${opt} in
        p )
          profile=$OPTARG
          while IFS= read -r config; do
            CONFIGS_TO_UNINSTALL+=" ${config}"
          done < "${META_DIR}/${PROFILES_DIR}/$profile/${INSTALL_CONFIG_FILE}"
          ;;
        \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          exit 1
          ;;
        : )
          echo "Invalid Option: -$OPTARG requires an argument" 1>&2
          exit 1
          ;;
      esac
    done
    shift $((OPTIND -1))

    echo ${CONFIGS_TO_UNINSTALL} ${@}

    for config in ${CONFIGS_TO_UNINSTALL} ${@}; do
      echo -e "\nConfigure $config"
      if [[ ${AVAILABLE_CONFIG[$config]} ]];then
        ${BASE_DIR}/scripts/uninstall "${BASE_DIR}/$CONFIG_DIR/$config/${INSTALL_CONFIG_FILE}"
      else
        echo "Config: $config was not available."
      fi
    done
    ;;
esac
