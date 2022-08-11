# My Person Neovim Configurations

The repository contains a complete refactor of my Neovim configurations.
See the [`init.lua`](./init.lua) file for how I configure Neovim using Lua.
To get started with it, download/copy the contents of the `init.lua` file to
your `~/.config/nvim/init.lua` file. Or if you would like to test it out,
simply run the following command:

```bash
nvim init.lua -u init.lua
```

Ensure you've downloaded the file locally & its accessible to Neovim.

On a further note, the configuration is available in a Docker container format
as well. So, to run Neovim within a Docker container simply run the following
command:

```bash
docker run -it --rm -v $(pwd):/root/.config/nvim neovim
```
