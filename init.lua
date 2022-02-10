require("plugins")
require("keymappings")
require("lualine-conf")
require("compe-conf")
require("telescope")
require("settings")

require("transparent").setup({
  enable = true,
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
})

require'lspconfig'.sumneko_lua.setup{
  cmd = { "/usr/bin/lua-language-server" };
}

require'lspconfig'.terraformls.setup{
  cmd = { '/usr/bin/terraform-ls', 'serve' };
  filetypes = { 'tf' }
}

require'lspconfig'.yamlls.setup{
  cmd = { '/usr/bin/yaml-language-server', '--stdio' },
  filetypes = { 'yaml' }
}

require'lspconfig'.bashls.setup{
  cmd = { '/usr/bin/bash-language-server', 'start' },
  filetypes = { 'sh' }
}
