source /apollo/env/envImprovement/var/zshrc
#
#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP
export OVERRIDE_EDITOR=e
export TERM=xterm-256color

alias ki='kinit -f -l 10h'
export DEV_DB='@"(DESCRIPTION=(ENABLE=BROKEN)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=tdgsh1na-orasvr.db.amazon.com)(PORT=56250)))(CONNECT_DATA=(SID=tdgsh1na)))"'
export PROD_DB='@"(DESCRIPTION=(ENABLE=BROKEN)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=dgsh1na-orasvr.db.amazon.com)(PORT=56251)))(CONNECT_DATA=(SID=dgsh1na)))"'
alias gca='git commit -a'
alias bb='brazil-build'
alias prod-logsearch='/apollo/env/LogSearchServiceCli/bin/logsearch -o device-asset-tracking-ops@amazon.com -ms com.amazon.access.device-asset-tracking-ops-diptanja-2 -r us-east-1 -nf corp -lg'
alias beta-logsearch='/apollo/env/LogSearchServiceCli/bin/logsearch -o device-asset-tracking-ops@amazon.com -ms com.amazon.access.device-asset-tracking-ops-diptanja-2 -r us-west-2 -nf corp -lg'


function add-backup-hook {
  echo "git push backup HEAD --force" >> ./.git/hooks/post-commit
  chmod +x ./.git/hooks/post-commit
}

setopt NO_BEEP

alias register_with_aaa='/apollo/env/AAAWorkspaceSupport/bin/register_with_aaa.py'
alias brazil-octane=/apollo/env/OctaneBrazilTools/bin/brazil-octane

function aedo {
  sudo /apollo/bin/runCommand -a $1 -e DeviceAssetTracking$2
}
## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
#
## set PATH
PATHFILE=~/.zshenv
source $PATHFILE
