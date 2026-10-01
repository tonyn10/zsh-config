# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# Bind ALT+L to accept autosuggestion
bindkey '^[l' autosuggest-accept

# Lines configured by zsh-newuser-install
bindkey -e
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Essential aliases (shortcuts for common commands)
alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -lA --color=auto'
alias ls='ls --color=auto' # Enable colors for ls output

alias grep='grep --color=auto' # Enable colors for grep output

alias mv='mv -i' # Prompt before overwriting# Neovim

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Ctrl+Left / Ctrl+Right word navigation
bindkey "^[[1;5C" forward-word   # Ctrl+Right
bindkey "^[[1;5D" backward-word  # Ctrl+Left

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward


# For autojump
. /usr/share/autojump/autojump.zsh

eval "$(fzf --zsh)"

export SYSTEM_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tony/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH="$HOME/.local/bin:$PATH"
