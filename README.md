# Historic - Vim save history using git

This is a simple vim plugin that stores each save vim makes to a git repo. I wrote this because I miss the excellent local history built into Eclipse. Originally I tried [vimlocalhistory](https://github.com/hjdivad/vimlocalhistory) but we (www.clock.co.uk) are a PHP/JavaScript house and don't have Ruby on all our environments. So I have created a plugin that has as few dependencies as possible.

## Requires
* git
* bash

## Usage

Create a backup of the last save for the current file. If the file hasn't changed then no backup will be made

      :HistoricBackup

Show available revisions for file

      :HistoricList

(Incomplete) Compare the current buffer with a historic version. If you omit revision the latest revision will be used

      :HistoricCompare <Revision>

(Incomplete) Replace the current buffer with a historic version. If you omit revision the latest revision will be used

      :HistoricReplace <Revision>

By default Historic will bind to the save (BufWritePost) of every filetype and run :HistoricBackup. If you would like to disable this function and action the backup manually do the following in you .vimrc.

      let g:historicBackupOnSave = 0

By default Historic will create the backup repo in ~/.vim.backup you can change by defining the location in your .vimrc as below

      let g:historicBackupRepoLocation = "~/mycustomlocation"

If you wish to perform backups in your own way, you can provide a path to different backup script

      let g:historicBackupScriptLocation = "~/myBackupScript.sh"


## Credits
[Paul Serby](https://github.com/PabloSerbo/)

## Licence
Licenced under the [New BSD License](http://opensource.org/licenses/bsd-license.php)
