# Dotfiles

> My dotfiles for various environments - Utilising [nichtj3/dotsy]() for dotfile management

Nowadays this is pretty much a giant bin that houses my neovim config that I use on my mac and some mediocre zsh things


## Disclaimer

All files in this repo are configured specifically for me. This means you probably don't want to just clone and use these dotfiles yourself but rather use them as inspo. If you do however, there's probably somethings e.g. `.gitconfig` etc,,, that you'll want to change to include your own information

## Screenshots

<img width="1904" alt="Screenshot 2024-11-27 at 9 04 17 PM" src="https://github.com/user-attachments/assets/f9680b35-400c-45d2-86cb-6048dfefbca2">

## Running

```sh
git clone https://github.com/NICHTJ3/Dotfiles ~/Dotfiles
cd ~/Dotfiles

dotsy --help
# dotsy profile list > To list available profiles
# dotsy profile install work-mac > To install the work-mac profile
```

## Other resources

Most dependencies etc (that you'd normally brew install, git clone etc, are handled for you by `dotsy`, you may need a `.dotsyrc` file setup with your dependency manager to make this work though. Outside of that setup guides for other things can be found over in the [Wiki](https://github.com/nichtj3/dotfiles/wiki)
