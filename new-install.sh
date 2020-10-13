#!/usr/bin/env bash

set -e

MYNAME=${0##*/}  # Short program name for diagnostic messages.
INSTALL_CONFIG_FILE="install.conf.yaml"

META_DIR="."
CONFIG_DIR="configs"
PROFILES_DIR="profiles"

DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

profile=""  # Default to empty package

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

    # We now know the profile and the have the remaining configs to install
    while IFS= read -r config; do
      CONFIGS+=" ${config}"
    done < "${META_DIR}/${PROFILES_DIR}/$profile"

    echo ${CONFIGS}

    for config in ${CONFIGS} ${@}; do
      echo -e "\nConfigure $config"
      configFile="$(mktemp)" ; echo -e "$(<"${BASE_DIR}/${META_DIR}/${CONFIG_DIR}/${config}/${INSTALL_CONFIG_FILE}")" > "$configFile"
      "${BASE_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASE_DIR}" -c "$configFile" ; rm -f "$configFile"
    done
    ;;
  uninstall) 
    # Process package options
    while getopts ":p:" opt; do
      case ${opt} in
        p )
          profile=$OPTARG
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

    # We now know the profile and the have the remaining configs to install
    while IFS= read -r config; do
      CONFIGS+=" ${config}"
    done < "${META_DIR}/${PROFILES_DIR}/$profile"

    echo ${CONFIGS}

    for config in ${CONFIGS} ${@}; do
      echo -e "\nConfigure $config"
      configFile="$(mktemp)" ; echo -e "$(<"${BASE_DIR}/${META_DIR}/${CONFIG_DIR}/${config}/${INSTALL_CONFIG_FILE}")" > "$configFile"
      ${BASEDIR}/scripts/uninstall $configFile; rm -f "$configFile"
    done
    ;;
esac
