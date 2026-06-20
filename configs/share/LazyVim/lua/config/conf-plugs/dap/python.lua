local dap = require("dap")

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath("python3") or "python"
    end,
    console = "integratedTerminal",
  },
}
