return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("dap.ext.vscode").load_launchjs(nil, { node = { "javascript", "typescript" } })
    require("dap").adapters["node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
  end,
}
