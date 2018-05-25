" Vim syntax file
" Language: XYZ structure file
" Maintainer: Roberto Amabile, CMC-RUB
" Latest Revision: 24 May 2018
" Todo: highlight syntax errors:
"   non-digit Natoms, non-number Coordinates, less than 2 Coordinates columns

" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish |  endif

syntax match xyzComment /#.*/
syn match xyzNatoms  /\v%^\s*\d+.*/ nextgroup=xyzPreamble skipnl
syn match xyzPreamble contained /.*/ contains=xyzComment nextgroup=xyzBody skipnl
syn region xyzBody start=/^/ end=/\v^\s*(#.*)?$/ contained contains=xyzElem,xyzComment

syn match xyzElem  contains=xyzCoords,xyzComment         
\ "\v^\s*(\S+\s+){3}\S+\s*"  
syn match xyzCoords contained contains=xyzComment
\ "\v^\s*\S+\zs(\s+\S+){3}" 

""" HIGHLIGHT DEFINITION
hi def link     xyzComment          Comment  
hi def link     xyzNatoms           Special  
hi def link     xyzPreamble         PreProc  
hi def link     xyzElem             Statement
hi def link     xyzCoords           Constant
hi def link     xyzBody         Error
