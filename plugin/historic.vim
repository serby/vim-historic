if exists("g:localHistoryInstalled")
	"finish
else
	let g:localHistoryInstalled = 1
endif

if !exists("g:localHistoryBackupRepoLocation")
	let g:localHistoryBackupRepoLocation = '~/.vim.backup'
endif

function! s:backup(filepath)
	exec "!sh ~/backup.sh" g:localHistoryBackupRepoLocation a:filepath
endfunction

function! s:listHistory(filepath)
	let currentPath = expand("%:p:h")
	exec "cd " . g:localHistoryBackupRepoLocation
	exec "!git log --pretty=oneline ." . a:filepath
	exec "cd " . currentPath
endfunction

command! LHList :call s:listHistory(expand("%:p"))
command! LHBackup :call s:backup(expand("%:p"))
