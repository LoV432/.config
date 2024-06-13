function doc --wraps='sudo docker compose' --description 'alias doc=sudo docker compose'
  docker compose $argv; 
end
