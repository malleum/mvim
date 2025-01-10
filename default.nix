{pkgs, ...}: let
  lib = pkgs.lib;
  modules = map (a: import a {inherit pkgs;}) (lib.filesystem.listFilesRecursive ./config);
in {
  packages = lib.lists.flatten (map (a: a.packages) modules);
  lua = lib.concatStrings (map (a: a.lua) modules);
}
