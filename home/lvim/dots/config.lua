-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
lvim.format_on_save.enabled = true
formatters.setup { { name = "nixfmt" } }
