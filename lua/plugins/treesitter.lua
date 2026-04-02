return {
 "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
	lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}
