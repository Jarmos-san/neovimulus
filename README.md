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

The project is easy to use but before you get started using the project, there
are a few prerequisite tools you'll need in your local system. So ensure you at
least have the following tools installed before proceeding ahead:

- [Docker][5]
- A modern Terminal Emulator (I suggest going with [Kitty][6])
- (_Optional_) [`Task`][11] for those interested in developing the project
  and/or using the latest, unstable & a non-minimal setup.

With the prerequisite tools downloaded & setup, run the following command on
your preferred terminal:

```bash
# Pull the Docker image from GitHub Registry.
# INFO: The following command downloads the latest development version of the
# project.
docker pull ghcr.io/jarmos-san/neovim-docker:main

# INFO: The following command downloads the latest pinned version of the
# project.
docker pull ghcr.io/jarmos-san/neovim-docker:v1.2.0

# Create the configuration filepath location, if it doesn't already exists.
mkdir -p "~/.config/nvim" && cd "~/.config/nvim"

# Clone the remote repository to the local system
git clone git@github.com:Jarmos-san/neovim-docker

# Run the container in interactive mode with the necessary files & folders
# mounted in to the container properly.
docker run -it --rm \
    -v "$(pwd)/init.lua:/root/.config/nvim/init.lua" \
    -v "$(pwd)lua:/root/.config/nvim/lua" \
    ghcr.io/jarmos-san/neovim-docker:main
```

The command will open up an interactive Neovim instance & the built container
will also be immediately removed when you exit the Neovim environment!

With the Neovim Docker container downloaded & spun up, its time to install the
necessary plugins & perform some post-setup tasks like downloading LSP servers.
This next section details some of those tasks which needs to be performed after
setting up Neovim.

### ⚙️ Installing Plugins with `packer.nvim`

The container come packaged with `git` for Neovim to download & setup the
[`packer.nvim`][1] package manager for Neovim. To help it install all the
necessary plugins, run `:PackerSync` in _Command_ mode.

Additionally, you could also perform a headless plugin installation by invoking
the following command:

```bash
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
```

### Installing LSP Servers with `mason.nvim`

Neovim comes with a builtin LSP client but the individual servers has to be
downloaded seperately. Unfortunately, the said servers are often distributed
through multiple package managers like `npm`, `brew` & so on.

Keeping a track of all the package manager & which manager is responsible to
download which LSP server can be difficult to track. Hence, to help with such
scenarios, the [`mason.nvim`][2] plugin helps a lot to automate LSP server
installation.

That said, invoking `:MasonToolInstall` in _Command_ mode will install all the
necessary LSP servers that you've configured `mason.nvim` to handle.

**NOTE**: If you invoke the `:PackerInstall` command for the first after setting
up Neovim, you'll need to restart Neovim for the `:MasonToolInstall` command to
work properly.

**TODO**: Figure out a headless alternative to install all the necessary LSP
servers.

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

### Setting Up a Development Environment

If you have some better enhancement suggestions or perhaps a bug fix? Then all
sort of PRs are welcome! But before you share a PR or two you'll need to setup a
local development environment on your system. Only thereafter can you start
developing the project. Hence the following steps will help you setup the
development environment the correct way.

1. Ensure you've the following prerequisite tools installed locally:

   - [Docker][5]
   - A terminal emulator (like [kitty][7])
   - [Task][8] which is a good alternative to GNU Make.
   - Git for version-control.

2. With the prerequisite tools installed, you'll now want to [fork][9] & clone
   the forked repository locally.

   ```console
   git clone git@github.com:<YOUR_GITHUB_USERNAME>/neovim-docker
   ```

3. Change the current directory & run the Docker container interactively.

   ```console
   cd neovim-docker && task
   ```

4. If you followed the steps letter-to-letter, you should've an interactive
   Neovim session running. You can now run all necessary Neovim commands like
   `:PackerSync` to install/update the plugins or `:MasonToolInstall` to
   install/update LSP servers.

5. Inside the interactive Neovim container environment you can edit the Lua
   files as you normally would. And the changes will update outside the
   container as well. With the necessary changes/enhancements made feel free to
   share a PR which will then be reviewed before merged to the `main` branch.

6. Something to keep in mind is the `git`-based development workflow the project
   follows & about [semver][10]. Any new development is performed directly on
   the `main` branch. And when a specific milestone is reached, a commit is
   tagged signifying a frozen & stable version. Thereafter, moving forward all
   or any breaking changes will happen in a new MAJOR version.

That said, if you've any questions related to the development of this project,
please feel to reach out to author & maintainer of the project!

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
- [Setup `nvim-lspconfig` with `nvim-cmp`][6] to learn about setting up LSP &
  autocompletion.

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
[6]: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp
[7]: https://sw.kovidgoyal.net/kitty
[8]: https://taskfile.dev
[9]: https://docs.github.com/en/get-started/quickstart/fork-a-repo
[10]: https://semver.org
[11]: https://taskfile.dev
