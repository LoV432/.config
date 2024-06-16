#!/bin/zsh
command -v git >/dev/null 2>&1 || {
  echo "git is not installed. Please install git and try again." >&2
  exit 1
}
if [ ! -f $(dirname "$0")/.zshenv ]; then
  echo "Failed to find .zshenv file."
  exit 1
fi
if [ ! -f ~/.zshenv ]; then
  ln -s $(dirname "$0")/.zshenv ~/.zshenv
fi

if [ ! -d ~/.config/zsh/plugins/fast-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
else
  echo "fast-syntax-highlighting already installed"
fi
if [ ! -d ~/.config/zsh/plugins/fzf-git ]; then
  git clone https://github.com/junegunn/fzf-git.sh.git ~/.config/zsh/plugins/fzf-git
else
  echo "fzf already installed"
fi
if [ ! -d ~/.config/zsh/plugins/fzf-tab ]; then
  git clone https://github.com/Aloxaf/fzf-tab.git ~/.config/zsh/plugins/fzf-tab
else
  echo "fzf-tab already installed"
fi
if [ ! -d ~/.config/zsh/plugins/fast-syntax-highlighting ]; then
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.config/zsh/plugins/fast-syntax-highlighting
else
  echo "fast-syntax-highlighting already installed"
fi
if [ ! -d ~/.config/zsh/plugins/gitstatus ]; then
  git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/.config/zsh/plugins/gitstatus
else
  echo "gitstatus already installed"
fi