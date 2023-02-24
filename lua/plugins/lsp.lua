-- Module for configuring the LSP capabilities of Neovim

return {
  {
    "folke/trouble.nvim", -- Plugin to display the diagnostic messages in a floating window
    config = true, -- Initialise the plugin with some default configurations
    dependencies = { "kyazdani42/nvim-web-devicons" }, -- Dependency plugin for Nerd Font icon support
    cmd = { "Trouble" }, -- Lazy load the plugin when this command is called
  },
}
