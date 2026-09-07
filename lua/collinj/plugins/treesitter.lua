-- nvim-treesitter config (new API)
local ok, ts_config = pcall(require, "nvim-treesitter.config")
if ok then
  ts_config.setup({})
end

-- Enable treesitter highlighting for all supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if lang and pcall(vim.treesitter.language.inspect, lang) then
      vim.treesitter.start(args.buf, lang)
    end
  end,
})

-- Also start for already-open buffers
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if lang and pcall(vim.treesitter.language.inspect, lang) then
          vim.treesitter.start(buf, lang)
        end
      end
    end
  end,
})

