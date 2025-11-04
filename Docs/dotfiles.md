# Dotfiles

Configuration files for Vim, Zsh, Tmux, and terminal productivity tools.

---

## Vim Setup

### Navigation Between Vim and Tmux

Install [`vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator.git):

```bash
git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/pack/plugins/start/vim-tmux-navigator
```

---

## Zsh Setup

### Prerequisites

Make sure you have **Zsh** and **Oh My Zsh** installed:

```bash
sudo apt install zsh git -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install **Powerlevel10k** theme:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

---

### Plugins

Install the following plugins to enhance Zsh:

| Plugin                      | Description                          | Install Command                                                                                                          |
| :-------------------------- | :----------------------------------- | :----------------------------------------------------------------------------------------------------------------------- |
| **git**                     | Built-in Git aliases and completions | _(included with Oh My Zsh)_                                                                                              |
| **forgit**                  | Interactive Git operations using fzf | `git clone https://github.com/wfxr/forgit.git ~/.oh-my-zsh/custom/plugins/forgit`                                        |
| **zsh-autosuggestions**     | Command suggestions as you type      | `git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`         |
| **zsh-autocomplete**        | Smarter completions                  | `git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete`           |
| **zsh-syntax-highlighting** | Syntax highlighting for commands     | `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting` |
| **zoxide**                  | Smarter cd replacement               | `sudo apt install zoxide`                                                                                                |
| **fzf**                     | Fuzzy finder for command-line        | `sudo apt install fzf`                                                                                                   |
| **fd**                      | Faster alternative to find           | `sudo apt install fd-find`                                                                                               |

---

## Tmux Setup

### Plugin Manager

Install the **Tmux Plugin Manager (TPM)**:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After saving your configuration, start a new tmux session and press:

```
prefix + I
```

This installs all listed plugins.

---

## Managing Dotfiles with Git

Keep your dotfiles under version control:

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

Then you can manage files easily:

```bash
config add ~/.zshrc
config add ~/.tmux.conf
config commit -m "Add shell and tmux configuration"
config push
```
