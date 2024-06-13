function dcp --wraps='docker compose pull' --description 'alias dcp=docker compose pull'
  docker compose pull $argv
        
end
