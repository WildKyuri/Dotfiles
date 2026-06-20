return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = function()
      local blink_cmp = require("blink.cmp")

      local on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            vim.diagnostic.open_float(nil, {
              focusable = false,
              border = "rounded",
              source = "always",
              prefix = " ",
            })
          end,
        })

        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end

      return {
        on_attach = on_attach,
        capabilities = blink_cmp.get_lsp_capabilities(),

        -- No usamos Razor por ahora.
        -- Esto elimina el warning:
        -- "Extension 'razor' is enabled but no path was provided"
        extensions = {
          razor = {
            enabled = false,
          },
        },

        config = {
          settings = {
            ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,

              dotnet_enable_inlay_hints_for_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_object_creation_parameters = true,
              dotnet_enable_inlay_hints_for_other_parameters = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
              dotnet_enable_inlay_hints_for_suppressing_parameters_that_differ_only_by_suffix = true,
              dotnet_enable_inlay_hints_for_suppressing_parameters_that_match_method_intent = true,
              dotnet_enable_inlay_hints_for_suppressing_parameters_that_match_argument_name = true,
            },

            ["csharp|background_analysis"] = {
              dotnet_analyzer_diagnostics_scope = "fullSolution",
              dotnet_compiler_diagnostics_scope = "fullSolution",
            },
          },
        },
      }
    end,
  },
}
