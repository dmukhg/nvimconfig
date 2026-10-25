return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Fuzzy finding over files, grep, buffers, LSP symbols, git
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<Leader><Leader>", "<cmd>FzfLua files<CR>", desc = "Find files" },
      { "<Leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
      { "<Leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
      { "<Leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Grep word under cursor" },
      { "<Leader>fw", "<cmd>FzfLua grep_visual<CR>", mode = "v", desc = "Grep selection" },
      { "<Leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<Leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
      { "<Leader>f/", "<cmd>FzfLua blines<CR>", desc = "Lines in buffer" },
      { "<Leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Symbols (file)" },
      { "<Leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Symbols (workspace)" },
      { "<Leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics (file)" },
      { "<Leader>fD", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics (workspace)" },
      { "<Leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Help" },
      { "<Leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
      { "<Leader>fr", "<cmd>FzfLua resume<CR>", desc = "Resume last search" },
      { "<Leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Branches (enter to switch)" },
    },
    opts = {},
  },

  -- NerdTree-style tree. g? inside the tree lists its keys.
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "<Leader>n", "<cmd>NvimTreeToggle<CR>", desc = "File tree" },
      { "<Leader>N", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal file in tree" },
    },
    opts = {
      view = { width = 35 },
      renderer = { group_empty = true },
      update_focused_file = { enable = true },
      filters = { git_ignored = false },
    },
  },
}
