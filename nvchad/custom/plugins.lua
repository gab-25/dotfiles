local plugins = {
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "angular-language-server",
        "tailwindcss-language-server",
        "prisma-language-server",
        "html-lsp",
      },
    },
  },
}
return plugins
