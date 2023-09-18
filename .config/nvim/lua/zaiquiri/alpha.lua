local status_ok, alpha= pcall(require, "alpha-nvim")
if not status_ok then
  return
end

alpha.setup(require'alpha.themes.startify'.config)
