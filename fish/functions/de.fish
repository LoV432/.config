function de --wraps='docker exec -it $argv bash' --description 'alias de=docker exec -it $containerName $containerCommand=bash'
  set -l containerCommand
  if set -q argv[2]
    set containerCommand $argv[2]
  else
    set containerCommand 'bash'
  end
  docker exec -it $argv[1] $containerCommand
end
