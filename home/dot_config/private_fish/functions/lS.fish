function lS --wraps='lsd --oneline --classic' --description 'alias lS=lsd --oneline --classic'
    if which lsd >/dev/null 2>&1
        lsd --oneline --classic $argv
    else
        command ls $argv
    end
end
