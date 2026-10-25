# System requirements

Packages to install outside nvim. Anything marked **(mason)** is installed by nvim itself on first start and
needs nothing beyond the listed prerequisites.

## Global

| Package | Why | Install (macOS) |
| --- | --- | --- |
| neovim >= 0.12 | nvim-treesitter `main` and current plugins require it | `brew install neovim` |
| git | lazy.nvim clones plugins; git integration | Xcode Command Line Tools or `brew install git` |
| C compiler | compiling treesitter parsers | `xcode-select --install` |
| tree-sitter-cli >= 0.26.1 | building treesitter parsers (must not be the npm package) | `brew install tree-sitter-cli` |
| curl, unzip, tar | mason downloads | preinstalled on macOS |
| ripgrep | project-wide search | `brew install ripgrep` |
| fd | fast file listing for the finder | `brew install fd` |
| fzf | fuzzy finder | `brew install fzf` |
| A Nerd Font | file and git icons | `brew install --cask font-jetbrains-mono-nerd-font`, then select it in the terminal |
| Terminal with true colour | correct colours | iTerm2, Ghostty, WezTerm or Kitty (not Terminal.app) |
| Claude Code CLI (`claude` on PATH) | Claude Code panel | https://docs.anthropic.com/en/docs/claude-code |

## TypeScript / JavaScript

| Package | Why | Install |
| --- | --- | --- |
| node + npm | runs the language server | `brew install node` (or node@22) |
| vtsls | language server (wraps VS Code's TypeScript extension) | **(mason)** |
| typescript (per project) | vtsls prefers the workspace's `node_modules/typescript` | `npm i -D typescript` in the project |
| prettierd | format on save (also used for Svelte, CSS, HTML, JSON, YAML) | **(mason)** |
| prettier config (per project) | format on save only runs where a `.prettierrc*` / `prettier.config.*` exists | project's choice |

## Svelte

| Package | Why | Install |
| --- | --- | --- |
| node + npm | runs the language server | see above |
| svelte-language-server | language server; also provides `typescript-svelte-plugin` so `.ts` files understand `.svelte` imports | **(mason)** |

## Rust

| Package | Why | Install |
| --- | --- | --- |
| rustup + stable toolchain | compiler, cargo | https://rustup.rs |
| rust-analyzer | language server, matched to your toolchain | `rustup component add rust-analyzer` |
| clippy | used by rust-analyzer for on-save checks | `rustup component add clippy` |
| rustfmt | format on save | `rustup component add rustfmt` |

## C / C++

| Package | Why | Install |
| --- | --- | --- |
| clangd | language server | Xcode Command Line Tools (`/usr/bin/clangd`) or `brew install llvm` for a newer one |
| clang-format | formatting | `brew install clang-format` |
| `.clang-format` (per project) | format on save only runs where one exists | project's choice |
| `compile_commands.json` (per project) | tells clangd how files are compiled | CMake: `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`; Make: `brew install bear`, then `bear -- make` |

## Python

| Package | Why | Install |
| --- | --- | --- |
| python3 | mason installs the Python tools into a venv | pyenv / `brew install python` |
| basedpyright | type checking, completion, go-to-definition | **(mason)** |
| ruff | linting and format on save | **(mason)** |
| A project venv (per project) | basedpyright resolves imports from `.venv/` in the project root | `uv venv` or `python -m venv .venv` |
