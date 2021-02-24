""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing plugins using vim-plug                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'                 " Git wrapper
Plug 'junegunn/gv.vim'                    " A git commit browser
Plug 'tpope/vim-surround'                 " Surround text objects
Plug 'tpope/vim-abolish'                  " Makes working with variants of a word easier
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } " vim-clap finder and dispatcher
Plug 'bling/vim-airline'                  " Vim status bar
Plug 'tpope/vim-commentary'               " Key bindings for commenting
Plug 'ludovicchabant/vim-gutentags'       " Automatic tag management
Plug 'majutsushi/tagbar'                  " Ctags bar for exploring symbols
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Conqueror of Completion
Plug 'vn-ki/coc-clap'                     " vim-clap window for CoC
Plug 'pechorin/any-jump.vim'              " jump through defintions
Plug 'junegunn/vim-easy-align'            " Align text
Plug 'sjl/gundo.vim'                      " Undo tree
Plug 'terryma/vim-multiple-cursors'       " Multiple cursor support
Plug 'nathanaelkane/vim-indent-guides'    " Indent guides for vim
Plug 'raimondi/delimitmate'               " Insert mode autocompletion for delimiters
Plug 'takac/vim-hardtime'                 " Makes it harder to use arrows and hjkl
Plug 'thinca/vim-quickrun'                " Execute part of file
Plug 'tpope/vim-repeat'                   " Supports repeat of complex motions
Plug 'junegunn/vim-peekaboo'              " Peek into registers
Plug 'vim-airline/vim-airline-themes'     " Collection of airline themes
Plug 'matze/vim-move'                     " Move visually selected lines
Plug 'wincent/ferret'                     " Enhanced multi-file search and replace
Plug 'tmhedberg/SimpylFold'               " Better python code folding
Plug 'terryma/vim-expand-region'          " Expand selected region
Plug 'wellle/targets.vim'                 " Supports more text-objects
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in vim
Plug 'junegunn/limelight.vim'             " Hyperfocus-writing in vim
Plug 'christoomey/vim-system-copy'        " Support system copy-paste (Install xsel)
Plug 'luochen1990/rainbow'                " Rainbow paranthesis
Plug 'honza/vim-snippets'                 " More snippets
Plug 'sickill/vim-pasta'                  " Paste preserves indentation
Plug 'mhinz/vim-startify'                 " Show start-page when you open nvim
Plug 'sheerun/vim-polyglot'               " Multiple language syntax support
Plug 'michaeljsmith/vim-indent-object'    " Defines indent as text object
Plug 'mattn/emmet-vim'                    " Emmet support for vim
Plug 'justinmk/vim-sneak'                 " Sneak for vim
Plug 'unblevable/quick-scope'             " Highlight text navigation
Plug 'tpope/vim-rhubarb'                  " Remote source control support
Plug 'skywind3000/asynctasks.vim'         " Modern task system
Plug 'skywind3000/asyncrun.vim'           " Run commands asynchronously
Plug 'janko-m/vim-test'                   " Makes testing easier
Plug 'Wakatime/vim-wakatime'              " Wakatime
Plug 'edkolev/tmuxline.vim'               " Tmux line sync with airline
Plug 'tmux-plugins/vim-tmux-focus-events' " Restore focus autocommands in tmux session
Plug 'christoomey/vim-tmux-navigator'     " Seamless navigation between vim and tmux
Plug 'norcalli/nvim-colorizer.lua'        " Highlight colors in vim
Plug 'machakann/vim-highlightedyank'      " Highlights yanked text briefly
Plug 'tpope/vim-obsession'                " continuously update sessions (wrapper around :mksession)
Plug 'tpope/vim-unimpaired'               " Useful `[` and `]` mappings
Plug 'wesQ3/vim-windowswap'               " Swap two windows easily
Plug 'wincent/loupe'                      " Enhances vim's `search-commands`
Plug 'kshenoy/vim-signature'              " Plugin to display marks
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] } " Wrapper around multiple grep tools
Plug 'editorconfig/editorconfig-vim'      " Support for editorconfig
Plug 'Asheq/close-buffers.vim'            " Useful functions to close buffers
Plug 'ryanoasis/vim-devicons'             " Icon support
Plug 'bryanmylee/vim-colorscheme-icons'   " Colors for icons
Plug 'mcchrish/nnn.vim'                " Show nnn in a floating window
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Allows nvim to edit browser text areas
Plug 'dbeniamine/cheat.sh-vim'            " Access cheat.sh from vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdown preview
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }  " Documentation generator
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " like spacemacs which key
Plug 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }  " todoist plugin for neovim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes                                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'srcery-colors/srcery-vim'
Plug 'sainnhe/edge'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/gruvbox-material'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'overcache/NeoSolarized'
Plug 'franbach/miramare'
Plug 'sainnhe/sonokai'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up default python used by neovim                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" virtual environment setting for deoplete-jedi
let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun config                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 6


