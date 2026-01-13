return {
  "mhartington/formatter.nvim",
  cmd = { "Format", "FormatWrite" },
  keys = {
    { "<leader>s", "<cmd>Format<CR>", mode = { "n", "v" }, desc = "Format with formatter.nvim" },
  },
  config = function()
    local util = require("formatter.util")
    
    local prettier_formatter = function(parser)
      return function()
        local file_path = util.get_current_buffer_file_path()
        if not file_path or file_path == "" then
          return nil
        end
        
        local abs_path = vim.fn.fnamemodify(file_path, ":p")
        local args = {
          "--stdin-filepath",
          abs_path,
        }
        
        if parser then
          table.insert(args, "--parser")
          table.insert(args, parser)
        end
        
        return {
          exe = "prettier",
          args = args,
          stdin = true,
          try_node_modules = true,
        }
      end
    end

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        html = prettier_formatter(),
        json = prettier_formatter(),
        jsonc = prettier_formatter(),
        css = prettier_formatter(),
        javascript = prettier_formatter(),
        typescript = prettier_formatter(),
        tsx = prettier_formatter("typescript"),
        typescriptreact = prettier_formatter("typescript"),
        javascriptreact = prettier_formatter(),
        cs = {
          require("formatter.filetypes.cs").clangformat,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
      },
    })
  end,
}
