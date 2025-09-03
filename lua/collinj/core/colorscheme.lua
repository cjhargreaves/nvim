local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")

if not status then
  print("colorscheme not found!")
  return
end
  
