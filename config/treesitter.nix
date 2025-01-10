{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [nvim-treesitter];
  lua =
    #lua
    ''
      -- require("nvim-treesitter.configs").setup({
      --   sync_install = true,
      --   auto_install = true,
      --   highlight = {enable = true},
      -- })
    '';
}