set encoding=utf-8
set number
syntax enable
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_palette = 'material'
highlight Comment cterm=italic
highlight Comment gui=italic
colorscheme gruvbox-material
set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set magic
set backspace=indent,eol,start
filetype plugin indent on
"autocmd filetype python set expandtab
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set hidden

" Change the mapleader to \ (default)
let mapleader="\<SPACE>"
let maplocalleader = "\<SPACE>"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>
" Unmapping the arrow keys
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
" " Remapping the movement
" nnoremap j gj
" nnoremap k gk
nmap <silent> <leader>/ :nohlsearch<CR>
" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Nerditya neovim setup
set showcmd
set showmode
set ruler
set formatoptions+=o
set modeline
set nojoinspaces
" More natural splits
set splitbelow
set splitright

" Airline
set laststatus=2
" set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox_material' " old: base16_google
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_left_alt_sep = "\ue0b1"
let g:airline_right_alt_sep = "\ue0b3"
au VimEnter * let g:airline_section_x = airline#section#create_left(['tagbar', 'filetype']) | :AirlineRefresh
function! AirlineLN()
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    let g:airline_section_z = airline#section#create(['obsession', '%3p%% ', g:airline_symbols.linenr, 'linenr', ':%c'])
endfunction
autocmd VimEnter * call AirlineLN()
" coc
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" obsession
let g:airline#extensions#obsession#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'x' ],
    \ [ 'y', 'z', 'error', 'warning' ]
\ ]
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'C',
    \ 'i'  : 'I',
    \ 'ic' : 'I',
    \ 'ix' : 'I',
    \ 'n'  : 'N',
    \ 'ni' : 'N',
    \ 'no' : 'N',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC configuration                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Update time already set by git-gutter

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Main list
nnoremap <silent><nowait> <space>ca  :Clap coc_actions<cr>
" Show diagnostics for current file
nnoremap <silent><nowait> <space>cd  :Clap coc_diagnostics --current-buf<cr>
" Manage extensions
nnoremap <silent><nowait> <space>ce  :Clap coc_extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>cc  :Clap coc_commands<cr>
" Show location
nnoremap <silent><nowait> <space>cl  :Clap coc_location<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>co  :Clap coc_outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>cs  :Clap coc_symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" List of extensions to install
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-sh',
    \ 'coc-clangd',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-julia',
    \ 'coc-texlab',
    \ 'coc-pyright',
    \ 'coc-r-lsp',
    \ 'coc-rust-analyzer',
    \ 'coc-vimlsp',
    \ 'coc-prettier',
    \ 'coc-yaml',
    \ 'coc-markdownlint',
    \ 'coc-explorer',
    \ 'coc-yank',
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-tasks',
    \ 'coc-git',
    \ 'coc-snippets',
  \ ]

" Languages that use language server config directly in coc-settings.json
" docker
" haskell

" coc-prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-explorer config
nmap <leader>\ :CocCommand explorer<CR>

" coc-yank config
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>

