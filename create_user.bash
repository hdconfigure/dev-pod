if id "user" &>/dev/null; then
    echo "User already exists. Skipping creation." > /dev/stderr
else
    useradd -m -s /bin/bash user && usermod -aG sudo user
fi
passwd user
