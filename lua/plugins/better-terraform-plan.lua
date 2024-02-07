local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require'telescope.config'.values
local directory = "~/.config/nvim/sessions/"

local function terraformPlan(opts)
  opts = opts or {}

  local file_list = vim.fn.systemlist('find -mindepth 1 -type f -name "*.tfvars" -exec basename {} \\;')

  pickers.new(opts, {
    prompt_title = "environment to plan",
    finder = finders.new_table { results = file_list },
    sorter = conf.file_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local terraform_plan_output = vim.fn.system('terraform plan --var-file=./' .. selection[1] .. ' -no-color')

        vim.cmd('vsplit')
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, true, vim.fn.split(terraform_plan_output, '\n'))
        vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
        vim.api.nvim_set_current_buf(buf)
        vim.cmd('normal gg')
      end)
      return true
    end,
  }):find()
end

return {
  terraformPlan = terraformPlan,
}
