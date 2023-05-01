-- dap: Debugging in nvim via the Debug Adapter Protocol.
-- https://github.com/mfussenegger/nvim-dap
--
-- Evaluating as of 13/04/23
--

return {
  'mfussenegger/nvim-dap',

  dependencies = {
    {'theHamsta/nvim-dap-virtual-text', opts = {}},
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
  end
}

