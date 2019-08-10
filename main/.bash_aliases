alias weather="curl wttr.in/?format=3"

has_pacman="$(command -v pacman)"
has_apt="$(command -v apt)"
has_brew="$(command -v brew)"
# Pacman shortcut
if [ $UID -ne 0 ]; then
	if [ -n "$has_pacman" ]; then
		alias install="sudo pacman -S"
		alias remove="sudo pacman -R"
		alias dremove="sudo pacman -Rs"
		alias update="sudo pacman -Sy"
		alias upgrade="sudo pacman -Syu"
		alias query="sudo pacman -Qs"
	fi
	if [ -n "$has_apt" ]; then
		alias update="sudo apt-get update"
		alias upgrade="sudo apt-get upgrade"
		alias clear-apt="sudo apt-get autoremove && apt-get autoclean"
	fi
	if [ -n "$has_brew" ]; then
		alias update="brew upgrade"
		alias upgrade="brew update"
	fi
fi

# Downloading
alias down-audio="youtube-dl --extract-audio --audio-format best --add-metadata --yes-playlist -i"

# Wine Prefixes
alias win32="env WINEPREFIX=~/win32 wine"
alias win64="env WINEPREFIX=~/win64 wine"

# Avoid Mistakes
alias rm="rm -vI"
alias mv="mv -v"
alias cp="cp -v"

# Color support
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"

# LS aliases
alias ll="ls -alF"
alias la="ls -A"
alias l.="ls -A | egrep '^\.'"
alias l="ls -CF"
alias ldir="ls -l | grep ^d"

# Information
alias path="echo -e ${PATH//:/\\n}"
alias now='date +"%T"'

# Network
alias fastping="ping -c 100 -s.2"
alias ports="netstate -tulanp"

# Cool
alias ..="cd .."
alias ...="cd ../../"
alias wgetc="wget -c"



