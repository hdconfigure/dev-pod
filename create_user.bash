if id "user" &>/dev/null; then
    echo "User already exists. Skipping creation." > /dev/stderr
else
    useradd -m -s /bin/bash user && usermod -aG sudo user && mkdir -p /home/user/.ssh && cp /root/.ssh/authorized_keys /home/user/.ssh/ && chown -R user:user /home/user/.ssh && chmod 700 /home/user/.ssh && chmod 600 /home/user/.ssh/authorized_keys
fi
passwd user
