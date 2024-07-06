function ls --wraps=lsd --wraps='lsd --hyperlink=auto' --description 'alias ls=lsd'
    if which lsd >/dev/null 2>&1
        lsd --hyperlink=auto $argv
    else
        command ls --color=auto $argv
    end
end
