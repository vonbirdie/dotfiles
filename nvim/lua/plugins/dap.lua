-- dap: Debugging in nvim via the Debug Adapter Protocol.
-- https://github.com/mfussenegger/nvim-dap
--

return {
  'mfussenegger/nvim-dap',

  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
  },

  config = function()

    local dap = require('dap')
    dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode',
      name = "lldb"
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }

    require("nvim-dap-virtual-text").setup {
    }
  end
}



