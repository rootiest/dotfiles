function ffetch --wraps='fastfetch --disable-linewrap true --cpu-temp true --gpu-temp true --battery-temp true --command-shell fish' --wraps='fastfetch --config ~/.fastfetch.jsonc' --description 'alias ffetch=fastfetch --config ~/.fastfetch.jsonc'
  fastfetch --config ~/.fastfetch.jsonc $argv
        
end
