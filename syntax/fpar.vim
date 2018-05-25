" Vim syntax file
" Language: MOF+ force-field parameter file
" Maintainer: Roberto Amabile, CMC-RUB
" Latest Revision: 23 May 2018
" Todo: define regions to match errors:
"   variables region after keyword variables
"   parameters region after appropriate keywords

" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish |  endif

" COMMENTS AND INFO
" comments starts with "#"
syntax match fparComment contains=fparFunc,fparAtom,fparConn,fparFrag,fparFFdef /#.*/
syntax match fparAtom contained contains=fparSpecial /\v((-\>\()|,)@>[[:alnum:]]+(_)@=/
syntax match fparConn contained contains=fparSpecial /\v(_)@>[[:alnum:]]+(\@)@=/
syntax match fparFrag contained contains=fparSpecial /\v(\@)@>[[:alnum:]]+([,)])@=/
syntax match fparFFdef contained contains=fparSpecial /\v(\)\|)@>[[:graph:]]+/
syntax match fparSpecial contained /\v[\-\>_@,\|\(\)]/

" HEADER
syntax match    fparKeyBegin contains=fparKey,fparVal,fparComment "^[[:blank:]]*[[:graph:]]+"
syntax keyword fparKey nextgroup=fparVal skipwhite
\ FF
\ bnd_type
\ ang_type
\ dih_type
\ oop_type
\ cha_type
\ vdw_type
\ azone
\ refsysname
\ variables
syntax match fparVal contained "[[:graph:]]\+.*" contains=fparComment

" MISC
syntax include @Python $VIMRUNTIME/syntax/python.vim
syn match fparVar contained   "\$[[:graph:]]*"
syntax keyword fparFunc contained
\ mm3 morse quartic
\ mm3 fourier quartic strbnd
\ cos3 cos4
\ harm cos4
\ gaussian
\ buck6d

" BODY
" line starting with integer
syn match fparPar "^[[:blank:]]*\d\+[[:blank:]]\+.*" contains=fparIndex,fparFunc,fparVar,pythonNumber,fparComment transparent

" line starting with variable
syn match fparDef   "^[[:blank:]]*\$[[:graph:]]\+[[:blank:]]\+.*" contains=fparVar,fparSpec,pythonNumber,fparComment transparent
syn match fparSpec contained "[hiz]"

syn match fparError contains=TOP "\S*"

""" HIGHLIGHT DEFINITION
hi def link     fparComment         Comment
hi def link     fparSpecial         Special
hi def link     fparAtom            Statement
hi def link     fparConn            Type
hi def link     fparFrag            PreProc
hi def link     fparFFdef            PreProc

hi def link     fparKey             Statement
hi def link     fparVal             Constant

hi def link     fparIndex           Constant
hi def link     fparFunc            Type

"hi def link     fparDef             PreProc
hi def link     fparVar             PreProc
hi def link     fparSpec            Special

hi def link     fparError           Error
