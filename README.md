# zsh-open-pr

A zsh plugin that suggests the `open` command to open GitHub Pull Request creation page after `git push` or `git ps` command.

## Features

- Suggests the `open` command to open GitHub PR creation page after `git push` or `git ps`
- Supports both new PR creation URLs and existing PR URLs
- Works on macOS (using `open` command)
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

Simply use `git push` or `git ps` as you normally would. After a successful push, the plugin will:

1. Detect the GitHub Pull Request URL from the command output
2. Suggest the `open` command in your next command line
3. You can press Enter to execute the suggested command or modify it as needed

Example:
```bash
$ git push -u origin HEAD
# After successful push, the next command line will show:
$ open https://github.com/username/repo/pull/new/branch-name
```

## Requirements

- zsh
- git
- macOS (`open` command)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
