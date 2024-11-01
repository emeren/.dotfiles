# zmodload zsh/zprof
DISABLE_UNTRACKED_FILES_DIRTY=true
DISABLE_AUTO_UPDATE="true"

zstyle ':omz:update' mode reminder
session_name="sheesh"
export JAVA_HOME="/usr/libexec/java_home -v 17.0.13"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="/Users/emeren/.local/bin:$PATH"
export PATH="$HOME/.local/scripts/:/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/3.1.0/bin:$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin"
export PATH="/usr/local/sbin:$PATH"

export ZSH="/Users/emeren/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

ZSH_THEME="af-magic"
ZSH_PYENV_QUIET=true

# vi-mode
 plugins=(zsh-autosuggestions zsh-syntax-highlighting)

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

VI_MODE_SET_CURSOR=true
VI_MODE_CURSOR_NORMAL=2
VI_MODE_CURSOR_VISUAL=6
VI_MODE_CURSOR_INSERT=6
VI_MODE_CURSOR_OPPEND=0

source $ZSH/oh-my-zsh.sh

bindkey '§' autosuggest-accept
bindkey -s ^f "tmux-sessionizer\n"

source ~/.aliases

# pnpm
export PNPM_HOME="/Users/emeren/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

