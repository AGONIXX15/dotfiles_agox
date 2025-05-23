return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
    window = {
      mappings = {
        ["o"] = "open",
        ["<Tab>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["oc"] = false,
        ["od"] = false,
        ["og"] = false,
        ["om"] = false,
        ["on"] = false,
        ["os"] = false,
        ["ot"] = false,

      }
    }
  },
}
