#environment variables
export PATH=$PATH:/home/wasted/.local/bin/
export PATH=$PATH:/home/wasted/.cargo/bin/
export TERM=alacritty
export EDITOR=nvim

#clipmenu
export CM_LAUNCHER=rofi
export CM_MAX_CLIPS=20
export CM_DIR=/tmp




 if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
   exec startx
 fi
