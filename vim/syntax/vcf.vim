" Syntax highlighting for vCard files

if exists("b:current_syntax")
  finish
endif

syntax match vcardHeader contained /^BEGIN:VCARD/
syntax match vcardFooter contained /^END:VCARD/
syntax match vcardMeta contained /^\(VERSION\|REV\|PRODID\|UID\|CATEGORIES\):.*$/
syntax cluster vcardWrapper contains=vcardHeader,vcardFooter,vcardMeta

syntax keyword vcardTypeKeyword contained CELL HOME WORK VOICE TEXT pref
syntax match vcardType contained /type=[^;:]*/he=s+5 contains=vcardTypeKeyword

syntax match vcardNames contained /[:;]\zs[^;:]*/
syntax match vcardNameField contained /^N.*/ contains=vcardNames

syntax match vcardGeneralData contained /[:]\zs.*/
syntax match vcardGeneralField contained /^\(FN\|NICKNAME\|ORG\|TITLE\|TEL\|EMAIL\|ADR\|URL\|PHOTO\|BDAY\|NOTE\|X-SOCIALPROFILE\|X-ALTBDAY\).*/ contains=vcardType,vcardGeneralData

syntax match vcardItemField contained /\(TEL\|EMAIL\|ADR\|URL\|X-ABLabel\|X-ABLABEL\|X-ABDATE\|IMPP\).*/ contains=vcardType,vcardGeneralData
syntax match vcardItem contained /^item\d\{1,2}\..*/ contains=vcardItemField

syntax cluster vcardComponents contains=@vcardWrapper,vcardNameField,vcardGeneralField,vcardItem
syntax region vcardRegion start=/^BEGIN:VCARD/ end=/^END:VCARD/ fold keepend contains=@vcardComponents

hi def link vcardHeader vcardWrapper
hi def link vcardFooter vcardWrapper
hi def link vcardMeta vcardWrapper
hi def link vcardWrapper Comment

hi def link vcardTypeKeyword Type
hi def link vcardType tag
hi def link vcardGeneralData Constant
hi def link vcardGeneralField Keyword
hi def link vcardItemField Keyword
hi def link vcardItem Tag

hi def link vcardNameField Keyword
hi def link vcardNames Constant

" Enable folding
setlocal foldmethod=syntax
setlocal foldlevel=1

" minimum lines searching backwards when rendering, adjust this when
" highlighting is buggy
syntax sync minlines=20

let b:current_syntax = "vcf"
