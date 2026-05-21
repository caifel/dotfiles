local exclude = {
  ".git",
  "node_modules",
  ".next",
  "dist",
  "build",
  "coverage",
  ".pnpm-store",
  "pnpm-store",
  ".pnpm",
  ".turbo",
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = false,
            exclude = exclude,
          },
          explorer = {
            hidden = true,
            ignored = false,
            exclude = exclude,
          },
          grep = {
            hidden = true,
            ignored = false,
            exclude = exclude,
          },
        },
      },
    },
  },
}
