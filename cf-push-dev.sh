#!/bin/zsh

echo "Start... cf push -f manifest-cloud-dev.yml"
echo ""

export https_proxy=http://192.168.0.204:808

cf target -s 납품대금연동제

cf push -f manifest-cloud-dev.yml

cf apps