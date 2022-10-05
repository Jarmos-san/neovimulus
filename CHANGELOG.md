# Change Log

All notable changes to the project will be documented in this file.

The format is based on [Keep a Changelog][1] & the project adheres to
[Semantic Versioning][2].

## [Unreleased]

The following features & upgrade notes has been implemented in to the project
or has not made itself into the public release yet. If you want to track the
unreleased features, check out the `main` branch.

### Added

More changes to the configuration will be listed & documented here as
necessary.

- Added a file-explorer plugin [`neo-tree`][13] for easier filesystem
  navigation.
- Added & configured the [`autopairs`][14] plugin for Treesitter-based
  automatic brackets insertion.
- Created a custom keymap to toggle open/close the file explorer more easily.
- Added & configured the [`Comment.nvim`][15] plugin for easier commenting based
  on Treesitter parsers.
- Added some Treesitter modules for better brackets highlighting & much more.
- Refactored the `Taskfile.yml` to use the [BuildKit][16] backend when building
  the Docker images.
- Added the [`lualine`][17] plugin to configure the `statusline`.
- Added the [`gitsigns`][18] plugin for the version-control features.
- Added the [`indent-blankline`][19] plugin to visualise whitespace & indents
  better.
- Uncommented an autocommand to automatically source the `init.lua` file (but
  it doesn't work as expected).
- Configured Neovim settings such that the whitespaces are more visually
  legible & not cluttered.
- Refactored some of the older keymaps & added new relevant ones.

### Changes to Add Later

Following are some changes/updates which will added to the project at some
point in time.

- Ensure the configuration doesn't introduce breaking-changes when migration to
  Neovim v0.8.X.

## [1.2.1] - 2022-10-04

This release introduces some patches which help pave the path towards
developing the next minor release. And a simple heads up, the next minor
release will probably be compatible with the latest stable version of Neovim
i.e Neovim v0.8.0. But for now, this release pinned the runtime version of
Neovim to v0.7.2 for stability concerns.

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
  module without breaking the flow of execution. For now you can only find it
  in the root `init.lua` file.
- Added a few icons & labels for the LSP objects displayed in the
  autocompletion menu.
- Added a `Taskfile` entry for cleaning up after work on the project is
  complete.
- Added Treesitter support with the [`nvim-treesitter/nvim-treesitter`][12]
  plugin.

## [1.0.0] - 2022-09-22

This is the public release of the project which has been long overdue! To be
able to finally release the first major version of the project is an experience
I can't clearly express.

But personal emotions aside, the v1 of the project is special. For more
context, this version of the project will **ALWAYS** ensure you have a bare
minimum Neovim configuration available to you. The bare minimum configurations
comes with a LSP & better autocompletion support which should be more than
enough to use the editor as a "daily drive".

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
  - [`williamboman/mason`][10] & it's companion plugins for automatic installation
    of the LSP servers.

The aforementioned plugins are an absolute necessity for Neovim to work like an
Integrated Developement Environment (IDE). And hence you can rest assured they
will never be removed until the next major release (which will probably
contain breaking changes).

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
