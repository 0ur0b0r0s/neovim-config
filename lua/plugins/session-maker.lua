local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require'telescope.config'.values
local directory = "/home/kr4k3n/.config/nvim/sessions/"

local session = function(opts)
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = "session name",
    finder = finders.new_table {
      results = {}
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local line = action_state.get_current_line()
        local path = directory .. line .. '.vim'
        vim.cmd('mksession! ' .. vim.fn.fnameescape(path))
      end)
      return true
    end,
  }):find()
end

session(require("telescope.themes").get_dropdown{})
