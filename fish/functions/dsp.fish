function dsp --wraps='docker system prune --all' --description 'alias dsp=docker system prune --all'
  docker system prune --all $argv
        
end
