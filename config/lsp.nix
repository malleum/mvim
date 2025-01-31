{pkgs, ...}: {
  packages =
    (with pkgs.vimPlugins; [
      cmp-nvim-lsp
      nvim-cmp
      nvim-lspconfig
    ])
    ++ (with pkgs; [
      jdt-language-server
      lua-language-server
      pyright
    ]);
  lua =
    #lua
    ''
      local lspconfig_defaults = require("lspconfig").util.default_config
      local lsp = require("lspconfig")
      local lspc = require("lspconfig.configs")
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )
      
      lsp.jdtls.setup({})
      lsp.lua_ls.setup({})
      lspc.nixd = {default_config = {cmd = {"${pkgs.nixd}/bin/nixd"}, filetypes = {"nix"}, root_dir = require("lspconfig.util").root_pattern("flake.nix")}}
      lsp.nixd.setup({})
      lsp.pyright.setup({})

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
          vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
          vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set("n", "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
          vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

          vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end)
        end,
      }) '';
}
