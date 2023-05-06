# Change Log

All notable changes to the project will be documented in this file.

The format is based on [Keep a Changelog][1] & the project adheres to [Semantic
Versioning][2].

## [Unreleased]

The following features & upgrade notes has been implemented in to the project or
has not made itself into the public release yet. If you want to track the
unreleased features, check out the `main` branch.

## 2.0.0 - 2023-05-07

The following changes will be added to the v2.0.0 release in the future:

- Removed Docker support since with the latest release version i.e Neovim v0.9
  has provided support for easier configuration loading through the
  `NVIM_APPNAME` environment variable. See
  [`:h NVIM_APPNAME`](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)
  for more information on this regards.
- Removed the redundant `Taskfile.yml` which was earlier used during development
  for managing the various `docker` images & containers.
- Added new Bash scripts for (un)installing the configuration framework on the
  user's local machine.
- Renamed the project to be more apt since it no longer depends on Docker for
  usage!
- Restructure the configuration files & the directories to follow a more simple
  pattern. This should also reduce clutter and unnecessary complexity.

## 1.4.1 - 2023-03-01

This release contains minor patches & bug fixes. See the contents of this
release below for more information on those:

- Removed the [`folke/noice.nvim`](https://github.com/folke/noice.nvim) plugin
  since it was causing issues with Treesitter, Command mode, autocompletion menu
  & more.
- Fixed a bug with the terminal not loading when pressing `<Space> + t + t` in
  quick succcession.
- Reconfigure the statusline to load the LSP progress since the `noice.nvim`
  plugin is removed.
- Add a nice rounded border around the `LspInfo` window.

## [1.4.0] - 2023-02-27

This release took quite a bit of working to complete!

The [`package.nvim`](https://github.com/wbthomason/packer.nvim) package manager
is replaced with [`lazy.nvim`](https://github.com/folke/lazy.nvim) instead. And
in doing so, it resulted in a significant boost in performance (load times &
general usage). Not to forget, `lazy.nvim` is the brainchild of
[Folke Lemaitre](https://github.com/folke) who is a reputed member of the Neovim
community with some **VERY** popular Neovim plugins out there!

That said, this minor release brings the following changes to the project's
source code:

- Port the plugin management system from `packer.nvim` to `lazy.nvim`.
- Properly lazy-load every plugin as much as possible & improve the performance
  to whatever extent possible.
- Perform a range of UI customization as well which were pending since the last
  few releases. Some of those changes include removing some unnecessary fluff
  from the statusline & more.
- Take full advantage of the `lazy.nvim` package manager to restructure the
  configuration modules for easier & better maintainability.
- Rewrite the docs to be more accessible to beginners just starting out with
  using Neovim, Lua & the corresponding ecosystem.

## [1.3.0] - 2022-10-21

See the
[release notes](https://github.com/Jarmos-san/neovim-docker/releases/tag/v1.3.0)
for more information.

## [1.2.1] - 2022-10-04

This release introduces some patches which help pave the path towards developing
the next minor release. And a simple heads up, the next minor release will
probably be compatible with the latest stable version of Neovim i.e Neovim
v0.8.0. But for now, this release pinned the runtime version of Neovim to v0.7.2
for stability concerns.

That said, refer to the list of changes made to the project below:

- Replaced the arbitrary Bash scripts with the better `Taskfile.yml` which also
  serves as a source of documentation during development.
- Refactored the `Dockerfile` to be more efficient when installing packages.
- Pinned the Neovim version to `v0.7.2` for ensuring maximum stability.
- Configured the `Taskfile.yml` to create a draft of a GitHub release more
  easily during development.

## [1.2.0] - 2022-09-25

This release introduces some Quality-of-Life (QoL) improvements for better
syntax highlighting using the [`nvim-treesitter`][12] plugin. For those
interested in developing & moving the project further, the release also
introduces a `Taskfile` which makes the user arbitrary Bash scripts. Hence
making development on the project a more pleasant experience.

That said, the release is still backwards-compatible & there's no breaking
changes yet. For more information on the QoL changes introduced to the project
see following points:

- Create a bare minimum [Taskfile][11] for better quality-of-life when working
  from the CLI environment.
- Create an experimental `protected_call()` wrapper function to load a Lua
  module without breaking the flow of execution. For now you can only find it in
  the root `init.lua` file.
- Added a few icons & labels for the LSP objects displayed in the autocompletion
  menu.
- Added a `Taskfile` entry for cleaning up after work on the project is
  complete.
- Added Treesitter support with the [`nvim-treesitter/nvim-treesitter`][12]
  plugin.

## [1.0.0] - 2022-09-22

This is the public release of the project which has been long overdue! To be
able to finally release the first major version of the project is an experience
I can't clearly express.

But personal emotions aside, the v1 of the project is special. For more context,
this version of the project will **ALWAYS** ensure you have a bare minimum
Neovim configuration available to you. The bare minimum configurations comes
with a LSP & better autocompletion support which should be more than enough to
use the editor as a "daily drive".

As such, simply pull the Docker image from the GitHub Registry to your local
machine. And the container with the following command:

```console
# Pull the Docker image locally.
docker pull ghcr.io/jarmos-san/neovim-docker:v1.0.0

# Run the Docker container interactively.
docker run -it --rm \
    -v "$(pwd)/init.lua:/root/.config/nvim/init.lua" \
    -v "$(pwd)lua:/root/.config/nvim/lua" \
    ghcr.io/jarmos-san/neovim-docker:v1.0.0
```

Found some bug or broken features? Please file a report with proper details in
an [issue thread][3].

### Added

- Created a namespace `jarmos` for better maintainability of the project. See
  the [nvim-lua guide on Lua config files][5] for more information.
- Created & released a Docker image to GitHub Registry for easier collaboration
  efforts & development.
- Created a bunch of Autocommands for:
  - Highlighting yanked text.
  - Create a darker background regardless of the colorscheme.
  - Source the current Lua file when the buffer is written to it.
- Created a bunch of keymaps for bare minimum navigation within Neovim.
- Configured a bare minimum settings for Neovim to behave as it's expected to.
- Setup & configure a bunch of plugins as detailed below:
  - [`wbthomason/packer.nvim`][6] to manage the other Neovim plugins.
  - [`navarasu/onedark.nvim`][4] for the colorscheme.
  - [`hrsh7th/nvim-cmp`][7] & its companion plugins for the autocompletion
    features.
  - [`L3MON4D3/LuaSnip`][8] for snippet support beside the LSP & autocompletion
    support.
  - [`neovim/nvim-lspconfig`][9] for configuring the inbuilt LSP client.
  - [`williamboman/mason`][10] & it's companion plugins for automatic
    installation of the LSP servers.

The aforementioned plugins are an absolute necessity for Neovim to work like an
Integrated Developement Environment (IDE). And hence you can rest assured they
will never be removed until the next major release (which will probably contain
breaking changes).

<!-- Reference Links -->

[1]: http://keepachangelog.com
[2]: http://semver.org
[3]: https://github.com/Jarmos-san/neovim-docker/issues/new/choose
[4]: https://github.com/navarasu/onedark.nvim
[5]: https://github.com/nanotee/nvim-lua-guide#tips
[6]: https://github.com/wbthomason/packer.nvim
[7]: https://github.com/hrsh7th/nvim-cmp
[8]: https://github.com/L3MON4D3/LuaSnip
[9]: https://github.com/neovim/nvim-lspconfig
[10]: https://github.com/williamboman/mason
[11]: https://taskfile.dev
[12]: https://github.com/nvim-treesitter/nvim-treesitter
[13]: https://github.com/nvim-neo-tree/neo-tree.nvim
[14]: https://github.com/windwp/nvim-autopairs
[15]: https://github.com/numToStr/Comment.nvim
[16]: https://docs.docker.com/develop/develop-images/build_enhancements
[17]: https://github.com/nvim-lualine/lualine.nvim
[18]: https://github.com/lewis6991/gitsigns.nvim
[19]: https://github.com/lukas-reineke/indent-blankline.nvim
