local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Custom header for the startup screen.
dashboard.section.header.val = {
    [[    ___                                 ]],
    [[   |_  |                                ]],
    [[     | | __ _ _ __ _ __ ___   ___  ___  ]],
    [[     | |/ _` | '__| '_ ` _ \ / _ \/ __| ]],
    [[ /\__/ / (_| | |  | | | | | | (_) \__ \ ]],
    [[ \____/ \__,_|_|  |_| |_| |_|\___/|___/ ]],
}

-- Custom "buttons" to showcase in the startup menu.
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<CMD>enew <BAR> startinsert<CR>"),
    dashboard.button("q", "  Quit Neovim", "<CMD>qall<CR>"),
    dashboard.button("Space f o", "  Open Recently Edited Files", "<CMD>Telescope Oldfiles<CR>"),
    dashboard.button("Space f e", "פּ  Open the File Explorer", "<CMD>Neotree float<CR>"),
    dashboard.button("Space f f", "  List All Files", "<CMD>Telescope find_files<CR>"),
    dashboard.button("Space l s", "ﮮ  Update Neovim Plugins", "<CMD>Lazy sync<CR>"),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)