# === General ===
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ls="eza --icons=always --color=auto"
alias lsl="eza --icons=always --smart-group -lahg --color=auto"
alias lsa="eza --no-time --icons=always -a --color=auto"
alias cat="bat --paging=never -p"
alias space="du -sh"
alias sudo="sudo " # This fixes "sudo <alias>" not working
alias die="tmux detach -P" # Disconnects SSH when inside tmux
alias vim="nvim"
alias svim="sudoedit"
# === /General ===

# === Package Manager ===
alias pu="sudo pacman -Syu"
alias pi="sudo pacman -S"
alias pr="sudo pacman -Rsu"
function fpi() {
	pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi -q "$1" --preview "pacman -Si {1}" | xargs -ro sudo pacman -S
}
function fpr(){
	pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi -q "$1" --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns
}
# === /Package Manager ===

# === Docker ===
alias d="docker"
alias dcd="docker compose down"
alias dcu="docker compose up -d"
alias dcr="docker compose restart"
alias dpsa="docker ps -a"
alias dps="docker ps"
alias dca="docker compose attach"
alias dcsp="docker compose stop"
alias dcst="docker compose start"
alias dcl="docker compose logs -f"
alias dcp="docker compose pull"
function de() {
    if [ -z "$2" ]; then
        docker exec -it $1 /bin/bash
    else
        docker exec -it $1 $2
    fi
}
function dce() {
    if [ -z "$2" ]; then
        docker compose exec -it $1 /bin/bash
    else
        docker compose exec -it $1 $2
    fi
}
alias lzd="lazydocker"
# === /Docker ===

# === 7z ===
function 7za() {
  if [ -z "$1" ] || [ -z "$2" ]; then
      echo "Missing Params, 7za <folder/file> <output.7z>"
  else
      7z a $2 $1
  fi
}
function 7zx() {
  if [ -z "$1" ]; then
      echo "Missing Params, 7zx <input.7z> <path_to_output>"
  elif [ -z "$2" ]; then
      7z x $1
  else
      7z x $1 -o$2
  fi
}
# === /7z ===
