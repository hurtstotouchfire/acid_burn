"        File: lastchange.vim
"      Author: Srinath Avadhanula <srinath@fastmail.fm>
" Last Change: Wed May 09 09:00 PM 2012 E
" Description: sets the last modification time of the current file.
"              the modification time is truncated to the last hour.  and the
"              next time the time stamp is changed, it is checked against the
"              time already stamped. this ensures that the time-stamp is
"              changed only once every hour, ensuring that the undo buffer is
"              not screwed around with every time we save.
"              To force the time stamp to be not updated, use the command:
"              		:NOMOD
"              To change it back, use
"              		:MOD

if !exists('g:timeStampLeader')
	let s:timeStampLeader = 'Last Modified: '
else
	let s:timeStampLeader = g:timeStampLeader
endif

function! UpdateWithLastMod()
	if exists('b:nomod') && b:nomod
		return
	end
	let pos = line('.').' | normal! '.virtcol('.').'|'
	0
	if search(s:timeStampLeader) <= 20 && &modifiable
		let lastdate = matchstr(getline('.'), s:timeStampLeader.'\zs.*')
		" change time-zone from 'Pacific Standard Time' to 'PST'
		" let timezone = substitute(strftime('%Z'), '\<\(\w\)\(\w*\)\>\(\W\|$\)', '\1', 'g')
		" let newdate = strftime("%a %b %d %I:00 %p %Y %Z") ").' '.timezone
		let newdate = strftime("%a %b %d %I:%M %p %Y %Z") ").' '.timezone
		if lastdate == newdate
			exe pos
			return
		end
		" exe 's/'.s:timeStampLeader.'.*/'.s:timeStampLeader.'<C-i>'.newdate.'/e'
		exe 's/'.s:timeStampLeader.'.*/'.s:timeStampLeader.'        '.newdate.'/e'
		call s:RemoveLastHistoryItem()
	else
		return
	end
	
	exe pos
endfunction

augroup LastChange
	au!
	au BufWritePre * :call UpdateWithLastMod()
augroup END

function! <SID>RemoveLastHistoryItem()
  call histdel("/", -1)
  let @/ = histget("/", -1)
endfunction

com! -nargs=0 NOMOD :let b:nomod = 1
com! -nargs=1 MOD   :let b:nomod = 0

" vim:ts=4:sw=4:noet
