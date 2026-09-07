local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

-- Use LspAttach autocmd for keymaps (proper approach for vim.lsp.config)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { noremap = true, silent = true, buffer = args.buf }

    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
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
  end,
})

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
})

vim.lsp.config("jdtls", {
  capabilities = capabilities,
  cmd = { "jdtls" },
  root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
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

vim.lsp.config("sqlls", {
  capabilities = capabilities,
})

vim.lsp.config("yamlls", {
  capabilities = capabilities,
})

vim.lsp.config("jsonls", {
  capabilities = capabilities,
})

vim.lsp.config("bashls", {
  capabilities = capabilities,
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.enable({ "clangd", "jdtls", "pyright", "lua_ls", "sqlls", "yamlls", "jsonls", "bashls", "ts_ls", "rust_analyzer", "gopls" })
