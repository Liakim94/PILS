
cf push -f manifest-green.yml --no-start

cf bind-service pis-green redis-instance

cf bind-service pis-green pinpoint-instance -c "{\"application_name\":\"pis-green\"}"

cf restage pis-green

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

cf rename pis pis-old-0320a

cf rename pis-green pis