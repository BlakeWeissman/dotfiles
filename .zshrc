PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/blake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Include hidden files in autocomplete
_comp_options+=(globdots)		

# Automatically cd into typed directory.
setopt autocd		

# Allow arrow controls for completion
zstyle ':completion:*' menu select

# Apply current pywal theme to new terminals and ttys
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Aliases
alias dotfiles='/usr/bin/git --git-dir=/home/blake/.dotfiles/ --work-tree=/home/blake'
alias lf='
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
'
alias df='dotfiles'
alias vim='nvim'
alias alttabrice='alttab -d 2 -pk Left -nk Right -bg $(awk 'NR==1' ~/.cache/wal/colors) -fg $(awk 'NR==8' ~/.cache/wal/colors) -frame $(awk 'NR==3' ~/.cache/wal/colors)'

bg() {
  wal -n -i "$@"
  xwallpaper --zoom "$(< "${HOME}/.cache/wal/wal")"
  killall -q alttab
  alttabrice &
}

bgl() {
  wal -n -i "$@" -l
  xwallpaper --zoom "$(< "${HOME}/.cache/wal/wal")"
  killall -q alttab
  alttabrice &
}

lastbg() {
  wal -R -n
  xwallpaper --zoom "$(< "${HOME}/.cache/wal/wal")"
}

source ~/.bin/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.bin/zsh/zsh-system-clipboard/zsh-system-clipboard.zsh

. ~/zshpath
