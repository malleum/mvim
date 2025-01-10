{
  description = "mvim: malleus vim config powered by nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
      perSystem = {
        pkgs,
        lib,
        inputs,
        ...
      }: let
        modules = import ./. {inherit pkgs lib inputs;};
        mvim = pkgs.neovim.override {
          viAlias = true;
          configure = {
            packages.myVimPackage.start = modules.packages;
            customRC = ''
              lua << EOF
              ${modules.lua}
              EOF
            '';
          };
        };
      in {
        packages.default = mvim;
      };
    };
}
