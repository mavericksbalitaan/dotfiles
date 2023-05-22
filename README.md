![](https://images.pexels.com/photos/129208/pexels-photo-129208.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1)

# Steps to bootstrap a new Mac
1. Go to Accessibility > Keyboard Settings and adjusts Key repeat rate to Fast and Delay until repeat to Short.

2. Install [Homebrew](https://brew.sh/), followed by the software listed in the Brewfile.
```
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle

# To create Brewfile
brew bundle dump --describe
```

3. Clone this repo into new hidden directory.
```
# Use SSH (if set up)...
git clone git@github.com:mavericks-db/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/mavericks-db/dotfiles.git ~/.dotfiles
```

5. Create symlinks in the Home directory to the real files in the repo.
```
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Create or copy the folder directory included
ln -s ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua

# plugin
ln -s ~/.dotfiles/.config/nvim/plugin/packer_compiled.lua ~/.config/nvim/plugin/packer_compiled.lua

# lua > core
ln -s ~/.dotfiles/.config/nvim/lua/core/options.lua ~/.config/nvim/lua/core/options.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/keymaps.lua ~/.config/nvim/lua/core/keymaps.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugins.lua ~/.config/nvim/lua/core/plugins.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config.lua ~/.config/nvim/lua/core/plugin_config.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/snippets.lua ~/.config/nvim/lua/core/snippets.lua

# lua > core > plugin_config
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/auto-save.lua ~/.config/nvim/lua/core/plugin_config/autosave.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/colorizer.lua ~/.config/nvim/lua/core/plugin_config/colorizer.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/completions.lua ~/.config/nvim/lua/core/plugin_config/completions.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/gitsigns.lua ~/.config/nvim/lua/core/plugin_config/gitsigns.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/gruvbox.lua ~/.config/nvim/lua/core/plugin_config/gruvbox.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/indent-blankline.lua ~/.config/nvim/lua/core/plugin_config/indent-blankline.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/init.lua ~/.config/nvim/lua/core/plugin_config/init.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/lsp_config.lua ~/.config/nvim/lua/core/plugin_config/lsp_config.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/lualine.lua ~/.config/nvim/lua/core/plugin_config/lualine.lua

# Install prettier and stylua in Mason
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/null-ls.lua ~/.config/nvim/lua/core/plugin_config/null-ls.lua

ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-auto-pairs.lua ~/.config/nvim/lua/core/plugin_config/nvim-auto-pairs.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-comment.lua ~/.config/nvim/lua/core/plugin_config/nvim-comment.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-hardline.lua ~/.config/nvim/lua/core/plugin_config/nvim-hardline.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-surround.lua ~/.config/nvim/lua/core/plugin_config/nvim-surround.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-tree.lua ~/.config/nvim/lua/core/plugin_config/nvim-tree.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-treesitter.lua ~/.config/nvim/lua/core/plugin_config/nvim-treesitter.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/nvim-ts-autotag.lua ~/.config/nvim/lua/core/plugin_config/nvim-ts-autotag.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/rest.lua ~/.config/nvim/lua/core/plugin_config/rest.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/telescope.lua ~/.config/nvim/lua/core/plugin_config/telescope.lua
ln -s ~/.dotfiles/.config/nvim/lua/core/plugin_config/toggleterm.lua ~/.config/nvim/lua/core/plugin_config/toggleterm.lua
```

6. Install [node](https://nodejs.org/en)
```
# List available versions
nvm list
# Install the latest LTS version
nvm install --lts
# Use the latest LTS version
nvm use --lts
# Check installed node version
node --version
```

7. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

8. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
```
# Clone the repository
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/Powerlevel10k

# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
# Type p10k configure
```

9. Install [plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)
```
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
