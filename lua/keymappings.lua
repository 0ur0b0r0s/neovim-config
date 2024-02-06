vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "<c-w><c-q>", ":wq<CR>", { noremap = true, silent=true })
vim.keymap.set("n", "<c-w><c-w>", ":w!<CR>", { noremap = true, silent=true })
vim.keymap.set("n", "<c-q><c-q>", ":q!<CR>", { noremap = true, silent=true })

-- better indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- I hate escape
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
-- vim.keymap.set("v", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- buffers
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bb", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ba", ":bad ", { noremap = true })
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bl", ":ls<CR>", { noremap = true, silent = true })

-- terminal
vim.keymap.set("n", "<Leader>tv", ":vne<CR>:terminal<CR>i", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>th", ":sp<CR>:terminal<CR>i", { noremap = true, silent = true })

-- substitute
vim.keymap.set("n", "S", ":%s//g<Left><Left>", { noremap = true })

-- git
vim.keymap.set("n", "<Leader>g", ":Git<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gb", ":Telescope git_branches<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gc", ":Telescope git_commits<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gnb", ":Git checkout -b ", { noremap = true })

-- signify
vim.keymap.set("n", "<Leader>st", ":SignifyToggle<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>j", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>k", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })

-- open/source lua config
vim.keymap.set("n", "<c-e><c-v>", ":tabnew ~/.config/nvim/init.lua<CR>", { noremap = true, silent=true })
vim.keymap.set("n", "<c-s><c-x>", ":source %<CR>", { noremap = true, silent = true })

-- lazy.nvim
vim.keymap.set("n", "<Leader><Leader>l", ":Lazy<CR>", { noremap = true })

-- resize windows
vim.keymap.set("n", "+", "<c-W>+", { noremap = true, silent=true })
vim.keymap.set("n", "-", "<c-W>-", { noremap = true, silent=true })

-- yank/paste
vim.keymap.set("v", "<C-y>", "\"+y", { noremap = true, silent=true })
vim.keymap.set("n", "<c-p><c-p>", "\"+p", { silent=true })
vim.keymap.set("n", "Y", "y$", { noremap = true, silent=true })

-- sessions
vim.keymap.set("n", "<Leader>sc", ":lua require('plugins.better-sessions').makeSession(require('telescope.themes').get_dropdown{})<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ss", ":lua require('plugins.better-sessions').loadSession(require('telescope.themes').get_dropdown{})<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>S", ":lua require('plugins.better-sessions').saveSession(require('telescope.themes').get_dropdown{})<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>sd", ":lua require('plugins.better-sessions').deleteSession(require('telescope.themes').get_dropdown{})<CR>", { noremap = true })

-- terraform
vim.keymap.set("n", "<Leader>ti", ":!source .env | terraform init -no-color<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tp", ":!terraform plan -no-color -out=last_plan.bin > last_plan.log<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ta", ":!terraform apply -no-color last_plan.bin<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>op", ":vsplit last_plan.log<CR>", { noremap = true })

-- k8s
vim.keymap.set("n", "<Leader>kad", ":!kubectl apply -f % --dry-run=client<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ka", ":!kubectl apply -f %<CR>", { noremap = true })

-- docker-compose
vim.keymap.set("n", "<Leader>db", ":!docker-compose build<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>du", ":!docker-compose up -d<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>dd", ":!docker-compose down<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>dr", ":!docker-compose restart<CR>", { noremap = true })

-- nvim-dap
vim.keymap.set('n', '<Leader>dt', [[:lua require"dapui".toggle()<CR>]], { noremap = true })
vim.keymap.set('n', '<Leader>d1', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
vim.keymap.set('n', '<Leader>d2', [[:lua require"dap".continue()<CR>]], { noremap = true })
vim.keymap.set('n', '<Leader>d3', [[:lua require"dap".step_over()<CR>]], { noremap = true })
vim.keymap.set('n', '<Leader>d4', [[:lua require"dap".step_into()<CR>]], { noremap = true })
-- vim.keymap.set('n', '<Leader>d5', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
vim.keymap.set('n', '<Leader>ds', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Leader>mm', ":Mason<CR>", { noremap = true, silent = true })

-- telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>rg', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

--
-- exec commands
vim.api.nvim_set_keymap("n", "<Leader>xb", ":!bash %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xn", ":!node %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xl", ":luafile %<CR>", { noremap = true })


vim.api.nvim_set_keymap("n", "<Leader>mm", ":messages<CR>", { noremap = true })
