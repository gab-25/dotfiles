return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        dartls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "angular-language-server",
      },
    },
  },
}
