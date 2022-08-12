# 🍱 A Containerised Neovim Environment

[![Docker Image](https://github.com/Jarmos-san/neovim-docker/actions/workflows/publish.yml/badge.svg)](https://github.com/Jarmos-san/neovim-docker/actions/workflows/publish.yml) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Jarmos-san/neovim-docker?color=%23181717&label=Size&logo=github) ![GitHub](https://img.shields.io/github/license/Jarmos-san/neovim-docker?label=License&logo=github) ![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FJarmos-san%2Fneovim-docker)

This repository contains the source code for working on a containerised Neovim
environment. I use this project to experiment with various Neovim configurations
which otherwise would be difficult on my work environment. Containerising a
Neovim environment takes away the pain of backing older configuration &
replacing them once I'm done experimenting with newer Neovim configurations.

So, if you work with or have a keen interest in using Neovim, this containerised
environment is perfect for experimentation. You simply need to _pull_ the Docker
image from the registry, see how things work out & delete the container (_and
the image_) after you're done!

## 🦮 How to Use the Project

The project is easy to use but before you get started using the project, there
are a few prerequisite tools you'll need in your local system. So ensure you at
least have the following tools installed before proceeding ahead:

- [Docker](https://www.docker.com)
- A modern Terminal Emulator (I suggest going with
  [Kitty](https://sw.kovidgoyal.net/kitty))

With the prerequisite tools downloaded & setup, run the following command on
your preferred terminal:

```bash
docker pull ghcr.io/jarmos-san/neovim-docker:main
docker run -it --rm ghcr.io/jarmos-san/neovim-docker

# For local development, copy the Neovim configurations from the source code
# repository & then run the following commands to build an ephemeral container.
# docker run -it --rm -v $(pwd):/root/.config/nvim ghcr.io/jarmos-san/neovim-docker
```

The command will open up an interactive Neovim instance & the built container
will also be immediately removed when you exit the Neovim environment!

## 📚 Informative Resources for Learning About the Tools

Neovim has a significant learning curve but its worthwhile especially for
power-users (_and if you suffer from
[Carpal Tunnel Syndrome (CTS)](https://www.ninds.nih.gov/carpal-tunnel-syndrome-fact-sheet)_).
So for all the beginners out there, following are some resources which you might
find useful while learning the tools in use:

- [OpenVim](https://www.openvim.com) which is an web-based platform to learn
  more about navigating around in Vim (_or Neovim_).
- [Vim Adventures](https://vim-adventures.com) is a web-based game for teaching
  Vim in a fun, interactive format.
- [Docker Playground](https://www.docker.com/play-with-docker) to learn Docker
  right from within your favourite browser.

## 📄 Usage Terms & Conditions

The project is licensed under the terms & conditions (T&Cs) for the MIT license.
So, you free to use, distribute, copy, modify & such with the contents of this
repository in whatever manner you want to. The caveat is, your usage should
adhere to the T&Cs of the MIT license.

For more information on the licensing T&Cs, feel free to refer to the
[LICENSE](./LICENSE) document.
