# === General ===
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ls="eza --color=auto"
alias lsa="eza -lah --color=auto"
alias cat="bat"
# === /General ===

# === Package Manager ===
alias pu="sudo pacman -Syyu"
alias pi="sudo pacman -S"
alias pr="sudo pacman -Rsu"
function fpi() {
	pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi -q "$1" --preview "pacman -Si $1" | xargs -ro sudo pacman -S
}
function fpr(){
	pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi -q "$1" --preview "pacman -Qi $1" | xargs -ro sudo pacman -Rns
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
alias lzd="lazydocker"
# === /Docker ===
