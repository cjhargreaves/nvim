-- NO require("lspconfig") anymore

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- lspsaga + builtin LSP keymaps
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- capabilities for nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

---------------------------------------------------------------------
-- clangd
---------------------------------------------------------------------
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
  },
})

---------------------------------------------------------------------
-- jdtls (Java)
---------------------------------------------------------------------
vim.lsp.config("jdtls", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "jdtls" },
  -- instead of lspconfig.util.root_pattern, use root_markers
  root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
})

---------------------------------------------------------------------
-- pyright (Python)
---------------------------------------------------------------------
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- lua_ls (Lua)
---------------------------------------------------------------------
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

---------------------------------------------------------------------
-- sqlls (SQL)
---------------------------------------------------------------------
vim.lsp.config("sqlls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- yamlls (YAML)
---------------------------------------------------------------------
vim.lsp.config("yamlls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- jsonls (JSON)
---------------------------------------------------------------------
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- bashls (Bash)
---------------------------------------------------------------------
vim.lsp.config("bashls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- ts_ls (TypeScript/JavaScript)
---------------------------------------------------------------------
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

---------------------------------------------------------------------
-- Enable all configured servers
---------------------------------------------------------------------
vim.lsp.enable({ "clangd", "jdtls", "pyright", "lua_ls", "sqlls", "yamlls", "jsonls", "bashls", "ts_ls" })

