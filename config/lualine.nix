{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [lualine-nvim];
  lua =
    #lua
    ''
      require("lualine").setup({
        sections = {
          lualine_a = {"mode"};
          lualine_b = {"branch", "diff", "diagnostics"};
          lualine_c = {"filename"};
          lualine_x = {"selectioncount", "filetype"};
          lualine_y = {"encoding", "filexxformat"};
          lualine_z = {"location"};
        },
      })
    '';
}
