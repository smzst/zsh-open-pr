# zsh-open-pr

A zsh plugin that automatically opens GitHub Pull Request creation page in your browser after `git push` or `git ps` command.

## Features

- Automatically opens GitHub PR creation page after `git push` or `git ps`
- Supports both SSH and HTTPS GitHub repository URLs
- Works on macOS (using `open` command) and Linux (using `xdg-open` command)
- Provides `ps` alias for `git push`

## Installation

### Using Oh My Zsh

1. Clone this repository into your custom plugins directory:

```bash
git clone https://github.com/smzst/zsh-open-pr ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-open-pr
```

2. Add the plugin to your `.zshrc`:

```bash
plugins=(... zsh-open-pr)
```

3. Restart your terminal or run:

```bash
source ~/.zshrc
```

### Manual Installation

1. Clone this repository:

```bash
git clone https://github.com/smzst/zsh-open-pr
```

2. Add the following to your `.zshrc`:

```bash
source /path/to/zsh-open-pr/zsh-open-pr.plugin.zsh
```

## Usage

Simply use `git push` or `git ps` as you normally would. After a successful push, the plugin will automatically:

1. Extract the current branch name
2. Get the repository URL
3. Open your default browser to the PR creation page
4. Display the PR URL in the terminal

## Requirements

- zsh
- git
- macOS (`open` command) or Linux (`xdg-open` command)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
