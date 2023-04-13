
return {
  'neovim/nvim-lspconfig',

  config = function()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    on_attach = function(client, bufnr)

      -- Mappings.
      local opts = { buffer = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
      vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
      vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
      vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end, opts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, opts)
    end

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, { desc = "Next diagnostic" })

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
    end, { desc = "Previous diagnostic" })

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    -- nvim-cmp almost supports LSP's capabilities so advertise it to LSP servers.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig').lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
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

  end
}

