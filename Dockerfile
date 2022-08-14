# Use the following project as an example:
# https://github.com/nicodebo/neovim-docker
# https://github.com/jpbruinsslot/neovim
# https://github.com/bancast/neovim

# Base image to build the container on. And Ubuntu is a good image to start with
# since it contains most of the necessary runtime dependencies. Also Ubuntu is
# quite popular among the masses.
FROM ubuntu:22.10

# Install Neovim & its dependencies.
RUN apt-get update && apt-get install -y neovim git curl

# Cleanup some redundant files & folders to keep the container lean & slim.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the "LANG" environment variable for Neovim is showcase UTF-8 encoded
# files properly.
ENV LANG C.UTF-8

# The command to invoke when Docker runs the container in interactive mode.
ENTRYPOINT [ "nvim" ]
