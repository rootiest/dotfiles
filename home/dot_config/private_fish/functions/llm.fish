function llm --wraps='lsd --timesort --long' --description 'alias llm=lsd --timesort --long'
    if which lsd >/dev/null 2>&1
        lsd --timesort --long $argv
    else
        command ls color=auto -l $argv
    end
end
