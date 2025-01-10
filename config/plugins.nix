{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [
    neogit
    oil-nvim
    comment-nvim
    nvim-autopairs
    nvim-surround
    vim-indent-object
    gitsigns-nvim
    todo-comments-nvim
    nvim-web-devicons
    vim-visual-multi
    typst-preview-nvim
  ];
  lua =
    #lua
    ''
      require("neogit").setup()
      vim.keymap.set("n", "<space>g", "<cmd>Neogit<cr>")

      require("oil").setup()
      vim.keymap.set("n", "-", "<cmd>Oil<cr>")

      require("Comment").setup()
      require("nvim-autopairs").setup()
      require("nvim-surround").setup()
      require("typst-preview").setup()
      require("gitsigns").setup()

      require("todo-comments").setup()
      vim.keymap.set("n", "<space>pt", "<cmd>TodoTelescope<cr>")

    '';
}
