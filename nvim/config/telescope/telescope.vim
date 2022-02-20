" Telescope fuzzy finder configuration.
"
" @author Maciej Bedra

" Key binding used to launch fuzzy finder (file search)
nmap <C-_> <cmd>Telescope find_files<CR>

" Key binding used to launch fuzzy finder (text occurrence)
nmap <C-_><C-_> <cmd>Telescope live_grep<CR>

" Telescope defaults.
lua << EOF
  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_prefix = "> ",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },

      

      file_sorter =  require'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      path_display = {},
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
      disable_devicons = false,
    },

      pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers = {
       sort_mru = true,
       ignore_current_buffer = true
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    project = {
      base_dirs = {
        --'~/inertia-frontend',
        --{'~/dev/src3', max_depth = 4},
      },
      hidden_files = true -- default: false

      },
     fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
  }
  }
EOF

nnoremap <Leader>m :lua require('telescope').extensions.media_files.media_files()<cr>
nnoremap <Leader>ww  :lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>


"nnoremap <Leader>t :Telescope tele_tabby list<cr>
nnoremap <Leader>, :lua require'telescope.builtin'.builtin{}<cr>

nnoremap  <leader>ff :lua require('telescope').extensions.file_browser.file_browser()<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>; <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
