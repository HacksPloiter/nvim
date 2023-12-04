# AutoNeo
AutoNeo - A simple yet powerful automated installer of Neovim plugins and themes!

# Introduction

Welcome to my repository AutoNeo. Thanks for visiting. I assume you are in need of a minimalistic and automated configuration of Neovim. This repository contains automated installation and uses configurations of some of the most popular plugins and themes. Plus point is that I have written all of the configurations in Lua language.

Please understand that this repository is for solely personal use and not maintained. I'll be committing changes as per my need, so it is likely that some things might not work in future. But as of now (2 Dec 2023), it is stable.

With that said, you are the in charge of this repo🫡. Happy Neoviming🚀!

## Installation [MacOS]
I'm assuming you already have installed Neovim. If no please install it with homebrew (preferred).
IMPORTANT - Please make sure you don't have any folder with name "nvim" inside ```~/.config/```. If so please move it to some different location. Please make sure you haven't any "nvim" folder inside ```~/.local/share/``` as well.

To remove nvim files/directories completely, below commands can be used:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```
Now, use below command using git to clone the repo into your config directory and install.

```bash
cd ~/.config/
git clone <url> #get it from "Code" button on this page.
cd nvim
nvim init.lua
:Lazy sync

```

## Usage
Use below command to initialise installation.

```
cd ~/.config/nvim/
nvim init.lua
:Lazy install
:Lazy update
:Lazy sync
```

Voila! It's done. Most of the plugins and themes, unless they require loading configuration, are already active. Feel free to use the plugin/theme commands.

After everything is installed. Go to the "lua" directory inside nvim and look at the configured plugins/themes.

Feel free to use any of the plugin/theme command. If you are unaware of the all of the commands please get it from the official repositories readme files.

## Contributing

Since this repository is not maintained, please create a fork of it and feel free to modify/update the code.

## NOTE

This is the initial release of this work and for solely personal use. I understand that I have not mentioned all of the details in this readme. Links to official repos of the plugins and themes can be googled. The name of the plugins and themes can be found out in the ```nvmpackerconfig.lua``` file.

## License

[MIT License](https://github.com/HacksPloiter/nvim/blob/hacksploiter/publicrepo/autoneo_ed12d55/v1work/LICENSE)
