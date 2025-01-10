{pkgs, inputs, lib, ...}: let
  modules = map (a: import a {inherit pkgs lib inputs;}) (lib.filesystem.listFilesRecursive ./config);
in {
  packages = lib.lists.flatten (map (a: a.packages) modules);
  lua = lib.concatStrings (map (a: a.lua) modules);
}
