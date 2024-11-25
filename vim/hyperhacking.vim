" Name:         hyperhacking
" Description:  A vim colorscheme to match my Hyper terminal theme.
" Author:       Deryck Hodge <deryckh@gmail.com>
" Maintainer:   Deryck Hodge <deryckh@gmail.com>
" Website:      TBD
" License:      Same as Vim
" Last Updated: October 15, 2023


if exists('syntax_on')
  syntax reset
endif

highlight clear

let g:colors_name = 'hyperhacking'

highlight Normal ctermfg=white ctermbg=black
highlight LineNr ctermfg=lightgrey ctermbg=black
highlight SignColumn ctermfg=lightgrey ctermbg=black
highlight Cursor ctermbg=white ctermfg=black
highlight Pmenu ctermbg=141 ctermfg=Black
highlight String ctermfg=66 ctermbg=Black
highlight Comment ctermfg=66 ctermbg=Black
highlight Identifier ctermfg=212 guibg=Black
highlight Keyword ctermfg=111 ctermbg=Black
highlight Type ctermfg=141 ctermbg=Black
highlight Constant ctermfg=212 ctermbg=Black
highlight Statement ctermfg=111 ctermbg=Black
highlight Function ctermfg=111 ctermbg=Black
highlight PreProc ctermfg=111 ctermbg=Black
highlight htmlTag ctermfg=111 ctermbg=Black
highlight htmlEndTag ctermfg=111 ctermbg=Black
highlight htmlTitle ctermfg=White ctermbg=Black
highlight htmlArg ctermfg=141 ctermbg=Black
highlight pythonFunction ctermfg=78 ctermbg=Black
highlight pythonClasss ctermfg=212 ctermbg=Black
highlight Title ctermfg=228 ctermbg=Black
highlight Operator ctermfg=111 ctermbg=Black
highlight Special ctermfg=212 ctermbg=Black
highlight Error ctermfg=Black ctermbg=212
highlight Directory ctermfg=111 ctermbg=Black
highlight NERDTreeCWD ctermfg=141 ctermbg=Black
