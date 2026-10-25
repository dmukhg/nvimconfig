local opt = vim.opt

-- Display
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.showtabline = 2
opt.laststatus = 3 -- one global statusline
opt.scrolloff = 6
opt.wrap = false
opt.winborder = "rounded" -- borders on all floating windows (hover, diagnostics, etc.)

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line length: hard wrap at 120
opt.textwidth = 120
opt.formatoptions:append("t")

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Behaviour
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- share the macOS clipboard
opt.undofile = true
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true
