#!/usr/bin/env bash
docker run --rm --volume "${PWD}":"${PWD}" -v /tmp/:/tmp/ -e PHP_IDE_CONFIG="serverName=application" -w ${PWD} \
    --net=host --sig-proxy=true --pid=host symfony3dockerstarter_php php -d xdebug.remote_port=9001 -d xdebug.remote_host=172.17.0.1 "$@"