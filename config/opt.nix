{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [tokyonight-nvim];

  lua =
    #lua
    ''
      require("tokyonight").setup({style = "night", transparent = true})
      vim.cmd[[colorscheme tokyonight]]

      vim.opt.completeopt = {"menuone", "noselect", "noinsert"}
      vim.opt.cursorcolumn = true
      vim.opt.cursorline = true
      vim.opt.expandtab = true
      vim.opt.ignorecase = true
      vim.opt.incsearch = true
      vim.opt.mouse = ""
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.ruler = false
      vim.opt.scrolloff = 7
      vim.opt.shiftwidth = 4
      vim.opt.showmode = false
      vim.opt.signcolumn = "yes"
      vim.opt.smartcase = true
      vim.opt.softtabstop = 4
      vim.opt.swapfile = false
      vim.opt.tabstop = 4
      vim.opt.termguicolors = true
      vim.opt.undofile = true
      vim.opt.updatetime = 50
      vim.opt.wrap = false
      vim.opt.writebackup = false

      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
      vim.keymap.set("n", "S-<cr>", "<Nop>", { silent = true })
      vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")

      vim.keymap.set("c", "W", "w")
      vim.keymap.set("n", "Y", "y$")

      vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

      vim.keymap.set("n", "J", "mzJ1`z")
      vim.keymap.set("n", "<C-d>", "<C-d>zz")
      vim.keymap.set("n", "<C-u>", "<C-u>zz")
      vim.keymap.set("n", "n", "nzz")
      vim.keymap.set("n", "N", "Nzz")

      vim.keymap.set("x", "<leader>p", '"_dP') -- void paste

      vim.keymap.set({ "n", "v" }, "<leader>d", '"_d') -- void delete
      vim.keymap.set({ "n", "v" }, "<leader>D", '"_D') -- void delete

      vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- clipboard copy
      vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y$')

      vim.keymap.set("n", "<C-j>", "<cmd>cn<cr>zz")
      vim.keymap.set("n", "<C-k>", "<cmd>cp<cr>zz")
    '';
}
