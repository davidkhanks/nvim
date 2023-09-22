require('nvim-toggler').setup({
  -- custom inverses
  inverses = {
    ['True'] = 'False',
    ['true'] = 'false',
    ['Yes'] = 'No',
    ['yes'] = 'no',
    ['=='] = '!=',
  },
  -- removes the default <leader>i keymap
  -- remove_default_keybinds = true,
  -- removes the default set of inverses
  -- remove_default_inverses = true,
})

-- custom keybinding if wanted
-- vim.keymap.set({ 'n', 'v' }, '<leader>cl', require('nvim-toggler').toggle)


