"           ╭──────────────────────orrer.vim──────────────────────╮
"           Maintainer:     ihsan, ihsanl[at]pm[dot]me            │
"           Description:    Manage custom errors                  │
"           Last Change:    2020 Jul 15 16:48:16 +03, @1594820900 │
"           First Appeared: 2020 Jul 11 16:00:13 +03, @1594301382 │
"           License:        MIT                                   │
"           ╰─────────────────────────────────────────────────────╯

" ╭── let these vars in your own plugin ──╮
" let g:orrer#dict = {}
" let g:orrer#mainprg = ''
" ╰───────────────────────────────────────╯

func! orrer#fatal(id)
	let err = g:orrer#dict[a:id]
	echoerr
			\ a:id.': '
			\ .orrer#message(err)
			\ .orrer#suggestions(err)
endf

func! orrer#message(err)
	let err = deepcopy(a:err)
	return '['.g:orrer#mainprg.']: '.err['message'].'!'
endf

func! orrer#suggestions(err)
	let err = deepcopy(a:err)
	let suggestions = ''
	if len(err['suggestions']) > 0
		let suggestions .= ' suggestion(s): '.join(err['suggestions'], ' or ')
	end
	return suggestions
endf
