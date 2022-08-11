# Use the following project as an example:
# https://github.com/nicodebo/neovim-docker

FROM ubuntu:22.10

RUN apt-get update && apt-get install -y neovim

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "nvim" ]
