vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim-ghost/bin/python")
return {

  "raghur/vim-ghost",
  build = ":GhostInstall",
}
