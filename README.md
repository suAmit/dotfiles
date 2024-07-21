# dotfiles

This dotfiles have created use bare git repository following [blog](https://www.atlassian.com/git/tutorials/dotfiles)

## Termux

- Package upgrade
- Package update
- Install
  - `proot-distro`
  - `git`

```
yes | pkg upgrade ; yes | pkg update ; yes | pkg install proot-distro git ; termux-setup-storage
```

<details>
 
<summary>Termux phantom killer</summary>
In android phantom process killer kill the termux which lead to server and background process to step
[Guide](https://youtu.be/vK1Jx9ydi5c)  to solve problem

</details>

## Termux Style

- Remove default Keyboard
- Add font
- Add color scheme

```
rm -rf ~/.termux ; git clone https://github.com/PapersFromTree/TermuxSetup ~/.termux
```

<details>
 
<summary>View proot-distro files from termux home dir</summary>

Creates a symlink of installed rootfs on your home dir and make it easily accessable

```
ln -rs $PREFIX/var/lib/proot-distro/installed-rootfs $HOME/proot-distro-rootfs
```

</details>

## Alpine setup

_Why alpine Linux ?
Alpine Linux was lightweight, secure, and efficient nature, making it ideal for environments with limited resources. Additionally, its package manager, apk, is straightforward and efficient._

### Quick Start

Install Alpine linux

```
proot-distro install alpine
```

Login Alpine

```
proot-distro login alpine
```

Upgrade and Update Alpine

```
apk upgrade && apk update
```

Install packages

- `sudo`
- `neovim`
- `git`
- `nodejs`
- `clang`
- `zsh`
  And package upgrade

```
apk add neovim sudo git nodejs npm clang zsh; apk upgrade && apk update
```

**One Block Copy/Paste**

```
proot-distro install alpine ; proot-distro login alpine -- bash -c 'apk upgrade && apk update ; apk add neovim sudo github-cli git nodejs npm clang ; apk upgrade && apk update'
```

### Add user

Stark is username `you can replace 'Stark' with any username`

Login to Alpine

```
proot-distro login alpine
```

Set root user password

```
passwd
```

And user

```
adduser stark
```

Add user user to sudoers. Edit `/etc/sudoers`, add following lines beneath"root ALL=(ALL:ALL) ALL":

```
nano /etc/sudoers
```

```
stark ALL=(ALL:ALL) ALL
```

Switch to user

```
su stark
cd

```

Check current user

```
whoami
```

Direct Login as user

```
proot-distro login --user stark alpine
```

Access Phone storage from Proot-distro

```
ln -s /data/data/com.termux/files/home/storage
```

## Setup Neovim

Install neovim

```
apk add neovim
```

Use dotfile provided nvim config or use

- [NvChad](https://nvchad.com) lightweight and fast
- [LazyVim](https://www.lazyvim.org) Full IDE Setup

## Change default shell

Set zsh as default shell

- Install zsh

```
apk add zsh
```

- Edit /etc/passwd

```
nvim /etc/passwd
```

- Change user default shell to zsh

## Github Login

### Login With ssh

To generate ssh key

STEP-1: Install git

```
apk add git
```

STEP-2: Generate SSH Key

Just press for all question

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

STEP-3: Copy SSH Key

```
cat .ssh/id_rs.pub
```

STEP-4: Add SSH to Github SSH key add section

open Github link

https://github.com/settings/keys

Click on New SSH key buttom

Paste SSH in textbox

And Github login process complete

### Change default shell

[Guide](https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell)
