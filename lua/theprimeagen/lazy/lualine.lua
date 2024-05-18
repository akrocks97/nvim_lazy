return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    dependencies  = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function ()
       require("lualine").setup()
    end
}
