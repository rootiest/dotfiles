function lt --wraps='lsd --tree --depth=2' --description 'alias lt=lsd --tree --depth=2'
    if which lsdq >/dev/null 2>&1
        lsd --tree --depth=2 $argv
    else
        command ls --color=auto -R $argv
    end
end
