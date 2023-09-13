return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "angular-language-server",
        "prisma-language-server",
      },
    },
  },
}
