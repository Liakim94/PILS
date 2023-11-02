#!/bin/zsh

echo "Start... cf push -f manifest-cloud-green.yml"
echo ""

export https_proxy=http://192.168.0.204:808

cf target -s 납품대금연동제

cf push -f manifest-green.yml --no-start

#cf bind-service pis-green redis-instance

cf bind-service pis-green pinpoint-instance -c "{\"application_name\":\"pis-green\"}"

#cf restage pis-green

cf start pis-green

cf apps

cf map-route pis-green smes.go.kr -n www --path pis

cf map-route pis-green paas.smes-tipa.go.kr -n pis --path pis

cf unmap-route pis-green paas.smes-tipa.go.kr -n pis-green --path pis

cf apps

cf unmap-route pis smes.go.kr -n www --path pis

cf unmap-route pis paas.smes-tipa.go.kr -n pis  --path pis

cf apps

cf stop pis

today=`date +%Y%m%d_%H%M%S`

old_app="pis-old-$today"

cf rename pis $old_app

cf rename pis-green pis

cf apps