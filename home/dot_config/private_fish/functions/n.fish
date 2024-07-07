function n --wraps=edit --wraps=nvim --description 'alias n=nvim'
    if which nvim >/dev/null 2>&1
        nvim $argv
    else
        if which vim >/dev/null 2>&1
            vim $argv
        else
            if which nano >/dev/null 2>&1
                nano $argv
            else
                if which edit >/dev/null 2>&1
                    edit $argv
                else
                    echo "editor not found"
                end
            end
        end
    end
end
