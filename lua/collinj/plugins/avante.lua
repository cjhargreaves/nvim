local ok, avante = pcall(require, "avante")
if not ok then
  return
end

avante.setup({
  provider = "claude",      -- tells Avante which provider to use
  mode = "agentic",

  -- NEW REQUIRED FORMAT
  providers = {
    claude = {
      model = "claude-sonnet-4-5-20250929",
      -- endpoint = "https://api.anthropic.com", -- optional, defaults correct
      -- api_key_name = "ANTHROPIC_API_KEY",     -- optional unless you renamed variable
      timeout = 30000,
      extra_request_body = {
        temperature = 0.6,
        max_tokens = 4096, 
      },
    },
  },

  behaviour = {
    auto_set_keymaps = true,  -- Let Avante set default keymaps
    enable_cursor_planning_mode = true,
    auto_focus_sidebar = true,
  },

  windows = {
    ask = { floating = true, border = "rounded", start_insert = true },
    edit = { border = "rounded" },
  },
})
