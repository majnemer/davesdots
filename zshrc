# .zshrc
# Original, Main author: Saleem Abdulrasool <compnerd@compnerd.org>
# Trivial modifications: David Majnemer
# vim:set nowrap:

autoload -U compinit; compinit -d "${HOME}/.zsh/.zcompdump"

autoload -U age
autoload -U zmv

if [[ ${ZSH_VERSION//.} -gt 420 ]] ; then
	autoload -U url-quote-magic
	zle -N self-insert url-quote-magic
fi

autoload -U edit-command-line
zle -N edit-command-line

# disable core dumps
limit coredumpsize 0

# clear on exit
trap clear 0

# shell options
setopt AUTO_CD             # directoy command does cd
setopt CORRECT             # correct spelling of commands
setopt AUTO_PUSHD          # cd uses directory stack
setopt CHASE_DOTS          # resolve .. in cd
setopt CHASE_LINKS         # resolve symbolic links in cd
setopt CDABLE_VARS         # cd var works if $var is a directory
setopt PUSHD_SILENT        # make pushd quiet
setopt ALWAYS_TO_END       # goto end of word on completion
setopt EXTENDED_GLOB       # use zsh globbing extensions
setopt SH_WORD_SPLIT       # split non-array variables
setopt BASH_AUTO_LIST      # list completions on second tab
setopt LIST_ROWS_FIRST     # list completions across
setopt COMPLETE_IN_WORD    # completion works inside words
setopt MAGIC_EQUAL_SUBST   # special expansion after all =

unsetopt BEEP              # stop beeping!
unsetopt LIST_BEEP         # seriously, stop beeping!

unsetopt NO_MATCH          # dont error on no glob matches

# history
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${HOME}/.zsh/.history"

setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

unsetopt HIST_BEEP
unsetopt EXTENDED_HISTORY

# colors
if ( which dircolors &> /dev/null ) ; then
	eval $(dircolors -b $([ -f /etc/DIR_COLORS ] && echo "/etc/DIR_COLORS"))
elif ( which gdircolors &> /dev/null ) ; then
	eval $(gdircolors -b $([ -f /etc/DIR_COLORS ] && echo "/etc/DIR_COLORS"))
fi

# terminal fallback stuff
if (which infocmp &> /dev/null) ; then
	case "${TERM}" in
		xterm*)
			( infocmp $TERM &> /dev/null ) || export TERM=xterm
		;;
	esac
fi

( which lesspipe &> /dev/null ) && eval $(lesspipe)
export LESS=' -R'

( which less &> /dev/null ) && export PAGER='less'

( which vim &> /dev/null ) && export EDITOR='vim'

# aliases
alias cd..='cd ..'

case `uname -s` in
	Linux)
		alias ls="ls -h --color=auto"
		alias grep='grep -d skip --color=auto'
	;;
	FreeBSD|Darwin|DragonFly)
		# we must lie to the mac, for it is dumb
		export LSCOLORS=ExGxFxDxCxDxDxHbaDacec
		alias ls="ls -Gh"
		alias grep='grep -d skip --color=auto'
	;;
	Interix)
		alias ls="ls --color"
	;;
	SunOS)
		# solaris has ancient termcaps, force xterm to be old skool
		if [[ $TERM == (xterm*) ]]; then
			export TERM=xterm
		fi

		if (which gls &> /dev/null) ; then
			alias ls="gls -h --color=auto"
		else
			alias ls="ls -h"
		fi

		if (which ggrep &> /dev/null) ; then
			alias grep='ggrep -d skip --color=auto'
		fi
	;;
esac


alias df='df -h'
alias du='du -h'

alias ping='ping -c4'

alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm -ir'
alias mkdir='nocorrect mkdir'

alias :q='exit'
alias :wq='exit'

( type -p time &> /dev/null ) && alias time='command time'

# keybindings
bindkey -d
bindkey -e

bindkey ' ' magic-space

bindkey -M emacs '\ee' edit-command-line

bindkey -M emacs '' history-incremental-search-forward
bindkey -M emacs '' history-incremental-search-backward

case $TERM in
	xterm*)
		bindkey '^[[H' beginning-of-line
		bindkey '^[[F' end-of-line
		bindkey '^[OH' beginning-of-line
		bindkey '^[OF' end-of-line
		bindkey '^[[1~' beginning-of-line
		bindkey '^[[4~' end-of-line
		bindkey '^[[7~' beginning-of-line
		bindkey '^[[8~' end-of-line
		bindkey '^[[3~' delete-char
		bindkey '^[[1;5C' emacs-forward-word
		bindkey '^[[1;5D' emacs-backward-word
		bindkey '^[[5C' emacs-forward-word
		bindkey '^[[5D' emacs-backward-word
		bindkey '^[OC' emacs-forward-word
		bindkey '^[OD' emacs-backward-word
	;;
	linux)
		bindkey '^[[1~' beginning-of-line
		bindkey '^[[4~' end-of-line
		bindkey '^[[3~' delete-char
	;;
	rxvt*)
		bindkey '^[[c' emacs-forward-word
		bindkey '^[[d' emacs-backward-word
		bindkey '^[Oc' emacs-forward-word
		bindkey '^[Od' emacs-backward-word
		bindkey '^[[3~' delete-char
		bindkey '^[[7~' beginning-of-line
		bindkey '^[[8~' end-of-line
	;;
	interix)
		bindkey '^[[H' beginning-of-line
		bindkey '^[[U' end-of-line
		bindkey '^[[C' emacs-forward-word
		bindkey '^[[D' emacs-backward-word
	;;
