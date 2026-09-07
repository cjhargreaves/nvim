# My Neovim Configuration

A clean, fast Neovim setup focused on development with LSP support, fuzzy finding, and a modern editing experience.

## Color Scheme

[OneDark](https://github.com/navarasu/onedark.nvim) (dark style)

## Features

- **LSP** — Language server support via Mason + nvim-lspconfig for C/C++, Java, Python, Lua, TypeScript, Rust, Go, SQL, YAML, JSON, and Bash
- **Autocompletion** — nvim-cmp with buffer, path, LSP, and snippet sources
- **Fuzzy Finder** — Telescope with fzf-native for fast file/grep searching
- **File Explorer** — nvim-tree with devicons
- **Treesitter** — Syntax highlighting via `vim.treesitter.start()` with auto-close tags
- **Lspsaga** — Enhanced LSP UI for code actions, definitions, diagnostics, and rename
- **Statusline** — lualine
- **Terminal** — Toggleterm for integrated terminal
- **Editing** — Comment.nvim, vim-surround, auto-pairs
- **Navigation** — vim-tmux-navigator, vim-maximizer

## Requirements

- Neovim >= 0.12
- A [Nerd Font](https://www.nerdfonts.com/) for devicons
- `tree-sitter` CLI (`cargo install tree-sitter-cli`)
- `gopls` installed manually (`go install golang.org/x/tools/gopls@latest`)

## Installation

```bash
cd ~/.config
git clone git@github.com:cjhargreaves/nvim.git
nvim
```

Then run `:PackerSync` inside Neovim to install all plugins.

## Notes

- **gopls** is not managed by Mason — install it manually and ensure `~/go/bin` is in your PATH.
- **Treesitter** highlighting is started explicitly via autocommands since the newer nvim-treesitter plugin no longer uses the `configs` module.
- To install new treesitter parsers: `:TSInstall <language>`
