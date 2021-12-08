#!/bin/sh

api_server=${INPUT_API:-https://api.fr.cloud.gov}
cf api "$api_server"

#(
#    set +x # Disable debugging
#
#    if [[ -z "$INPUT_USER"  || -z "$INPUT_PASSWORD" ]]; then
#        echo Environment must contain INPUT_USER and INPUT_PASSWORD variables.
#        exit 1
#    else
#        cf auth "$INPUT_USER" "$INPUT_PASSWORD"
#    fi
#
#    target_args=""
#    if [[ -n "$INPUT_ORG" ]]; then
#        echo "cloud.gov org was specified"
#        target_args="-o $INPUT_ORG"
#    fi
#    if [[ -n "$INPUT_SPACE" ]]; then
#        echo "cloud.gov space was specified"
#        target_args="${target_args} -s $INPUT_SPACE"
#    fi
#    if [[ -n "$target_args" ]]; then
#        echo "Setting target org and space as specified"
#        cf target $target_args >& /dev/null
#    fi
#)

optional_args=""
#if [[ -n "$INPUT_APPLICATION" ]]; then
#    optional_args="$INPUT_APPLICATION"
#fi
#if [[ -n "$INPUT_MANIFEST" ]]; then
#    if [[ -r "$INPUT_MANIFEST" ]]; then
#        optional_args="${optional_args} -f $INPUT_MANIFEST"
#    else
#        echo "Manifest file '$INPUT_MANIFEST' not found"
#        exit 1
#    fi
#fi

cmd=$1
shift

exec cf $cmd $optional_args $*
