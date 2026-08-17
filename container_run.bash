#!/bin/bash
#copyright 2026 Theron Kauk and John Morris Beck all rights reserved

# $1 = container name/ID, $2 = path to script to execute inside container, $3 = pod name to stop

podman cp "$2" "$1":/tmp/script.sh
podman exec -it "$1" /bin/bash /tmp/script.sh
podman pod stop "$3"
