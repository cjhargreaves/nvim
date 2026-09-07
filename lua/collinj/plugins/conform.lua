-- import conform plugin safely
local conform_status, conform = pcall(require, "conform")
if not conform_status then
  return
end

conform.setup({
  -- one formatter per filetype; only runs if the tool is installed.
  -- install tools via :Mason (e.g. stylua, prettier / prettierd)
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
    -- go and rust format through their LSP (gopls / rust_analyzer),
    -- so no need to list them here.
  },

  -- manual-only: no format_on_save. formatting happens only when you
  -- hit <leader>mp (defined below). want it automatic on save later?
  -- add back a `format_on_save = { lsp_fallback = true, timeout_ms = 1000 }` here.
})

-- manual format: <leader>mp  (works in normal + visual mode)
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format file or range" })
