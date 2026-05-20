return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline", -- Shifts the prompt layout from 'cmdline_popup' to the bottom bar
      format = {
        -- Force a manual colon icon prefix into the view string
        cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      },
    },
  },
}
