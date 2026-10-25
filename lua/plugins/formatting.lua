return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<Leader>cf",
        function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
        mode = { "n", "v" },
        desc = "Format buffer/selection",
      },
      {
        "<Leader>uf",
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          vim.notify("Format on save " .. (vim.g.disable_autoformat and "OFF" or "ON"))
        end,
        desc = "Toggle format on save",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        python = { "ruff_format" },
      },
      formatters = {
        -- Only format projects that opt in with a config file, so foreign codebases aren't reformatted
        prettierd = { require_cwd = true },
        clang_format = {
          require_cwd = true,
          cwd = function(...) return require("conform.util").root_file({ ".clang-format", "_clang-format" })(...) end,
        },
      },
      -- On save, only the formatters above run (no LSP fallback). <Space>cf falls back to the LSP.
      format_on_save = function()
        if vim.g.disable_autoformat then
          return
        end
        return { timeout_ms = 1000, lsp_format = "never" }
      end,
    },
  },
}
