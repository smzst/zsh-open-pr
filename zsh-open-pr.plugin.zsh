# Function to insert text into command line
function _insert_command() {
    LBUFFER="$1"
    zle redisplay
}

# Create widget to insert text into command line
zle -N _insert_command_widget _insert_command

# Variables to store the last command output
typeset -g _last_git_output=""
typeset -g _last_pr_url=""

# Function to detect GitHub pull request URL
function _detect_pr_url() {
    local output="$1"
    # Detect both new PR creation URL and existing PR URL
    local pr_url=$(echo "$output" | grep -o 'https://github.com/[^/]*/[^/]*/pull/\(new/[^ ]*\|[0-9]*\)' | head -n 1)
    if [[ -n "$pr_url" ]]; then
        _last_pr_url="$pr_url"
    fi
}

# Hook for git push and git ps commands
function _git_push_hook() {
    # Execute command and save output
    _last_git_output=$(command git "$@" 2>&1)
    _detect_pr_url "$_last_git_output"
    echo "$_last_git_output"
}

# Override git push and git ps commands
function git() {
    if [[ "$1" == "push" ]] || [[ "$1" == "ps" ]]; then
        _git_push_hook "$@"
    else
        command git "$@"
    fi
}

# Function executed before prompt display
function _precmd_hook() {
    if [[ -n "$_last_pr_url" ]]; then
        # Display open command in command line
        print -z "open $_last_pr_url"
        # Clear the variable
        _last_pr_url=""
    fi
}

# Add precmd hook
autoload -Uz add-zsh-hook
add-zsh-hook precmd _precmd_hook
