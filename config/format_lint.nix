{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [conform-nvim nvim-lint];
  lua = let
    ruff = "${pkgs.ruff}/bin/ruff";
    stylua = "${pkgs.stylua}/bin/stylua";
    alejandra = "${pkgs.alejandra}/bin/alejandra";
    isort = "${pkgs.isort}/bin/isort";
  in
    #lua
    ''
      require("conform").setup({
        formatters = {
          ruff_format = {
            command = "${ruff}",
            prepend_args = {"format"},
          },
          stylua = {command = "${stylua}"},
          alejandra = {command = "${alejandra}"},
          isort = {command = "${isort}"},
        },
        formatters_by_ft = {
          lua = {"stylua"},
          nix = {"alejandra"},
          python = {"isort", "ruff_format"},
          ["*"] = {"trim_whitespace"},
        },
      })

      require("lint").linters_by_ft = {python = { "ruff" }}
      require("lint").linters = {ruff = {cmd = "${ruff}"}}
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    '';
}
