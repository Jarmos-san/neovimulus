# Base image to build the container on. And Ubuntu is a good image to start with
# since it contains most of the necessary runtime dependencies. Also Ubuntu is
# quite popular among the masses.
FROM ubuntu:22.10

# Ensure the container starts into the Neovim configuration directory.
WORKDIR /root/.config/nvim

# Install some necessary tools for the container environment to work properly
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    curl \
    unzip \
    wget

# Necessary for Git to work properly.
RUN update-ca-certificates

# Set the "LANG" environment variable for Neovim is showcase UTF-8 encoded
# files properly.
ENV LANG C.UTF-8

# Download & install the latest version of Neovim.
RUN LATEST_VERSION=$(curl --silent "https://api.github.com/repos/neovim/neovim/releases/latest" \
                        | grep tag_name \
                        | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget "https://github.com/neovim/neovim/releases/download/$LATEST_VERSION/nvim-linux64.deb" && \
    apt-get install ./nvim-linux64.deb && \
    rm --recursive --force ./nvim-linux64.deb

# Install "packer.nvim" to install the Neovim plugins.
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    /root/.local/share/nvim/site/pack/packer/opt/packer.nvim

# The command to invoke when Docker runs the container in interactive mode.
ENTRYPOINT [ "/usr/bin/bash" ]
