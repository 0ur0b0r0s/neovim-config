local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require'telescope.config'.values
local directory = "~/.config/nvim/sessions/"

local function makeSession(opts)
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
        vim.cmd('mks! ' .. vim.fn.fnameescape(path))
      end)
      return true
    end,
  }):find()
end

local function saveSession(opts)
  opts = opts or {}

  local file_list = vim.fn.systemlist('find ' .. vim.fn.fnameescape(directory) .. ' -mindepth 1 -type f -exec basename {} \\;')

  pickers.new(opts, {
    prompt_title = 'save session',
    finder = finders.new_table { results = file_list },
    sorter = conf.file_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()

        vim.cmd('mks! ' .. vim.fn.fnameescape(directory .. '/' .. selection[1]))
      end)
      return true
    end,
  }):find()
end

local function loadSession(opts)
  opts = opts or {}

  local file_list = vim.fn.systemlist('find ' .. vim.fn.fnameescape(directory) .. ' -mindepth 1 -type f -exec basename {} \\;')

  pickers.new(opts, {
    prompt_title = 'load session',
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

local function deleteSession(opts)
  opts = opts or {}

  local file_list = vim.fn.systemlist('find ' .. vim.fn.fnameescape(directory) .. ' -mindepth 1 -type f -exec basename {} \\;')

  pickers.new(opts, {
    prompt_title = 'delete session',
    finder = finders.new_table { results = file_list },
    sorter = conf.file_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()

        vim.cmd('silent !rm ' .. vim.fn.fnameescape(directory .. '/' .. selection[1]))
      end)
      return true
    end,
  }):find()
end

return {
  makeSession = makeSession,
  saveSession = saveSession,
  loadSession = loadSession,
  deleteSession = deleteSession,
}