" coc-git config
" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" preview a chunk
nnoremap <silent> <leader>hp :<C-u>CocCommand git.chunkInfo<CR>
" stage a chunk
nnoremap <silent> <leader>hs :<C-u>CocCommand git.chunkStage<CR>
" undo a chunk
nnoremap <silent> <leader>hu :<C-u>CocCommand git.chunkUndo<CR>

" Gutter and diagnostics settings
set updatetime=200

" Enabling Hardmode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:hardtime_default_on = 0

" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" Colbycheeze settings
" Autoload files
set autoread
au FocusGained,BufEnter * :silent! !
set visualbell
set cursorline
set guifont=VictorMono\ Nerd\ Font:h13
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
"Toggle relative numbering
set rnu
" Make it obvious where 100 characters is
set textwidth=0
" set formatoptions=cq
set formatoptions=qrn1
set wrap linebreak "nolist
"set wrapmargin=80
"set colorcolumn=+1
" Remapping the Esc key
:imap jk <Esc>
" Map Leader S to save
map <leader>s :w<CR>
" Quickly close windows
nnoremap <leader>x :x<cr>
" Quickly quit window
nnoremap <leader>q :q!<cr>

" A good vimrc
set foldenable " Enables folding
set foldlevelstart=10 "Folds below level 10 will be folded
set foldnestmax=10 "More than 10 folds can't be nested
set foldmethod=indent

" Gundo-vim mapping
nnoremap <F5> :GundoToggle<CR>

" Indent guide settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['coc-explorer', 'startify', 'clap_input', 'todoist']

" Resizing using arrow keys
nnoremap <left> :vertical resize +5<cr>
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>

" Highlighting when col >= 80
" let &colorcolumn=join(range(81,999),",")

" Simply fold settings
let g:SimpylFold_docstring_preview = 1

" Limelight Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_linenr=1

