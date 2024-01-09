local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require'telescope.config'.values
local directory = "/home/kr4k3n/.config/nvim/sessions/"

local function sessions(opts)
  opts = opts or {}

  local file_list = vim.fn.systemlist('find ' .. vim.fn.fnameescape(directory) .. ' -mindepth 1 -type f -exec basename {} \\;')

  pickers.new(opts, {
    prompt_title = 'Sessions',
    finder = finders.new_table { results = file_list },
    sorter = conf.file_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()

        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end

        vim.cmd('source ' .. vim.fn.fnameescape(directory .. '/' .. selection[1]))
      end)
      return true
    end,
  }):find()
end

sessions(require("telescope.themes").get_dropdown{})
