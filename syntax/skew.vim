" Vim syntax file
" Language: Skew

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "skew"

syn case match

" Define file types
if exists("main_syntax")
  finish
endif

" Comments
syn region  skewComment start="###\n" end="###.*" contains=@Spell
syn match   skewComment "#.*" contains=@Spell

" Keywords
syn keyword skewKeyword as break case continue default else finally if in is return super switch throw try while

" Constants
syn match   skewConstant "\<\%(null\|true\|false\|self\|0b[01]\+\(\.[01]\+\)\?\|0o[0-7]\+\(\.[0-7]\+\)\?\|0x[0-9A-Fa-f]\+\(\.[0-9A-Fa-f]\+\)\?\|[0-9]\+\(\.[0-9]\+\)\?\(e[+-]\?[0-9]\+\)\?f\?\)\>"

" Numbers
syn match   skewNumber "\<\%(0b[01]\+\(\.[01]\+\)\?\|0o[0-7]\+\(\.[0-7]\+\)\?\|0x[0-9A-Fa-f]\+\(\.[0-9A-Fa-f]\+\)\?\|[0-9]\+\(\.[0-9]\+\)\?\(e[+-]\?[0-9]\+\)\?f\?\)\>"

" Annotations
syn match   skewAnnotation "@[A-Za-z_][A-Za-z0-9_]*\>"

" Storage Types
syn match   skewType "\<\%(bool\|double\|dynamic\|fn\|int\|string\|[A-Z][A-Za-z0-9_]*\(\.[A-Z][A-Za-z0-9_]*[a-z][A-Za-z0-9_]*\)*\)\>"

" Function Names
syn keyword skewFunctionDef def nextgroup=skewFunctionName skipwhite
syn match   skewFunctionName "\<[A-Za-z0-9_\-\+\*/%!^&|~=<>\[\]\{\}\.]\+\>"

" Variable Names
syn keyword skewVariableDef catch const for var nextgroup=skewVariable skipwhite
syn match   skewVariable "\<\%(catch\|const\|for\|var\)\>\s\+\([A-Za-z0-9_\.]\+\)\?" contains=skewIdentifier

" Class, Enum, Interface, etc.
syn keyword skewClassKeyword class enum flags interface namespace over type nextgroup=skewClassName skipwhite
syn match   skewClassName "\<[A-Za-z0-9_]\+\>"

" Identifiers
syn match   skewIdentifier "\<[A-Za-z0-9_]\+\>"

" Strings
syn region  skewString start="'" end="'" contains=skewEscape
syn region  skewString start="\"" end="\"" contains=skewEscape,skewInterpolatedString

" Escape Sequences
syn match   skewEscape "\\."

" Interpolated Strings
syn region  skewInterpolatedString start="\\(" end="\\)"

" Define highlighting
hi def link skewComment Comment
hi def link skewKeyword Keyword
hi def link skewVariableDef Keyword
hi def link skewConstant Constant
hi def link skewNumber Number
hi def link skewAnnotation Keyword
hi def link skewType Type
hi def link skewFunctionDef Keyword
hi def link skewFunctionName Function
hi def link skewVariable Identifier
hi def link skewClassKeyword Keyword
hi def link skewClassName Type
hi def link skewIdentifier Identifier
hi def link skewString String
hi def link skewEscape SpecialChar
hi def link skewInterpolatedString String

let b:current_syntax = "skew"
