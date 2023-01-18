export XDG_CONFIG_HOME=$HOME/.config
export BW_SESSION="CTR9MM8Q68mt6s0rMGKszSmuh2WgWr"
export TERMINAL=kitty
export VISUAL=nvim
export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMCMD=kitty

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# Created by `pipx` on 2022-03-20 20:57:44
export PATH="$PATH:/home/corey/.local/bin"
