function l --wraps='lsd --almost-all --long' --description 'alias l=lsd --almost-all --long'
    if which lsd >/dev/null 2>&1
        lsd --almost-all --long $argv
    else
        command ls --color=auto --almost-all -l $argv
    end
end
