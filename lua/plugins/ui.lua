return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "│",
        section_separators = "",
      },
      sections = {
        lualine_c = { { "filename", path = 1 } }, -- path relative to cwd
      },
    },
  },

  -- Pops up the available keys after a short pause on <Space> (or any prefix)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<Leader>a", group = "claude" },
        { "<Leader>c", group = "code" },
        { "<Leader>f", group = "find" },
        { "<Leader>g", group = "git" },
        { "<Leader>h", group = "hunks" },
        { "<Leader>u", group = "toggles" },
      },
    },
  },
}
