function ls --wraps=lsd --wraps='lsd --hyperlink=auto' --description 'alias ls=lsd --hyperlink=auto'
  lsd --hyperlink=auto $argv
        
end
