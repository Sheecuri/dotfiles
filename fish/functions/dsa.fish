function dsa --wraps='docker stop $(docker ps -aq)' --description 'alias dsa=docker stop $(docker ps -aq)'
  docker stop $(docker ps -aq) $argv
        
end
