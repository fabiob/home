eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"

  # adds pip-installed executables to the PATH
  export PATH=${HOMEBREW_PREFIX}/opt/python/libexec/bin:$PATH

  # loads autocompletion scripts
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi
