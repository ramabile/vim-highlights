" Vim syntax file
" Language: XYZ structure file
" Maintainer: Roberto Amabile, CMC-RUB
" Latest Revision: 23 May 2018
" Todo: highlight syntax errors:
"   non-digit Natoms, non-number Coordinates, non-digit Connectivity, less than 5 columns

" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish |  endif

syntax match xyzComment /#.*/
syn match xyzNatoms  /\v%^\s*\d+/ nextgroup=xyzPreamble skipwhite
syn match xyzPreamble contained /.*/ contains=xyzComment nextgroup=xyzBody skipnl
syn region xyzBody start=/^/ end=/\v^[[:blank:]]*(#.*)$/ contained contains=xyzIndex,xyzElem,xyzCoords,xyzType,xyzConn,xyzComment transparent

syn match xyzIndex  contained contains=xyzIndexOK,xyzComment
\ "\v^(.{-}[[:graph:]]+){1}"
syn match xyzElem   contained contains=xyzIndex,xyzComment
\ "\v^(.{-}[[:graph:]]+){2}"
syn match xyzCoords contained contains=xyzElem,xyzComment
\ "\v^(.{-}[[:graph:]]+){3,5}"
syn match xyzType contained contains=xyzCoords,xyzComment
\ "\v^(.{-}[[:graph:]]+){6}"
syn match xyzConn contained contains=xyzType,xyzComment
\ "\v^(.{-}[[:graph:]]+){7,}"

syn match xyzIndexOK contained "[[:blank:][:digit:]]"

""" HIGHLIGHT DEFINITION
hi def link     xyzComment          Comment  
hi def link     xyzNatoms           Special  
hi def link     xyzPreamble         PreProc  
hi def link     xyzIndex            Error
hi def link     xyzIndexOK          Constant
hi def link     xyzElem             Statement
hi def link     xyzCoords           Constant
hi def link     xyzType             Type
hi def link     xyzConn             Constant 
