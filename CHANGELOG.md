# Change Log

All notable changes to the project will be documented in this file.

The format is based on [Keep a Changelog][1] & the project adheres to
[Semantic Versioning][2].

## [Unreleased]

The following features & upgrade notes has been implemented in to the project
or has not made itself into the public release yet. If you want to track the
unreleased features, check out the `main` branch.

### Added

- Create a bare minimum [Taskfile][11] for better quality-of-life when working
  from the CLI environment.
- Create an experimental `protected_call()` wrapper function to load a Lua
  module without breaking the flow of execution. For now you can only find it
  in the root `init.lua` file.
- Added a few icons & labels for the LSP objects displayed in the
  autocompletion menu.
- Added a `Taskfile` entry for cleaning up after work on the project is
  complete.
- Added Treesitter support with the [`nvim-treesitter/nvim-treesitter`][]
  plugin.

TODO: Fix the issue with missing C compiler in the container.

More changes to the configuration will be listed & documented here as
necessary.

## [1.0.0] - 2022-08-22

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
