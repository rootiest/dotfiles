function ffetch --wraps='fastfetch' --wraps='fastfetch --config ~/.fastfetch.jsonc' --description 'alias ffetch=fastfetch --config ~/.fastfetch.jsonc'
    if which fastfetch >/dev/null 2>&1
        if ls ~/.fastfetch.jsonc >/dev/null 2>&1
            fastfetch --config ~/.fastfetch.jsonc $argv
        else
            fastfetch $argv
        end
    else
        if which neofetch >/dev/null 2>&1
            command neofetch $argv
        else
            echo "fetch not found"
        end
    end
end
