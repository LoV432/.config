# Aliases
source ~/.config/zsh/aliases.sh;

# ls colors
source ~/.config/zsh/lscolors.sh;

bindkey "^[[1;3C" forward-word # alt + ->
bindkey "^[[1;3D" backward-word # alt + <-
bindkey "^[[3~" delete-char # delete key
bindkey "^[[3;3~" kill-word # alt + delete

# make alt shortcuts behave more like normal editors
autoload -U select-word-style
select-word-style bash

# cd to the directory without using the cd command
setopt autocd

# git status
source ~/.config/zsh/plugins/gitstatus/gitstatus.prompt.zsh

# === Prompt ===
NEWLINE=$'\n'
GITSTATUS=$'$GITSTATUS_PROMPT'
NAME=$'%F{#c50f1f}L%f%F{#e74856}o%f%F{#c19c00}V%f%F{#139a0e}4%f%F{#0037da}3%f%F{#881798}2%f'
PROMPT="${NEWLINE}%F{#139a0e}%~%f${NEWLINE}❯ "
RPROMPT="${GITSTATUS}"
# === /Prompt ===

# fast-zsh-highlighting
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# zsh-history-substring-search (Up and Down key searches the text you have written in shell)
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# zsh-autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# === FZF ===
source <(fzf --zsh)

# add tab completion for fzf
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
autoload -Uz compinit
compinit
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# add git shortcuts
source ~/.config/zsh/plugins/fzf-git/fzf-git.sh
# === /FZF ===

# === NVM ===
nvm_lazy_load() {
  unset -f node nvm npx npm
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

nvm() {
    nvm_lazy_load
    nvm $@
}
node() {
    nvm_lazy_load
    node $@
}
npm() {
    nvm_lazy_load
    npm $@
}
npx() {
    nvm_lazy_load
    npx $@
}
# === /NVM ===


if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
