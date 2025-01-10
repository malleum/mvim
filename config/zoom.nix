{pkgs, ...}: {
  packages = with pkgs.vimPlugins; [
    telescope-fzf-native-nvim
    plenary-nvim
    harpoon2
    flash-nvim
  ];
  lua =
    # lua
    ''
      require("telescope").setup()
      vim.keymap.set("n", "<space>h", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<space>pg", require("telescope.builtin").git_files)
      vim.keymap.set("n", "<space>ps", require("telescope.builtin").live_grep)
      vim.keymap.set("n", "<space>pr", require("telescope.builtin").lsp_references)
      vim.keymap.set("n", "<space>ph", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<space>pS", function() require("telescope.builtin").grep_string({ search = vim.fn.input({ prompt = ' > ' }) }) end)
      vim.keymap.set("n", "<space>pw", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end)
      vim.keymap.set("n", "<space>pW", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end)

      local harpoon = require("harpoon")
      harpoon:setup({settings = {save_on_toggle = true, sync_on_ui_close = true}})
      vim.keymap.set("n", "<space>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<space>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<C-A-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-A-t>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-A-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-A-s>", function() harpoon:list():select(4) end)

      require("flash").setup({
        label = {rainbow = {enabled = true}},
        modes = { search = {enabled = false}, char = {enabled = false} }
      })

      vim.keymap.set({"n", "x", "o"}, "s", function() require('flash').jump() end)
      vim.keymap.set({"n", "x", "o"}, "S", function() require('flash').treesitter() end)
    '';
}
