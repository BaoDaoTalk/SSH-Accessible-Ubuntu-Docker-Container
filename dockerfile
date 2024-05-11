ARG UBUNTU_VERSION=latest

FROM ubuntu:${UBUNTU_VERSION}

# Set non-interactive installation mode and other environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    sudo \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd

# Configure the `ubuntu` user and permissions
RUN if getent passwd ubuntu > /dev/null 2>&1; then \
        echo "User ubuntu already exists"; \
    else \
        useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu; \
    fi \
    && echo 'ubuntu:ubuntu' | chpasswd \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
