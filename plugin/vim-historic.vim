" Historic - Vim save history using git
"
" Paul Serby - https://github.com/PabloSerbo/
"
" Created April 2011

if exists("g:historicInstalled")
"	finish
else
	let g:historicInstalled = 1
endif

if !exists("g:historicBackupOnSave")
	let g:historicBackupOnSave = 1
endif

" Dependence Check
if (system("which git") == "")
	throw "Could not find git"
end

if !exists("g:historicBackupRepoLocation")
	let g:historicBackupRepoLocation = "~/.vim.backup"
endif

let s:installPath = expand("<sfile>:p:h")

function! s:backup(filepath)
	if exists('b:noBackups')
		return
	endif
	:let output = system("sh " . s:installPath . "/../bin/backup.sh " . g:historicBackupRepoLocation . " " . a:filepath)
endfunction

function! s:listHistory(filepath)
	let currentPath = expand("%:p:h")
	exec "cd " . g:historicBackupRepoLocation
	exec "!git --no-pager log --no-color --pretty=oneline ." . a:filepath
	exec "cd " . currentPath
endfunction

function! s:compareWithHistory(filepath)
	echo "Not yet implemented"
endfunction

function! s:replaceWithHistory(filepath)
	echo "Not yet implemented"
endfunction

command! HistoricBackup :call s:backup(expand("%:p"))
command! HistoricList :call s:listHistory(expand("%:p"))
command! HistoricCompare :call s:compareWithHistory(expand("%:p"))
command! HistoricReplace :call s:replaceWithHistory(expand("%:p"))

if g:historicBackupOnSave == 1
	autocmd! Filetype gitcommit let b:noBackups=1
	autocmd! BufWritePost * :HistoricBackup
endif
