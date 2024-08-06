" Vim indent file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2005 Mar 27

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" C indenting is built-in, thus this is very simple
setlocal nolisp
setlocal autoindent
setlocal noexpandtab
setlocal tabstop=8
setlocal shiftwidth=8

setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*GoIndent")
  finish
endif

function! GoIndent(lnum) abort
  let prevlnum = prevnonblank(a:lnum-1)
  if prevlnum == 0
    " top of file
    return 0
  endif

  " grab the previous and current line, stripping comments.
  let prevl = substitute(getline(prevlnum), '//.*$', '', '')
  let thisl = substitute(getline(a:lnum), '//.*$', '', '')
  let previ = indent(prevlnum)

  let ind = previ

  for synid in synstack(a:lnum, 1)
    if synIDattr(synid, 'name') == 'goRawString'
      if prevl =~ '\%(\%(:\?=\)\|(\|,\)\s*`[^`]*$'
        " previous line started a multi-line raw string
        return 0
      endif
      " return -1 to keep the current indent.
      return -1
    endif
  endfor

  if prevl =~ '[({]\s*$'
    " previous line opened a block
    let ind += shiftwidth()
  endif
  if prevl =~# '^\s*\(case .*\|default\):$'
    " previous line is part of a switch statement
    let ind += shiftwidth()
  endif
  " TODO: handle if the previous line is a label.

  if thisl =~ '^\s*[)}]'
    " this line closed a block
    let ind -= shiftwidth()
  endif

  " Colons are tricky.
  " We want to outdent if it's part of a switch ("case foo:" or "default:").
  " We ignore trying to deal with jump labels because (a) they're rare, and
  " (b) they're hard to disambiguate from a composite literal key.
  if thisl =~# '^\s*\(case .*\|default\|[A-Z_]\+\):$'
    let ind -= shiftwidth()
  endif

  return ind
endfunction
