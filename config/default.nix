{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [telescope-nvim plenary-nvim];
  lua = ''
    require("telescope").setup()
    vim.keymap.set("n", "<space>h", require("telescope.builtin").find_files)
  '';
}
