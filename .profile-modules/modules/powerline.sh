function _update_ps1() {
    PS1="$(
      /home/linuxbrew/.linuxbrew/bin/powerline-go \
          -error $? -jobs $(jobs -p | wc -l) \
          -modules user,host,kube,aws,venv,ssh,cwd,perms,git,jobs,exit \
          -static-prompt-indicator -newline
    )"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

if [ "$TERM" != "linux" ] && [ -f "/home/linuxbrew/.linuxbrew/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
