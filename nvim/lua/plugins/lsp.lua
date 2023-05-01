return {
  'neovim/nvim-lspconfig',

  dependencies = {
    -- Displays a fidget spinner indicating LSP progress.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Neovim setup for init.lua with full signature help, docs and completion for the nvim lua API.
    -- https://github.com/folke/neodev.nvim
    'folke/neodev.nvim',
  },

  init = function()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
      end, { buffer = true, silent = true })

      vim.keymap.set('n', '<space>wa', function()
        vim.lsp.buf.add_workspace_folder()
      end, { desc = "Add workspace folder", buffer = true, silent = true })
      vim.keymap.set('n', '<space>wr', function()
        vim.lsp.buf.remove_workspace_folder()
      end, { desc = "Remove workspace folder", buffer = true, silent = true })
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List workspace folders", buffer = true, silent = true })

      vim.keymap.set('n', '<space>ca', function()
        vim.lsp.buf.code_action()
      end, { desc = "Apply a code action.", buffer = true, silent = true })
      vim.keymap.set('n', '<space>rn', function()
        vim.lsp.buf.rename()
      end, { desc = "Rename symbol and all references", buffer = true, silent = true })

      vim.keymap.set('n', '<space>e', function()
        vim.diagnostic.open_float()
      end, { buffer = true, silent = true })
      vim.keymap.set('n', '<space>q', function()
        vim.diagnostic.setloclist()
      end, { buffer = true, silent = true })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
      end, { desc = "Next diagnostic", buffer = true, silent = true })
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
      end, { desc = "Previous diagnostic", buffer = true, silent = true })

      local lsp_auto_group = vim.api.nvim_create_augroup("LspAutogroup", {
        clear = false,
      })
      if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
          group = lsp_auto_group,
          callback = function()
            vim.lsp.buf.document_highlight()
          end
        })
        vim.api.nvim_create_autocmd({"CursorMoved"}, {
          group = lsp_auto_group,
          callback = function()
            vim.lsp.util.buf_clear_references(bufnr)
          end
        })
      end
    end

    -- nvim-cmp almost supports LSP's capabilities so advertise it to LSP servers.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            -- Do not attempt to detect other libraries to provide diagnostics for.
            -- https://github.com/sumneko/lua-language-server/wiki/Libraries
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
          IntelliSense = {
            traceBeSetted = true,
          },
        },
      },
    }
    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.1-standalone-strict/all.json"] = "/*.k8s.yaml",
          },
        },
        redhat = {
          telemetry = {
            enabled = false
          },
        },
      },
    }
  end
}
