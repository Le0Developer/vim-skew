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
syn keyword skewConstant null true false self

" Numbers
syn match   skewNumberDecimal "\<[0-9]\+\>"
syn match   skewNumberBinary "\<0b[01]\+\>"
syn match   skewNumberOctal "\<0o[0-7]\+\>"
syn match   skewNumberHexadecimal "\<0x[0-9a-fA-F]\+\>"

" Annotations
syn match   skewAnnotation "@[A-Za-z_][A-Za-z0-9_]*\>"

" Storage Types
syn keyword skewType bool double dynamic fn int string
syn match   skewTypeIdentifier "\<[A-Z][A-Za-z0-9]*\>"

" Function Names
syn keyword skewFunctionDef def nextgroup=skewFunctionName skipwhite
syn match   skewFunctionName "\<[A-Za-z_][A-Za-z0-9_]\*\>"

" Variable Names
syn keyword skewVariableDef catch const for var nextgroup=skewVariable skipwhite
syn match   skewVariable "\<[A-Za-z_][A-Za-z0-9_]\*\>"

" Class, Enum, Interface, etc.
syn keyword skewClassKeyword class enum flags interface namespace over type nextgroup=skewClassName skipwhite
syn match   skewClassName "\<[A-Za-z_][A-Za-z0-9_]\*\>"


" Identifiers
syn match   skewIdentifier "\<[A-Za-z_][A-Za-z0-9_]\*\>"

" Strings
syn region  skewCharacter start="'" end="'"
syn region  skewString start="\"" end="\"" contains=skewEscape,skewInterpolatedString

" Escape Sequences
syn match   skewEscape "\\."

" Interpolated Strings
syn region  skewInterpolatedString start="\\(" end=")"

" Define highlighting
hi def link skewComment Comment
hi def link skewKeyword Keyword
hi def link skewVariableDef Keyword
hi def link skewConstant Constant
hi def link skewNumberDecimal Constant
hi def link skewNumberBinary Constant
hi def link skewNumberOctal Constant
hi def link skewNumberHexadecimal Constant
hi def link skewCharacter Constant
hi def link skewAnnotation Keyword
hi def link skewType Type
hi def link skewFunctionDef Keyword
hi def link skewFunctionName Function
hi def link skewVariable Identifier
hi def link skewClassKeyword Keyword
hi def link skewClassName Type
hi def link skewTypeIdentifier Type
hi def link skewString String
hi def link skewEscape SpecialChar

let b:current_syntax = "skew"
