#-------------for jumping to directory faster --------------------#
export MARKPATH=$HOME/.marks

function jump {
cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
rm -i "$MARKPATH/$1"
}
function marks {
ls -l "$MARKPATH" | sed 's/ / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
local curw=${COMP_WORDS[COMP_CWORD]}
local wordlist=$(find $MARKPATH -type l -printf "%f\n")
COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
return 0
}

complete -F _completemarks jump unmark
###################################################################

#------------- directory display --------------------#
export PS1='\[\e[32;1m\][\u@\W]\$\[\e[0m\] '
###################################################################

#------------- language config --------------------#
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
###################################################################

