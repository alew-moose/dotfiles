" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" TODO: mv to scheme.vim ?

setlocal ai nosi
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

setlocal lisp

let b:undo_indent = "setl ai< si<"

setlocal lispwords=define,set!,lambda,if,case,record-case,let,let*,letrec,let-values,let*-values,do,do*,define-syntax,let-syntax,letrec-syntax,eval-when,unless,when,with-input-from-string,with-output-to-string,abort,library,module,syntax-rules,syntax-case,with-syntax,trace-define-syntax,define-enumeration,define-record-type,
