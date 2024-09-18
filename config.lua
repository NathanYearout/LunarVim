-- Add ToggleTerm to your plugins
lvim.plugins = {
  { "mattn/webapi-vim" },
  { "mfussenegger/nvim-dap" },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("octo").setup({
        suppress_missing_scope = {
          projects_v2 = true,
        },
      })
    end,
  },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
          RGB = true,
          RRGGBB = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
      })
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    },
  },

  {
      "ray-x/lsp_signature.nvim",
      config = function()
        require"lsp_signature".setup({
          -- …
        })
      end,
  },
}

-- Additional general settings and keybindings
vim.opt.relativenumber = true
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '

-- Custom insert mode keybinding
lvim.keys.insert_mode["jj"] = "<Esc>"

-- Clear search highlight with `Esc`
vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })

-- Split windows
lvim.keys.normal_mode["<leader>-"] = ":split<CR>"
lvim.keys.normal_mode["<leader>|"] = ":vsplit<CR>"
