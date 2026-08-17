#!/bin/bash
#copyright 2026 Theron Kauk and John Morris Beck all rights reserved

# $1 = container name/ID, $2 = path to script to execute inside container

# Automatically look up the pod associated with the container
pod_id="$(podman inspect --format '{{.Config.Pod}}' "$1" 2>/dev/null || podman inspect --format '{{.HostConfig.Pod}}' "$1" 2>/dev/null)"

#old pod id in case I need to rollback
#pod_id="$(podman inspect --format '{{.HostConfig.Pod}}' "$1")"

#i think the tmpfile cleans itself on comtainer shutdown
# Ensure the temporary script is removed from the container upon exit, interruption, or termination
#cleanup() {
 #   podman exec "$1" rm -f /tmp/script.sh 2>/dev/null
#}
#trap cleanup EXIT INT TERM HUP QUIT

podman cp "$2" "$1":/tmp/script.sh
podman exec -it "$1" /bin/bash /tmp/script.sh
podman pod stop "$pod_id"
