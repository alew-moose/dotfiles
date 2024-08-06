" Vim indent file
" Language:	Lisp
" Maintainer:    Sergey Khorev <sergey.khorev@gmail.com>
" URL:		 http://sites.google.com/site/khorser/opensource/vim
" Last Change:	2012 Jan 10

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal ai nosi
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nolisp
setlocal equalprg=
setlocal indentexpr=scmindent#GetScmIndent(v:lnum)

let b:undo_indent = "setl ai< si<"
