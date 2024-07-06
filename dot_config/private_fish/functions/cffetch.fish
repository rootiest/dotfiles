function cffetch --wraps='clear;fastfetch --config ~/.fastfetch.jsonc' --description 'alias cffetch=clear;fastfetch --config ~/.fastfetch.jsonc'
    clear
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
