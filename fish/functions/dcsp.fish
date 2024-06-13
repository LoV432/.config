function dcsp --wraps='docker compose stop' --description 'alias dcsp=docker compose stop'
  docker compose stop $argv
        
end
