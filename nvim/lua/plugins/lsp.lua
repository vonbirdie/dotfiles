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
    local user_lsp_config_augroup = vim.api.nvim_create_augroup('UserLspConfig', {})

    -- Configure certain things only once an LSP has been attached to a buffer
    -- and configure those things only for that buffer. This makes sure that
    -- keymaps are not configured in buffers with an LSP that does not support
    -- that functionality.
    --
    -- To see what capabilities an LSP that is attached to the current buffer
    -- has you can run the following command:
    --
    -- ```
    -- :lua =vim.lsp.get_active_clients()[1].server_capabilities
    -- ```
    vim.api.nvim_create_autocmd('LspAttach', {
      group = user_lsp_config_augroup,

      callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover()
        end, { buffer = true })

        vim.keymap.set('n', '<leader>wa', function()
          vim.lsp.buf.add_workspace_folder()
        end, { desc = "Add workspace folder", buffer = true})
        vim.keymap.set('n', '<leader>wr', function()
          vim.lsp.buf.remove_workspace_folder()
        end, { desc = "Remove workspace folder", buffer = true})
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { desc = "List workspace folders", buffer = true})

        vim.keymap.set('n', '<leader>ca', function()
          vim.lsp.buf.code_action()
        end, { desc = "Apply a code action.", buffer = true})
        vim.keymap.set('n', '<leader>rn', function()
          vim.lsp.buf.rename()
        end, { desc = "Rename symbol and all references", buffer = true})

        -- Check for diagnosticProvider?
        -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_pullDiagnostics
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_next()
        end, { desc = "Next diagnostic", buffer = true})
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_prev()
        end, { desc = "Previous diagnostic", buffer = true})
        vim.api.nvim_create_autocmd({"CursorHold"}, {
          group = user_lsp_config_augroup,
          callback = function()
            vim.diagnostic.open_float()
          end
        })

        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
            group = user_lsp_config_augroup,
            callback = function()
              vim.lsp.buf.document_highlight()
            end
          })
          vim.api.nvim_create_autocmd({"CursorMoved"}, {
            group = user_lsp_config_augroup,
            callback = function()
              vim.lsp.util.buf_clear_references(bufnr)
            end
          })
        end
      end
    })

    -- nvim-cmp almost supports LSP's capabilities so advertise it to LSP servers.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup {
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
