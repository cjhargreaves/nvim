local status, _ = pcall(vim.cmd, "colorscheme cyberdream")

if not status then
  print("colorscheme not found!")
  return
end
  
