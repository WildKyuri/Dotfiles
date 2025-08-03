local servers = require("config.lsp_servers")

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configuración básica de DAP UI
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    -- Auto-abrir/cerrar UI
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Configurar adaptadores DAP
    require("mason-nvim-dap").setup({
      ensure_installed = vim.tbl_values(servers.lsp_to_dap),
      automatic_installation = true,
      handlers = {
        function(config)
          -- Handler por defecto para todos los adaptadores
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- Configuraciones específicas por lenguaje
    local dap_configurations = {
      python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python3") or "python"
          end,
        },
      },
      cpp = {
        {
          type = "codelldb",
          request = "launch",
          name = "Launch file",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      },
      c = "cpp", -- Usa la misma configuración que C++
      csharp = {
        {
          type = "netcoredbg",
          request = "launch",
          name = "Launch .NET Core",
          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      },
      java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach)",
          hostName = "127.0.0.1",
          port = 5005,
        },
      },
      typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
      },
      javascript = "typescript", -- Usa la misma configuración que TypeScript
    }

    -- Aplicar configuraciones
    for lang, config in pairs(dap_configurations) do
      if type(config) == "string" then
        dap.configurations[lang] = dap.configurations[config]
      else
        dap.configurations[lang] = config
      end
    end

    -- Atajos de teclado recomendados
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Conditional Breakpoint" })
  end,
}
