require('telescope').setup{
  defaults = {
    
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    find_files = {
--    theme = "dropdown",
      layout_strategy = "vertical",
    }, 
    live_grep = {
      layout_strategy = "vertical",
    },
    quickfix = {
      layout_strategy = "vertical",
    },
    lsp_references = {
      layout_strategy = "vertical",
    },
    lsp_implementations = {
      layout_strategy = "vertical",
    },
    lsp_defenitions = {
      layout_strategy = "vertical",
    },
    lsp_type_defenitions = {
      layout_strategy = "vertical",
    },
    lsp_document_diagnostics = {
      layout_strategy = "vertical",
    },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
