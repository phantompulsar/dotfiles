return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = nil,
        direction = 'horizontal',
        start_in_insert = true,
        persist_size = true,
      })

      vim.keymap.set('n', '<C-t>', '<Cmd>ToggleTerm<CR>', { desc = "Toggle Terminal" })
      vim.keymap.set('t', '<C-t>', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], { desc = "Toggle Terminal" })

      vim.keymap.set('v', '<leader>r', function()
        require("toggleterm").send_lines_to_terminal("visual_lines", true, { args = vim.v.count })
      end, { desc = "Send highlighted text to toggleterm" })

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end
  }
}

