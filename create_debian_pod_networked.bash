#!/bin/bash
#copyright 2026 Theron Kauk and John Morris Beck all rights reserved

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "cannot pass empty arguments into container creator" >&2
    exit 1
elif podman pod exists "$1" && podman container exists "$2"; then
    echo "Pod $1 and container $2 already exist. Doing nothing." >&2
else
    # 1. Create the pod with port 8080 mapped
    podman pod create --name "$1" -p 8080:8080

    # 2. Spin up an interactive Debian container inside that pod
    podman run -d --init --pod "$1" --name "$2" debian:stable sleep infinity
#    podman run -d --pod "$1" --name "$2" debian:stable sleep infinity
fi
