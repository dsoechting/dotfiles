# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias vim="nvim"
alias lg="lazygit"
alias cat="bat"
alias zshrc="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias conf="cd ~/.config; nvim ."
alias dotfiles="cd ~/dotfiles; nvim ."

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Completion init
autoload -U compinit; compinit

# Shell integrations
eval "$(fzf --zsh)"

# Wezterm path
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH


# Plugins
source ~/repos/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
# source ~/repos/zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/repos/zsh-plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/repos/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/repos/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
