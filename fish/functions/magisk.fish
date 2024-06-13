function magisk --wraps='' --description 'Switch Theme'
  mv /home/lov432/.config/fish/functions/fish_prompt.fish.bak /home/lov432/.config/fish/functions/tmp;
  mv /home/lov432/.config/fish/functions/fish_prompt.fish /home/lov432/.config/fish/functions/fish_prompt.fish.bak;
  mv /home/lov432/.config/fish/functions/tmp /home/lov432/.config/fish/functions/fish_prompt.fish; 
  clear; 
  exec fish;
end
