# 🍱 A Containerised Neovim Environment

[![Docker Image](https://github.com/Jarmos-san/neovim-docker/actions/workflows/publish.yml/badge.svg)](https://github.com/Jarmos-san/neovim-docker/actions/workflows/publish.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Jarmos-san/neovim-docker?color=%23181717&label=Size&logo=github)
![GitHub](https://img.shields.io/github/license/Jarmos-san/neovim-docker?label=License&logo=github)
![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FJarmos-san%2Fneovim-docker)

This repository contains the source code for working on a containerised Neovim
environment. I use this project to experiment with various Neovim configurations
which otherwise would be difficult on my work environment. Containerising a
Neovim environment takes away the pain of backing up older configuration &
replacing them once I'm done experimenting with newer Neovim configurations.

So, if you work with or have a keen interest in using Neovim, this containerised
environment is perfect for experimentation. You simply need to _pull_ the Docker
image from the registry, see how things work out & delete the container (_and
the image_) after you're done!

## 🦮 How to Use the Project

Using the project is **VERY** simple & all you'll need is [Docker][5] & a
terminal emulator (I prefer [Kitty][7]). So, if you've Docker installed on your
local machine, you simply need to download the Docker Image & spin it up.

For a detailed instructions on getting started with the project, I suggest
taking a look at the [Usage Instructions & Guidelines][12]. The said section
discusses everything about setting up the configuration files, installing
plugins & much more. So, do give it a thorough read before diving head-first
into the project.

## 🫂 Contributing & Supporting the Project

This project wouldn't have seen the light of the day without the community
backing. And this is also the primary reason why the project is released &
maintained as a seperate project instead of a "module" of my [dotfiles][3]
repository.

Hence, you're free to support or contribute to this project in any way you
prefer. But before you do so, the following section(s) will help you get
started.

### How to Contribute to the Project

There are numerous ways to contribute to the project & here are a few ways I can
think of on the top of my head.

- Found bugs? Report it by opening an [issue thread][4].
- Have a better plugin or an enhancement suggestions? Let the author know about
  it.
- Are you interested in writing Lua code or perhaps use this project as your
  own? Then feel free to share a PR or two.
- Found the project useful to get started with working on Neovim ASAP? Then
  consider sponsoring the author as it keeps him motivated & pays the bills.

To learn more about contributing to the project, refer to the "[Developer
Guidelines][13]" section of the wiki. Also don't forget to check out the more
detailed instructions as laid down in the "[Contributing Guidelines][14]" for
the project.

That said, if you've any questions related to the development of this project,
please feel to reach out to author & maintainer of the project!

## 📚 Informative Resources for Learning About the Tools

Neovim has a significant learning curve but its worthwhile especially for
power-users (_and if you suffer from [Carpal Tunnel Syndrome (CTS)][15]_). So if
you're starting to learn to Vim, I've also compiled a couple of resources on the
same topic. You can find all the list of resources in "[Learning Resources][16]"
section of the wiki.

## 📄 Usage Terms & Conditions

The project is licensed under the terms & conditions (T&Cs) for the MIT license.
So, you free to use, distribute, copy, modify & such with the contents of this
repository in whatever manner you want to. The caveat is, your usage should
adhere to the T&Cs of the MIT license.

For more information on the licensing T&Cs, feel free to refer to the
[LICENSE](./LICENSE) document.

<!-- Reference Links -->

[1]: https://github.com/wbthomason/packer.nvim
[2]: https://github.com/williamboman/mason.nvim
[3]: https://github.com/Jarmos-san/dotfiles
[4]: https://github.com/Jarmos-san/neovim-docker/issues/new/choose
[5]: https://www.docker.com
[6]:
  https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp
[7]: https://sw.kovidgoyal.net/kitty
[8]: https://taskfile.dev
[9]: https://docs.github.com/en/get-started/quickstart/fork-a-repo
[10]: https://semver.org
[11]: https://taskfile.dev
[12]:
  https://github.com/Jarmos-san/neovim-docker/wiki/Usage-Instructions-&-Guidelines
[13]: https://github.com/Jarmos-san/neovim-docker/wiki/Developer-Guidelines
[14]: https://github.com
[15]: https://www.ninds.nih.gov/carpal-tunnel-syndrome-fact-sheet
[16]: https://github.com/Jarmos-san/neovim-docker/wiki/Learning-Resources
