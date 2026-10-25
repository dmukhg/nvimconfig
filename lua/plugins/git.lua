return {
  -- Gutter signs, hunks and inline blame
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Previous hunk")
        map("n", "<Leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<Leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<Leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage lines")
        map("v", "<Leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset lines")
        map("n", "<Leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<Leader>hR", gs.reset_buffer, "Reset buffer")
        map("n", "<Leader>hp", gs.preview_hunk_inline, "Preview hunk")
        map("n", "<Leader>hb", function() gs.blame_line({ full = true }) end, "Blame line (full commit)")
        map("n", "<Leader>hB", gs.blame, "Blame file")
        map("n", "<Leader>ub", gs.toggle_current_line_blame, "Toggle inline blame")
        map({ "o", "x" }, "ih", gs.select_hunk, "Hunk text object")
      end,
    },
  },

  -- Side-by-side diffs and history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<Leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff working tree" },
      { "<Leader>gD", "<cmd>DiffviewOpen origin/HEAD...HEAD<CR>", desc = "Diff branch against origin default" },
      { "<Leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
      { "<Leader>gh", ":DiffviewFileHistory<CR>", mode = "v", desc = "Selection history" },
      { "<Leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Repo history" },
      { "<Leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
    },
    opts = {},
  },

  -- Magit-style status: stage, commit, branch, rebase, push. ? inside it lists every popup.
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "ibhagwan/fzf-lua" },
    keys = {
      { "<Leader>gg", "<cmd>Neogit<CR>", desc = "Neogit status" },
      { "<Leader>gl", "<cmd>Neogit log<CR>", desc = "Neogit log" },
    },
    opts = {
      integrations = { diffview = true, fzf_lua = true },
    },
  },
}
