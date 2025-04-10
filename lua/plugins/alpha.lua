return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local custom = require("../config/alpha_config")

        dashboard.section.header.val = custom.header()
        dashboard.section.buttons.val = custom.buttons(dashboard)
        dashboard.section.footer.val = custom.footer()

        alpha.setup(dashboard.opts)
    end,
}
