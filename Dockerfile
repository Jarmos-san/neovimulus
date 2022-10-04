# Base image to build the container on. And Ubuntu is a good image to start with
# since it contains most of the necessary runtime dependencies. Also Ubuntu is
# quite popular among the masses.
FROM ubuntu:22.10

# Install some necessary tools for the container environment to work properly
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq --no-install-recommends \
    apt-transport-https ca-certificates build-essential neovim=0.7.2 git curl unzip && \
    apt-get clean && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN update-ca-certificates

# Set the "LANG" environment variable for Neovim is showcase UTF-8 encoded
# files properly.
ENV LANG C.UTF-8

# Install "packer.nvim" to install the Neovim plugins.
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    /root/.local/share/nvim/site/pack/packer/start/packer.nvim

WORKDIR /root/.config/nvim

# The command to invoke when Docker runs the container in interactive mode.
ENTRYPOINT [ "/usr/bin/bash" ]
