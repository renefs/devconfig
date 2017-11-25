# Dev Config

## Homebrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Python

    brew install python python3

### Python Virtual env wrapper

    pip install virtualenv && virtualenvwrapper
    mkdir ~/virtualenvs

## Node and nvm

    brew install node && nvm
    mkdir ~/.nvm
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

## Ruby

    brew install rbenv

## iTerm2

    brew cask install iterm2
    
Or, if you do not have homebrew (you should ;)): [Download](http://www.iterm2.com/downloads.html) and install iTerm2 

iTerm2 has better color fidelity than the built in Terminal, so your themes will look better.
    
Get the iTerm color settings

- [Solarized Dark theme](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors) (patched version to fix the bright black value)

Just save it somewhere and open the file(s). The color settings will be imported into iTerm2. Apply them in iTerm through iTerm -> preferences -> profiles -> colors -> load presets. You can create a different profile other than `Default` if you wish to do so.

# Oh My Zsh 

More info here: https://github.com/robbyrussell/oh-my-zsh

## Install with curl
    
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
When the installation is done, edit `~/.zshrc` and set `ZSH_THEME="agnoster"`

## Install a patched font

- [Meslo](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf) (the one in the screenshot). Click "view raw" to download the font.

Open the downloaded font and press "Install Font".

Set this font in iTerm2 (12px is my personal preference) (iTerm -> Preferences -> Profiles -> Text -> Change Font).

Restart iTerm2 for all changes to take effect.

# Further tweaking

Things like

- auto suggestions
- word jumping with arrow keys
- shorter prompt style
- syntax highlighting

can be found in the section below.

## Auto suggestions (for Oh My Zsh)

![Auto suggestions](http://i66.tinypic.com/b5i9dv.png)

Just follow these steps: https://github.com/tarruda/zsh-autosuggestions#oh-my-zsh

If the auto suggestions do not appear to show, it could be a problem with your color scheme. Under "iTerm -> Preferences -> Colors tab", check the value of Black Bright, that is the color your auto suggestions will have. It will be displayed on top of the Background color. If there is not enough contrast between the two, you won't see the suggestions even if they're actually there..

## Enable word jumps

By default, word jumps (option + → or ←) do not work. To enable these, go to "iTerm -> Preferences -> Profiles -> Keys". Press the + sign under the list of key mappings and add the following sequences:

### Option + right

```
⌥→
Send Escape Sequence
f
```

### Option + left

```
⌥←
Send Escape Sequence
b
```

## Custom prompt styles

By default, your prompt will now show “user@hostname” in the prompt. This will make your prompt rather bloated. Optionally set `DEFAULT_USER` in `~/.zshrc` to your regular username (these must match) to hide the “user@hostname” info when you’re logged in as yourself on your local machine. You can get your exact username value by executing `whoami` in the terminal.

## Syntax highlighting

```
brew install zsh-syntax-highlighting
```

After installation through homebrew, add

```
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

to **the end** of your `.zshrc` file. After that, it's best to restart your terminal. Sourcing your `~/.zshrc` does not seem to work well with this plugin.