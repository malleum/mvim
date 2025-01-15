{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [nvim-treesitter];
  lua =
    #lua
    ''
      require("nvim-treesitter.configs").setup({
        highlight = {enable = true},
      })
    '';
}
