function v --wraps=code --wraps='code --goto' --description 'alias v=code --goto'
    if which code >/dev/null 2>&1
        code --goto $argv
    else
        if which code-oss >/dev/null 2>&1
            code-oss --goto $argv
        else
            if which nvim >/dev/null 2>&1
                command nvim $argv
            else
                command vim $argv
            end
        end
    end
end