esac

# prompt
if [[ -z ${SSH_TTY} ]] ; then
	PS1=$'%{\e[01;32m%}%n@%m %{\e[01;34m%}%~ %(?..%{\e[01;31m%})%(!.#.$) %{\e[00;00m%}'
	RPS1=$'%1(j.%{\e[00;36m%}[%j].)%{\e[01;33m%}[%t]%{\e[00;00m%}'
else
	PS1=$'%{\e[01;36m%}%n %(?..%{\e[01;31m%})%(!.#.$) %{\e[00;00m%}'
	RPS1=$'%{\e[01;33m%}%m %{\e[01;32m%}%~%{\e[00;00m%}'
fi

# terminal titles
if [[ "${TERM}" != "linux" ]] ; then
	precmd() { print -Pn "\e]0;%n@%m $(print -Pn "%40>...>$1")\007" }
	preexec() { print -Pn "\e]0;%n@%m $(print -Pn "%40>...>$1")\007" }
fi

# completion menu
zstyle ':completion:*' menu select=1
zstyle ':completion:*:functions' ignored-patterns '_*'

# group matches
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group 'yes'

# colors on completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# users are all useless, ignore them always
zstyle -e ':completion:*' users "reply=( root '${USERNAME}' )"

# neat-o new features
zstyle ':completion:*' completer _expand _complete _prefix _correct _prefix _match _approximate

# caching good
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${HOME}/.zsh/.${HOST}-cache"

# descriptions
zstyle ':completion:*:messages' format $'\e[01;35m -- %d -- \e[00;00m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found -- \e[00;00m'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d -- \e[00;00m'

# kill/killall menu and general process listing
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' sort false
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=31;31'

zstyle ':completion:*:*:killall:*' menu yes select

case `uname -s` in
	Linux)
		zstyle ':completion:*:processes-names' command 'ps -e --no-headers -o args'
	;;
	FreeBSD|Interix|OpenBSD|SunOS)
		zstyle ':completion:*:processes-names' command 'ps -e -o args | awk "NR != 1"'
	;;
	Darwin)
		if [ "$(sw_vers -productVersion | cut -f2 -d'.')" -ge "4" ] ; then
			zstyle ':completion:*:processes-names' command 'ps -e -o command | awk "NR != 1"'
		else
			zstyle ':completion:*:processes-names' command 'ps -A -o command | awk "NR != 1"'
		fi
	;;
esac

case `uname -s` in
	Linux)
		zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -U '${USERNAME}' -o pid,args | sed "/ps --forest -U '${USERNAME}' -o pid,args/d"'
	;;
	Interix)
		zstyle ':completion:*:*:kill:*:processes' command 'ps -i -U '${USERNAME}' -o pid,args | sed "/ps -i -U '${USERNAME}' -o pid,args/d"'
	;;
	SunOS|FreeBSD|OpenBSD)
		zstyle ':completion:*:*:kill:*:processes' command 'ps -U '${USERNAME}' -o pid,args | sed "/ps -U '${USERNAME}' -o pid,args/d"'
	;;
	Darwin)
		zstyle ':completion:*:*:kill:*:processes' command 'ps -U '${USERNAME}' -o pid,command | sed "/ps -U '${USERNAME}' -o pid,command/d"'
	;;
esac

case `uname -s` in
	Interix|SunOS|FreeBSD|Linux)
		zstyle ':completion:*:*:killall:*:processes-names' command "ps -U '${USERNAME}' -o comm"
	;;
	Darwin)
		if [ "$(sw_vers -productVersion | cut -f2 -d'.')" -ge "4" ] ; then
			zstyle ':completion:*:*:killall:*:processes-names' command "ps -U '${USERNAME}' -o comm"
		else
			zstyle ':completion:*:*:killall:*:processes-names' command "ps -U '${USERNAME}' -o command"
		fi
	;;
	OpenBSD)
		zstyle ':completion:*:*:killall:*:processes-names' command "ps -U '${USERNAME}' -o command"
	;;
esac

# case insensitivity, partial matching, substitution
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-z}' 'm:{a-z}={A-Z}' 'r:|[-._]=* r:|=*' 'l:|=* r:|=*' '+l:|=*'

# compctl should die
zstyle ':completion:*' use-compctl false

# dont suggest the first parameter again
zstyle ':completion:*:ls:*' ignore-line yes
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:scp:*' ignore-line yes
zstyle ':completion:*:diff:*' ignore-line yes

# Keep track of other people accessing the box
watch=( all )
export LOGCHECK=30
export WATCHFMT=$'\e[01;36m'" -- %n@%m has %(a.Logged In.Logged out) --"$'\e[00;00m'

# directory hashes
if [[ -d "${HOME}/sandbox" ]] ; then
	hash -d sandbox="${HOME}/sandbox"
fi

if [[ -d "${HOME}/work" ]] ; then
	hash -d work="${HOME}/work"

	for dir in "${HOME}"/work/*(N-/) ; do
		hash -d $(basename "${dir}")="${dir}"
	done
fi

# extras
if [[ -d "${HOME}/.zsh" ]] ; then
	for file in "${HOME}"/.zsh/*(N.x:t) ; do
		source "${HOME}/.zsh/${file}"
	done
fi
