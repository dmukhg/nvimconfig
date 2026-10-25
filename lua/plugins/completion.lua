return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- release tags ship a prebuilt fuzzy matcher, so no Rust build
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      -- <C-y> accept, <C-n>/<C-p> or <Up>/<Down> select, <C-Space> open, <C-e> close
      keymap = { preset = "default" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "buffer" } },
    },
  },
}
