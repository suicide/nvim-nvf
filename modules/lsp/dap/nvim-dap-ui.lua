
vim.api.nvim_create_user_command(
  'DapUIClose',
  function()
    require('dapui').close()
  end,
  {
    desc = 'Close the nvim-dap-ui windows',
  }
)
