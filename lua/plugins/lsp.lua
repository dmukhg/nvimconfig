-- Servers installed by mason. rust-analyzer and clangd come from the system (see requirements.md).
local mason_servers = { "vtsls", "svelte", "basedpyright", "ruff" }
local system_servers = { "rust_analyzer", "clangd" }

local function on_attach(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  local function map(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
  end

  -- Built in since nvim 0.11: K hover, grn rename, gra code action, grr references,
  -- gri implementation, grt type definition, gO document symbols, [d / ]d diagnostics, <C-s> signature help.
  map("gd", vim.lsp.buf.definition, "Go to definition")
  map("gD", vim.lsp.buf.declaration, "Go to declaration")
  map("<Leader>e", vim.diagnostic.open_float, "Line diagnostics")
  map("<Leader>q", vim.diagnostic.setloclist, "Diagnostics to location list")
  map("<Leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

  if client and client:supports_method("textDocument/inlayHint") then
    map("<Leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
    end, "Toggle inlay hints")
  end
end

return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig", -- provides default configs (cmd, filetypes, root markers) for each server
    -- VeryLazy: also load right after startup when no file is opened, so missing servers still get installed
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
        float = { source = true },
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("vtsls", {
        settings = {
          vtsls = {
            tsserver = {
              -- Lets .ts files resolve imports from .svelte files
              globalPlugins = {
                {
                  name = "typescript-svelte-plugin",
                  location = vim.fn.expand("$MASON/packages/svelte-language-server/node_modules/typescript-svelte-plugin"),
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "standard" }, -- the default ("recommended") is very noisy
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
      })

      -- After the overrides above: installs any missing mason_servers and calls vim.lsp.enable() on them
      require("mason-lspconfig").setup({ ensure_installed = mason_servers })
      vim.lsp.enable(system_servers)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- Let basedpyright own hover; ruff's is sparse
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
          on_attach(args)
        end,
      })
    end,
  },
}
