local builtin = require('telescope.builtin')

-- Project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) 

-- Project git files
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

-- Project strings;
vim.keymap.set('n', '<leader>ps', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
