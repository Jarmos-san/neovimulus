# Use the following project as an example:
# https://github.com/nicodebo/neovim-docker
# https://github.com/jpbruinsslot/neovim
# https://github.com/bancast/neovim

FROM ubuntu:22.10

RUN apt-get update && apt-get install -y neovim

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "nvim" ]
