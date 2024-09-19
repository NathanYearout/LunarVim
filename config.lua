-- Plugin Management
lvim.plugins = {
  -- Web API for Vim (used for gist support)
  { "mattn/webapi-vim" },

  -- Debug Adapter Protocol (DAP) integration
  { "mfussenegger/nvim-dap" },

  -- Add leaping navigation using leap.nvim
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- GitHub integration with Octo.nvim
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        suppress_missing_scope = { projects_v2 = true },
      })
    end,
  },

  -- Vim Gist integration
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },

  -- Colorizer for CSS, SCSS, HTML, JavaScript
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

  -- Real-time interpreter with Codi
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },

  -- Highlight TODO comments
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Auto-session management
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },

  -- Function signature hints
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({})
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}

-- General Settings
vim.opt.relativenumber = true
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum}' -- This fixes a bug causing line numbers to be uneven

-- Custom Keybindings
lvim.keys.insert_mode["jj"] = "<Esc>"  -- Quick escape from insert mode
vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })  -- Clear search highlight

-- Split Window Shortcuts
lvim.keys.normal_mode["<leader>-"] = ":split<CR>"
lvim.keys.normal_mode["<leader>|"] = ":vsplit<CR>"
