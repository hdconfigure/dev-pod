#!/bin/bash
#copyright 2026 Theron Kauk and John Morris Beck all rights reserved
# 1. Create the pod with port 8080 mapped
podman pod create --name "$1" -p 8080:8080

# 2. Spin up an interactive Debian container inside that pod
podman run -it --pod "$1" --name "$2" debian:stable /bin/bash
