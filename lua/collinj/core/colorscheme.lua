local status, onedark = pcall(require, "onedark")

if not status then
  print("colorscheme not found!")
  return
end

onedark.setup({
  style = "dark",
})

onedark.load()
  
