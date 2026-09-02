return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "lua", "bash", "yaml", "json" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "bash", "yaml", "json" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
