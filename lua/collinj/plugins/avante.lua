require("avante").setup({
  provider = "claude",
  anthropic_api_key = os.getenv("ANTHROPIC_API_KEY"), -- Use an environment variable for security
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022", -- Use Claude 3 Sonnet model
    temperature = 0, -- Controls creativity (lower = more deterministic)
    max_tokens = 4096, -- Maximum token output
  },
  auto_suggestions_provider = "claude", -- Enable auto-suggestions using Claude
  behaviour = {
    auto_suggestions = false, -- Experimental feature
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Removes unchanged lines in diffs
    enable_token_counting = true, -- Enable token counting
  },
  mappings = {
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
  },
  windows = {
    position = "right", -- Sidebar position
    wrap = true,
    width = 30,
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = true,
    },
    input = {
      prefix = "> ",
      height = 8,
    },
    ask = {
      floating = false,
      start_insert = true,
      border = "rounded",
      focus_on_apply = "ours",
    },
  },
  suggestion = {
    debounce = 600,
    throttle = 600,
  },
})

