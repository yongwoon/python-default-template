# Setup pyenv

```bash
brew install pyenv
```

Add the following code to your `~/.zshrc` file to automatically apply it every time you open a terminal.

```bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```
