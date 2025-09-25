vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "ErrorMsg", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "ErrorMsg", linehl = "", numhl = "" })

-- example from https://github.com/mfussenegger/nvim-dap/discussions/355
--
-- local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
-- local namespace = vim.api.nvim_create_namespace("dap-hlng")
-- vim.api.nvim_set_hl(namespace, 'DapBreakpoint', { fg='#eaeaeb', bg='#ffffff' })
-- vim.api.nvim_set_hl(namespace, 'DapLogPoint', { fg='#eaeaeb', bg='#ffffff' })
-- vim.api.nvim_set_hl(namespace, 'DapStopped', { fg='#eaeaeb', bg='#ffffff' })
--
-- vim.fn.sign_define('DapBreakpoint', { text='🛑', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
-- vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
