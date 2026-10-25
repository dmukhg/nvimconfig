# TODO

## Done
- [x] Plugin manager: lazy.nvim with a committed `lazy-lock.json`, update checker off
- [x] Base options, keymaps (wrap toggle on `<Space>w`), autocmds
- [x] Colorscheme: built-in `default` (dark), rounded borders on floating windows
- [x] nvim 0.12 (Homebrew), replacing the hand-installed 0.11 in `/usr/local`
- [x] LSP + syntax
  - [x] Treesitter (nvim-treesitter `main` branch) for highlighting and indent
  - [x] mason.nvim installs vtsls, svelte, basedpyright, ruff; installs also run when nvim starts without a file
  - [x] System servers: rust-analyzer (rustup), clangd (Xcode)
  - [x] Completion: blink.cmp
  - [x] LSP keymaps (`gd`, `gD`, `<Space>e`, `<Space>uh` + nvim's built-in `gr*`/`K`) and diagnostics display
- [x] Formatting on save: conform.nvim (prettierd, rustfmt, clang-format, ruff); prettier/clang-format only where the project has a config
- [x] Fuzzy finding: fzf-lua (`<Space><Space>`, `<Space>f*`, `<Space>gb` branches)
- [x] Tree browser: nvim-tree (`<Space>n`, `<Space>N`)
- [x] Git: gitsigns (inline blame, hunks), diffview (diffs, history), neogit (status, commit, branch, rebase)
- [x] Terminal: `<C-/>` toggle, `<Esc><Esc>` / `<C-q>` to normal mode, 100k scrollback
- [x] Claude Code: claudecode.nvim (`<Space>a*`), native terminal provider in a right split
- [x] Statusline: lualine
- [x] which-key
- [x] Tutorials: `:Tutor config-00-index`, practice project via `:Playground`
- [x] Removed `legacy/` (old init.vim and monokai colors; still in git history)

## To verify
- [ ] Each piece above, tried for real
