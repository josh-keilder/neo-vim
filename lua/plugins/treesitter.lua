return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install({
      'lua', 'c', 'python', 'php', 'tsx', 'typescript',
    })

    -- Highlighting: enable per filetype
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lua', 'c', 'python', 'php', 'tsx', 'typescript' },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- Indentation 
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lua', 'c', 'python', 'php', 'tsx', 'typescript' },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}