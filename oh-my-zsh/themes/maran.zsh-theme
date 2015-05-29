# Theme with full path names and hostname
# Handy if you work on different servers all the time;
#PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%M:%{$fg[green]%}%/%{$reset_color%}$(git_prompt_info)%(!.#.$) '
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%M:%{$fg[yellow]%}%~%{$reset_color%}$(git_prompt_info)%(!.#.$) '
#PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%M:%{$fg[yellow]%}%~%{$reset_color%} %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
