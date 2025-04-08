return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "rust", "go", "hcl", "toml", "gomod", 
        "html", "css", "javascript", "markdown",
        "c", "cpp", "asm", "linkerscript",
        "arduino", "puppet", "python",
        "make", "cmake", "meson", "ninja",
        "diff", "bash", "fish", "awk",
        "linkerscript", "llvm", "asm",
        "latex", "typst", "yaml",
        "lua", "vim", "vimdoc", "jsonc",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