" Overriding vim italics codes
"  must be entered with <C-V><Esc>
set t_ZH=[3m
set t_ZR=[23m

" Rainbow parentheses
let g:rainbow_active = 1

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Tmuxline settings
" let g:tmuxline_preset = 'full'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W #F'],
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#obsession#indicator_text = "\uf692"

" Setting syntax coloring for nextflow files
augroup filetypedetect
    au BufRead,BufNewFile *.nf set filetype=groovy
augroup END

" Setting syntax coloring for coconut files
augroup filetypedetect
    au BufRead,BufNewFile *.coco set filetype=python
augroup END

" Setting syntax coloring for jsx files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Grepper configuration
nnoremap <leader>r :Grepper -tool git<cr>
nnoremap <leader>R :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 0
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 0
let g:grepper.quickfix      = 0

" Git fugitive configuration

nnoremap <leader>gc :Gcommit --verbose<CR>
vnoremap <leader>gs :diffput<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>

" Setting for vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
" make test commands execute using AsyncRun.vim
let test#strategy = "asyncrun"
" test to be used for python
let test#python#runner = 'pytest'

" Live view of subsitutions
set inccommand=split

" Use sytem clipboard
" set clipboard+=unnamedplus

" Make highlighted text more visible
" hi HighlightedyankRegion cterm=reverse gui=reverse

" show break character at the beginning of wrapped lines
set showbreak=⋯\ 

" Loupe settings
let g:LoupeClearHighlightMap = 1

" EasyAlign keymaps
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Setting up keyword highlighting in comments
autocmd Syntax * syntax keyword Todo NOTE containedin=.*Comment
autocmd Syntax * syntax keyword Todo HACK containedin=.*Comment
autocmd Syntax * syntax keyword Todo QUESTION containedin=.*Comment

" Startify session location
let g:startify_session_dir = "~/.vim/session"

" Editing vim-startify lists
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': [   'Sessions']       },
  \ { 'type': 'files',     'header': [   'MRU']            },
  \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
  \ { 'type': 'commands',  'header': [   'Commands']       },
  \ ]

" Prepend icon to startify entries
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Editorconfig plugin configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" Edit last register (useful for macros)
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Remove cursorline on inactive window
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" General conceal
set conceallevel=2
set concealcursor=c

" Multiple cursor configuration
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" Vim-windowswap configuration
let g:windowswap_map_keys = 0
nnoremap <silent> <Leader>yw :call WindowSwap#EasyWindowSwap()<CR>

" Latex configuration
let g:tex_flavor = 'latex'

" Ferret setup
let g:FerretMap = 0
nmap <leader>ef <Plug>(FerretAck)
nmap <leader>es <Plug>(FerretAcks)

" Firenvim setup
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
if exists('g:started_by_firenvim')

    set termguicolors
    set guifont=VictorMono\ Nerd\ Font:h11
    set background=dark
    colorscheme NeoSolarized
    highlight Comment cterm=italic
    highlight Comment gui=italic
    let g:neosolarized_contrast = "high"
    let g:neosolarized_visibility = "normal"
    let g:neosolarized_italic = 1
    let g:airline_theme='solarized'
    let g:airline#extensions#tabline#enabled = 0
    set nocursorline
    " set nolist
    set colorcolumn=
    set tabstop=4
    set shiftwidth=4
    set expandtab
    au BufEnter github.com_*.txt set filetype=markdown

    let g:dont_write = v:false
    function! My_Write(timer) abort
        let g:dont_write = v:false
        write
    endfunction

    function! Delay_My_Write() abort
        if g:dont_write
            return
        end
        let g:dont_write = v:true
        call timer_start(10000, 'My_Write')
    endfunction

    au TextChanged * ++nested call Delay_My_Write()
    au TextChangedI * ++nested call Delay_My_Write()

endif

" quick-scope configuration
let g:qs_max_chars=120
let g:qs_buftype_blacklist = ['terminal', 'nofile']
let g:qs_lazy_highlight = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" doge configuration
let g:doge_doc_standard_python = 'numpy'

" which key configuration
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

" nnn.vim configuration
let g:nnn#command = 'nnn -de'
let g:nnn#layout = { 'window': { 'width': 0.75, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" vim-clap settings
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_background_shadow = v:false
let g:clap_preview_size = { '*': 5, 'files': 10 }
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
" Search git ls-files
nnoremap <Leader>fo :Clap gfiles<CR>
" Search all files
nnoremap <Leader>ff :Clap files --hidden<CR>
" Search recently used files
nnoremap <Leader>fh :Clap history<CR>
" Search open buffers
nnoremap <Leader>fb :Clap buffers<CR>
" Search open windows
nnoremap <Leader>fw :Clap windows<CR>
" Search tags in buffer
nnoremap <Leader>ft :Clap tags<CR>
" Search commits
nnoremap <Leader>fc :Clap commits<CR>
" Search lines
nnoremap <Leader>fl :Clap lines<CR>
" Search using Ag
nnoremap <Leader>fs :Clap grep2<CR>
" Search marks
nnoremap <Leader>fm :Clap marks<CR>
" Sessions search using vim-clap
let g:clap_provider_sessions = {
    \ 'source': 'ls -1 ~/.vim/session',
    \ 'sink': 'SLoad',
    \ 'description': 'Open vim sessions',
  \ }
nnoremap <Leader>fp :Clap sessions<CR>
" Spelling suggestions using vim-clap
function! ClapSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! ClapSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return clap#run({'source': suggestions, 'sink': function("ClapSpellSink"), 'down': 10 })
endfunction
nnoremap <Leader>fz :call ClapSpell()<CR>

" Todoist configuration
let todoist = {
\ 'icons': {
\   'unchecked': '  ',
\   'checked':   '  ',
\   'loading':   '  ',
\   'error':     '  ',
\ },
\}
" vim clap todoist config
let clap_provider_todoist = {
\ 'source': {-> Todoist__listProjects()},
\ 'sink': 'Todoist',
\}
" keybinding
nnoremap <Leader>t :Clap todoist<CR>

" any jump configuration
" Show line numbers in search rusults
let g:any_jump_list_numbers = 1
