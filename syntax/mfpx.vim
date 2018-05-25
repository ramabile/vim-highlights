" Vim syntax file
" Language: MOF+ structure file
" Maintainer: Roberto Amabile, CMC-RUB
" Latest Revision: 20 May 2018
" Todo: refactoring, more keyword, and syntax error highlighting

" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish |  endif

"""
" RATIONALE [RA]
" regex does provide column match, but I did not get a single column highlight.
" Thus, I highlight the whole line and then get column by column starting from
" the previous match.
" Using nextgroup+skipwhite with word definition is possible and more readable,
" but I am not proficient enough at the moment with vim regex's!
"""

""" COLUMNS
" highlight the whole line (i.e. column 1) to start column matching [needed! faster solutions?][RA]
syn match mfpxIndex contains=mfpxNatom,mfpxElem,mfpxPreamble,mfpxComment ".*"

""" NEW
function MatchSyntaxColumn(group,ncol,contstr)
    "syn match GROUP contained contains=REST
    "\ "\v(.{-}\zs[[:graph:]]+){NCOL}.*"
    execute 'syn match '.a:group.' contains='.a:contstr.
    \' "\v(.{-}\zs[[:graph:]]+){'.a:ncol.'}.*"'
endfunction

" from column 2 (i.e. column 2) in mfpxIndex
call MatchSyntaxColumn("mfpxElem",          2,      "mfpxCoords,mfpxComment")
" from column 2 (i.e. column 3-4) in mfpxElem
call MatchSyntaxColumn("mfpxCoords",        2,      "mfpxType,mfpxComment")
"" from column 4 (i.e. column 6) in mfpxCoords
call MatchSyntaxColumn("mfpxType",          4,      "mfpxConnectivity,mfpxComment")
"" from column 2 (i.e. column 7-) in mfpxType (N.B.: not colored!)
call MatchSyntaxColumn("mfpxConnectivity",  2,      "mfpxConnindex,mfpxNotConnindex,mfpxSeparator,mfpxComment")

""" OLD (first attempt, here for reference)
" from column 2 (i.e. column 2) in mfpxIndex
"syn match mfpxElem contained contains=mfpxCoords,mfpxComment
"\ "\v(.{-}\zs[[:graph:]]+){2}.*"
" from column 2 (i.e. column 3-4) in mfpxElem
"syn match mfpxCoords contained contains=mfpxType,mfpxComment
"\ "\v(.{-}\zs[[:graph:]]+){2}.*"
"" from column 4 (i.e. column 6) in mfpxCoords
"syn match mfpxType contained contains=mfpxConnectivity,mfpxComment
"\ "\v(.{-}\zs[[:graph:]]+){4}.*"
"" from column 2 (i.e. column 7-) in mfpxType (N.B.: not colored!)
"syn match mfpxConnectivity contained contains=mfpxConnindex,mfpxNotConnindex,mfpxSeparator,mfpxComment
"\ "\v(.{-}\zs[[:graph:]]+){2}.*"


""" MISC
" natoms if it is the only integer in a line
syn match mfpxNatom contained contains=mfpxComment
\ "^[[:blank:]]*\d\+[[:blank:]]*\(#\|$\)"

""" CONNECTIVITY
" any digit in connectivity information
syn match mfpxConnindex contained
\ "\d"
" any alpha in connectivity information
syn match mfpxNotConnindex contained
\ "\a"
" slash as separator in connectivity information
syn match mfpxSeparator contained
\ "\/"

""" COMMENTS AND PREAMBLE
" comments starts with "#" unless it is a preamble (see below)"
syntax match mfpxComment /#.*/ contained contains=mfpxPreamble
" preamble starts with "#" as first character in line AND second character is blank
syntax match mfpxPreamble /^#[[:blank:]].*/ contained contains=mfpxKeyword,mfpxValue
" keyword are highlighted on exact match in preamble
syntax keyword mfpxKeyword type cell contained nextgroup=mfpxValue

""" HIGHLIGHT DEFINITION
hi def link     mfpxComment         Comment
hi def link     mfpxPreamble        PreProc
hi def link     mfpxKeyword         Statement
hi def link     mfpxValue           Constant

hi def link     mfpxIndex           Constant
hi def link     mfpxElem            Statement
hi def link     mfpxCoords          Constant
hi def link     mfpxType            Type
hi def link     mfpxConnectivity    Special
hi def link     mfpxNatom           Statement

hi def link     mfpxConnindex       Constant
hi def link     mfpxNotConnindex    Error
hi def link     mfpxSeparator       Special
