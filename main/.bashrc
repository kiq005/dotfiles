#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# Configurations
if [ -f ~/.bash_aliases ]; then
. "$HOME/.bash_aliases"
fi

#if [ -f ~/.bash_init ]; then
#. "$HOME/.bash_init"
#fi

# Other
shopt -s autocd
shopt -s checkwinsize
complete -cf sudo

# Hooks
if [[ $PS1 ]]; then
	[[ -r /usr/share/doc/pkgfile/command-not-found.bash ]] && . /usr/share/doc/pkgfile/command-not-found.bash
	[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
fi

# Evals
eval $(thefuck --alias)

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

# Options
# # Prevent overwrite of files
# set -o noclobber

#################
### Functions ###
#################

#
# # colors - Display terminal colors
# # usage: colors
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1 ;;
			*.tar.gz)	tar xzf $1 ;;
			*.bz2)		bunzip2 $1 ;;
			*.rar)		unrar x $1 ;;
			*.gz)		gunzip $1  ;;
			*.tar)		tar xf $1  ;;
			*.tbz2)		tar xjf $1 ;;
			*.tgz)		tar xzf $1 ;;
			*.zip)		unzip $1   ;;
			*.Z)		uncompress $1 ;;
			*.7z)		7z x $1    ;;
			*)		echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

_csource() {
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path" > /dev/null 2>&1;
	return 0;
}

_cppsource(){
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	g++ "$1" -o "$output_path" && "$output_path";
	rm "$output_path" > /dev/null 2>&1;
	return 0;
}

_nimsource(){
    local output_path=${TMPDIR:-/tmp}/${1##*/};
    nim c --verbosity:0 -o:"$output_path" -r "$1";
	rm "$output_path" > /dev/null 2>&1;
    return 0;
}

_rustsource(){
    local output_path=${TMPDIR:-/tmp}/${1##*/};
	rustc "$1" -o "$output_path" && "$output_path";
	rm "$output_path" > /dev/null 2>&1;
    return 0;
}

run(){
    [[ $1 ]] || { echo "Missing operand" >&2; return 1; }
    [[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
    case $1 in 
        *.cpp) _cppsource $1    ;;
        *.c) _csource $1        ;;
        *.py) python $1         ;;
        *.nim) _nimsource $1    ;;
        *.rs) _rustsource $1    ;;
        'PKGBUILD') makepkg -si ;;
        *) echo "'$1' unknown source file type." ;;
    esac
}

###################
### POWER SHELL ###
###################
function _update_ps1() {
	PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# IBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx &

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kaique/.sdkman"
[[ -s "/home/kaique/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kaique/.sdkman/bin/sdkman-init.sh"
