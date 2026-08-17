#!/bin/bash
#copyright 2026 Theron Kauk and John Morris Beck all rights reserved


# Automatically look up the pod associated with the container
pod_id="$1"
container_id="$2"
file="$3"

#may be a security leak if /tmp/script.sh isnt deleted after running

podman cp "$container_id" "$file":/tmp/script.sh
podman exec -it "$file" /bin/bash /tmp/script.sh
podman pod stop "$pod_id"
