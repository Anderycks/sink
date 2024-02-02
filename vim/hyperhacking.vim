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

if has('gui_running')
    set background=dark
    set termguicolors
    highlight Normal gui=None guibg=black guifg=white
    highlight CursorLineNr gui=None guifg=#9e9e9e guibg=#444444
    highlight LineNr gui=None guibg=black guifg=lightgrey
    highlight Cursor gui=None guifg=black guibg=white
    highlight SignColumn gui=None guifg=white guibg=black
    highlight Pmenu gui=None guifg=#000000 guibg=#b28ff8
    highlight String gui=None guifg=#33db90 guibg=black
    highlight Comment gui=None guifg=#33db90 guibg=black ctermfg=Green ctermbg=black
    highlight Identifier gui=None guifg=#ef84e4 guibg=black
    highlight Keyword gui=None guifg=#86bdf9 guibg=black
    highlight Type gui=None guifg=#eff07f guibg=black
    highlight Constant gui=None guifg=#ef84e4 guibg=black
    highlight Statement gui=None guifg=#86bdf9 guibg=black
    highlight PreProc gui=None guifg=#86bdf9 guibg=black
    highlight htmlTag gui=None guifg=#86bdf9 guibg=black
    highlight htmlEndTag gui=None guifg=#86bdf9 guibg=black
    highlight htmlTitle gui=None guifg=white guibg=black
    highlight htmlArg gui=None guifg=#b28ff8 guibg=black
    highlight pythonFunction gui=None guifg=#33db90 guibg=black
    highlight Title gui=None guifg=#eff07f guibg=black
    highlight Operator gui=None guifg=#86bdf9 guibg=black
    highlight Special gui=None guifg=#ef84e4 guibg=black
    highlight Error gui=None guifg=#000000 guibg=#ef84e4
else
    highlight Normal ctermfg=white ctermbg=black
    highlight LineNr ctermfg=lightgrey ctermbg=black
    highlight SignColumn ctermfg=lightgrey ctermbg=black
    highlight Cursor ctermbg=white ctermfg=black
    highlight Pmenu ctermbg=141 ctermfg=Black
    highlight String ctermfg=78 ctermbg=Black
    highlight Comment ctermfg=78 ctermbg=Black
    highlight Identifier ctermfg=212 guibg=Black
    highlight Keyword ctermfg=111 ctermbg=Black
    highlight Type ctermfg=228 ctermbg=Black
    highlight Constant ctermfg=212 ctermbg=Black
    highlight Statement ctermfg=111 ctermbg=Black
    highlight Function ctermfg=78 ctermbg=Black
    highlight PreProc ctermfg=111 ctermbg=Black
    highlight htmlTag ctermfg=111 ctermbg=Black
    highlight htmlEndTag ctermfg=111 ctermbg=Black
    highlight htmlTitle ctermfg=White ctermbg=Black
    highlight htmlArg ctermfg=141 ctermbg=Black
    highlight pythonFunction ctermfg=78 ctermbg=Black
    highlight Title ctermfg=228 ctermbg=Black
    highlight Operator ctermfg=111 ctermbg=Black
    highlight Special ctermfg=212 ctermbg=Black
    highlight Error ctermfg=Black ctermbg=212
endif

