return {
  "https://gitlab.com/itaranto/preview.nvim",
  version = "v1.1.3",

  lazy = true,
  ft = { "plantuml", "puml", "pu", "iuml", "wsd" },
  cmd = { "PreviewFile" },

  opts = {
    previewers_by_ft = {
      puml = {},
    },
  },

  -- opts = {
  --   renderers = {
  --     image = {
  --       command = {
  --         cmd = "feh",
  --         args = "--reload 1 --scale-down --auto-zoom --title preview.nvim %",
  --       },
  --     },
  --   },
  --
  --   previewers = {
  --     plantuml = {
  --       cmd = "plantuml",
  --       args = { "-pipe", "-tpng" },
  --       stdout = true,
  --       stdin = true,
  --       renderer = "image",
  --     },
  --
  --     puml = {
  --       cmd = "plantuml",
  --       args = { "-pipe", "-tpng" },
  --       stdout = true,
  --       stdin = true,
  --       renderer = "image",
  --     },
  --   },
  -- },
}
