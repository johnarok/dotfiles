function _update_ps1() 
{
 PS1="$(~/progx/bin/powerline-go -newline -cwd-mode plain -modules cwd,docker,exit,git,perms,root,ssh,venv -error $?)"
}

if [ "$TERM" != "linux" ]; then
  if [ ! -e ~/progx/bin/powerline-go ]; then
    echo "Warning! powerline-go not found in ~/progx/bin/powerline-go" 
  else
   if [ "$TERM" != "xterm-256color" ]; then
    echo "Your terminal is not set to xterm-256color, your experience may not be that great"
   fi
   if [ -n "${PROMPT_COMMAND:-}" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
   else
    PROMPT_COMMAND="_update_ps1; " 
   fi
  fi
fi


