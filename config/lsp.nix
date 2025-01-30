{pkgs, ...}: {
  packages =
    (with pkgs.vimPlugins; [nvim-lspconfig])
    ++ (with pkgs; [
      pyright
      jdt-language-server
      nixd
    ]);
  lua =
    #lua
    ''
      local c = require("lspconfig")
      c.pyright.setup{}
      c.jdtls.setup{}
      c.nixd.setup{}
    '';
}
