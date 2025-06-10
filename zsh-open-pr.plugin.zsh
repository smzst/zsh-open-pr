# --- utilities ---------------------------------------------------------------
# Extract repository name from git remote URL
function _opr_extract_repo() {
  local url=$1
  case "$url" in
    git@github.com:*)   echo "${url#git@github.com:}" | sed 's/\.git$//' ;;
    https://github.com/*) echo "${url#https://github.com/}" | sed 's/\.git$//' ;;
    *) return 1 ;;
  esac
}

# --- hook functions ----------------------------------------------------------
# Store the last executed command
function _opr_preexec() {
  _OPR_LAST_CMD=("${(z)1}")   # Split into array
  _OPR_PIDS=$!
}

# Called after command execution (before prompt display)
function _opr_precmd() {
  # Check if the last command was successful
  if [[ $? -ne 0 ]]; then return; fi

  # Check if the last command was `git push` or `git ps`
  if [[ ${_OPR_LAST_CMD[1]} == "git" && (${_OPR_LAST_CMD[2]} == "push" || ${_OPR_LAST_CMD[2]} == "ps") ]]; then
    local branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || return
    local remote_url=$(git config --get remote.origin.url) || return
    local repo=$(_opr_extract_repo "$remote_url") || return
    local pr_url="https://github.com/${repo}/pull/new/${branch}"

    # Open browser
    if command -v open >/dev/null; then
      (open "$pr_url" &>| /dev/null &)
    elif command -v xdg-open >/dev/null; then
      (xdg-open "$pr_url" &>| /dev/null &)
    fi
    echo "[open-pr] 🚀  $pr_url"
  fi
}

# --- activate hooks ----------------------------------------------------------
autoload -Uz add-zsh-hook
add-zsh-hook preexec _opr_preexec
add-zsh-hook precmd  _opr_precmd

# --- aliases ----------------------------------------------------------------
alias ps='git push' 