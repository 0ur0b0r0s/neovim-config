require("settings")
require("keymappings")
require("plugins.packer")
require("plugins.lualine-conf")
require("plugins.compe-conf")
require("plugins.telescope")

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
  cmd = { "/usr/bin/lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
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
