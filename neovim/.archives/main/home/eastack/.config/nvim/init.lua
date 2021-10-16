require("plugins")
require("options")
require("keymaps")

require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.sumneko_lua.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  autopairs = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
