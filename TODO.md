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
  - [x] LSP keymaps (`gd`, `gD`, `<Space>e`, `<Space>cf`, `<Space>ih` + nvim's built-in `gr*`/`K`) and diagnostics display

## Up next
- [ ] Formatting on save (conform.nvim: prettier, rustfmt, clang-format, ruff)
- [ ] File browsing / fuzzy finding: fzf-lua (files, grep, buffers) + a tree browser for the NerdTree habit
- [ ] Git (GitLens-style): neogit (branches, rebase, commit), diffview (diffs, file history), gitsigns (inline blame, hunks)
- [ ] Terminal: toggleable terminal, easy escape to normal mode for vim-style scrollback
- [ ] Claude Code: coder/claudecode.nvim (same IDE protocol as the VS Code extension: diffs, selection context)
- [ ] Statusline and tabline
- [ ] which-key for discovering `<Space>` mappings

## Later / maybe
- [ ] Decide what to do with `legacy/` once nothing in it is needed
