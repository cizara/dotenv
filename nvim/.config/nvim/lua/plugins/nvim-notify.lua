return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
  opts = {
    stages = "static",
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    local lazyvim_ok, LazyVim = pcall(require, "lazyvim")
    if lazyvim_ok and not LazyVim.has("noice.nvim") then
      LazyVim.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
