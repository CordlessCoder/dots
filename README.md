# me dotfiles

### These dotfiles include:

<img align="right" src="https://raw.githubusercontent.com/CordlessCoder/dots/0d8757f3b8f0633c11978ec3596409c89a88237e/screenshot.png">

- A constantly declining mental state.[please god help me]
- experimental and objectively overengineered configs.[like 5k SLoC,]
- tons of questionable choices
- conky[]
- the work of my entire life[very close to the end]
- g a p[10 px]
- colors with pywal integration for EVERYTHING
- [music integration](https://www.youtube.com/watch?v=OHK2zh7Bu54)

# Installation(no guide here)

First of all, make sure that you have a fresh, functional frontal cortex on-hand. Save as much as you can and steal from your family, if you want to. A compter may also be required, but starting with the frontal cortex is always a great idea. In case you're reading this and do not have a frontal cortex, get help, slowly.

1. Run `git clone https://github.com/CordlessCoder/dots` in a directory you do not value.
2. `cd dots` to acquire the great understanding of the lore of Kingdom Hearts.
3. Copy of the files from `.config` into `~/.config/`... Who could have seen this coming???????
4. Copy all the files from `_HOME` into `~/`
5. Read all of the keybinds, and the entirety of the Bible, you'll need that knowledge.
6. Log into BSPWM, using your preferred method. (If you ever dare to use startx/xinit, I will find **and** follow you _on twitter_)
7. Discard the frontal cortex in a safe manner immediately, as to minimize the chance of developing the frightening realization that I am indeed in your walls.
8. Enjoy your newfound interest in using your computer, the 1950s way.

## Keybinds

This configuration comes with a long list of those, some of which are shown in the conky widget as a reminder. Here are ALL of them for some reason(you need to expand the list to see them, that's how secretive I am)

<details><summary>Keybinds are probably here. Pipe bomb is attached</summary>

| Keybind                     | Function                                                           |
| :-------------------------- | ------------------------------------------------------------------ |
| Alt+Ctrl+T                  | Open terminal emulator(kitty)                                      |
| Meta+Enter                  | Alternative to ^                                                   |
| Alt+Space                   | Application launcher(rofi)                                         |
| Meta+C                      | Open NeoVide(the best NeoVim GUI)                                  |
| Meta+Shift+C                | Open Firefox(developer edition)                                    |
| Meta+Ctrl+C                 | Open VSCode                                                        |
| Meta+E                      | Open File Manager(thunar)                                          |
| Ctrl+Shift+Q                | Close the focused **window**                                       |
| Meta+Ctrl+Shift+Q           | ^ but with all windows of the app                                  |
| PrintScreen                 | Selection Screenshot(saved to **/tmp**)                            |
| Meta+PrntScr                | ^ but saved to ~/Screenshots                                       |
| Meta+N                      | Color picker(picked color is saved into the clipboard)             |
| Meta+Space                  | Switch languages(configruable in ~/.config/sxhkd/change_layout.py) |
| Alt+Tab                     | Somewhat Windows-like workspace local **window** switching         |
| Meta+Tab                    | ^ but with workspaces                                              |
| Meta+R                      | Rotates windows 90 degrees around the parent window                |
| Meta+Y                      | Send the focused node to the (newest) preselection                 |
| Meta+**T**                  | Set the node state to **tiled**                                    |
| Meta+**Shift+T**            | ^ but to **pseudo_tiled**                                          |
| Meta+**S**                  | ^ but to **floating(stacked)**                                     |
| Meta+**F**                  | ^ but to **fullscreen**                                            |
| Meta+Ctrl+M                 | Set the focused node's flags to **marked**                         |
| Meta+Ctrl+X                 | ^ but to **locked**                                                |
| Meta+Ctrl+Y                 | ^ but to **sticky**                                                |
| Meta+Ctrl+Z                 | ^ but to **private**                                               |
| Meta+[HJKL]                 | Focus the node in the given direction(vim-like)                    |
| Meta+**Shift**+[HJKL]       | Send(move) the node in the given direction(vim-like)               |
| Meta+P                      | Focus the **parent** of the currently selected node                |
| Meta+B                      | ^ same but the **brother**                                         |
| Meta+`,`[**comma**]         | Focus the node for the path jump of **second**                     |
| Meta+`.`[**period**]        | ^ same but to the **first**                                        |
| Meta+`[`[**left bracket**]  | focus the **next** workspace of the current monitor                |
| Meta+`]`[**right bracket**] | ^ but the **previous**                                             |
| Meta+**O**                  | Focus the **older** node in the node history                       |
| Meta+**I**                  | ^ but the **newer**                                                |
| Meta+[1-9,0]                | Focus the given workspace                                          |
| Meta+**Shift**+[1-9,0]      | Send the focused window to the given workspace                     |
| Meta+Ctrl+[HJKL]            | Preselect in the given direction(vim-like)                         |
| Meta+Ctrl+[1-9]             | Preselect the ratio                                                |
| Meta+Ctrl+Space             | Cancel the preselection for the focused **node**                   |
| Meta+Ctrl+**Shift**+Space   | Cancel the preselection for the focused **desktop**                |
| Meta+Alt+[HJKL]             | **Expand** a window by moving one of it's sides **outward**        |
| Meta+Alt+**Shift**+[HJKL]   | **Contract** a window by moving one of it's sides **inward**       |
| Meta+[Left,Down,Up,Right]   | Move a floating window in a given direction                        |
| Meta+M                      | Alternate between tiled and monacle layouts                        |
| Meta+G                      | Draw resize(send window to drawn rectangle)                        |
| Meta+Alt+Plus/Equal         | Increase border size by 2                                          |
| Meta+Alt+Minus              | Decrease border size by 2                                          |
| Ctrl+Meta+Alt+L             | Lock the screen(with i3lock-color)                                 |
| Meta+Escape                 | Reloads sxhkd config                                               |
| Meta+Alt+R                  | Reload BSPWM                                                       |
| Meta+Alt+Q                  | Quit BSPWM                                                         |

</details>

# Dependencies

<details><summary>List of all dependencies(click to expand)</summary>
<pre>fish kitty nerd-fonts-fira-code adobe-source-code-pro-fonts ttf-icomoon-feather otf-raleway ttf-ubuntu-font-family nerd-fonts-fantasque-sans-mono cantarell-fonts oxygen-cursors ant-dracula-kvantum-theme-git xdo xdotool bspwm wmctrl slop polybar pywal glava python-colorthief python-colour rofi sxhkd scrot feh dunst conky playerctl xorg-xprop i3lock-color xclip xcolor npm glow python-black python-neovim flake8 luacheck shfmt shellcheck prettier deno stylua rustfmt</pre>
</details>

<details><summary> Separate Dependencies(For only using part of the config)</summary>

## Required for WM Funcitonality:

- bspwm(duh)
- fish
- kitty
- nerd-fonts-fira-code
- adobe-source-code-pro-fonts
- ttf-icomoon-feather
- nerd-fonts-fantasque-sans-mono
- cantarell-fonts
- oxygen-cursors
- xdo
- xdotool
- wmctrl
- slop
- polybar
- picom-jonaburg-fix(stability, performance and buttery smooth animations)
- rofi
- sxhkd
- scrot
- feh
- dunst
- playerctl
- xorg-xprop
- i3lock-color
- xclip
- xcolor

**Easy to copy list:** <pre>fish kitty nerd-fonts-fira-code adobe-source-code-pro-fonts ttf-icomoon-feather nerd-fonts-fantasque-sans-mono cantarell-fonts oxygen-cursors xdo xdotool wmctrl slop polybar picom-jonaburg-fix rofi sxhkd scrot feh dunst playerctl xorg-xprop i3lock-color xclip xcolor</pre>

## NeoVim Requirements

- neovim
- npm
- glow
#### Warning, formatters for null-ls below
- python-black
- python-neovim
- flake8
- luacheck
- shfmt
- shellcheck
- prettier
- deno
- styleua
- rustfmt
- emmet-ls (npm package), <pre lang=bash>npm install -g emmet-ls</pre>

## Conky Requirements

- conky
- nerd-fonts-fira-code

## Visualiser

- GLava[`glava`]
- python-colorthief

</details>

# Troubleshooting

### Why is there no visualiser????? YOU PROMISED A VISUALISER, alternatively > Why is the bottom half of the desktop black?

That is most likely because **GLava**, the visualiser isn't set to use the correct geometry. To fix that, find the `setgeometry` setting in `~/.config/glava/rc.glsl` and set it to be correct for your monitor setup(Ex. `#request setgeometry 0 580 1920 500` for 1080x1920).

<details><summary>How do I make QT5 apps not look bad?????????????????</summary>

1. Install QT5CT
2. Get weird error
3. Try to find a solution
4. BASH your skull against the table, repeatedly
5. Read this line
6. Create/Open `~/.profile`
7. Put this into it: <pre lang=bash>
   export QT_QPA_PLATFORMTHEME=qt5ct
   export QT_PLATFORMTHEME=qt5ct
   export QT_PLATFORM_PLUGIN=qt5ct
   export QT_AUTO_SCREEN_SCALE_FACTOR=0
   export QT_SCALE_FACTOR=1</pre>
8. Configure QT5CT and Kvantum engine to your superior tastes
9. Log out and back in/reload Xorg in another way(a crash will do)
10. Emerge from this experience, a devout buddhist.(OPTIONAL)

### What the hell is Kvantum and do I have to pay for it?

- Install `Kvantum`
- Download a QT5 theme from either KDE store or the AUR
- Cry because you can't unzip it
- Install the entire KDE app suite while trying to unzip it
- Realize you can just use `unrar x *path*`
- You did not forget to substitute \*path\* with the correct path because you're a smart Arch boi
- Launch Kvantum and select QT5 theme you just extracted, then spend 20 minutes looking at built-in themes because you're indecisive
- Finally set the theme in Kvantum
- Feel immense pride for the sheer dissapointment your parents have just endured

</details>
<details><summary> How do I make GTK apps not look bad??????????? </summary>

1. Install LXAppearance
2. Customize(using LXAppearance)
3. Enjoy your epic and original Gruvbox theme
</details>

Huge thanks to [@a1fishie](https://github.com/a1fishie)

If you have an issue with configuration, installation or are suffering from severe depression, feel free to use the Issue function on GitHub.

# Wallpapers

You can get any of my custom wallpapers from my [Wallpapers repo](https://github.com/CordlessCoder/Wallpapers)

<details><summary>A preview of the wallpapers themselves(click to expand)</summary>

|                                                                                      stylized                                                                                      |                                                                               plain                                                                               |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|     <img width="1604" alt="Arch stripes, corrupted" src="https://raw.githubusercontent.com/CordlessCoder/Wallpapers/main/Arch_stripes_corrupted.png"> Arch stripes, corrupted      |             <img width="1604" alt="Arch stripes" src="https://raw.githubusercontent.com/CordlessCoder/Wallpapers/main/Arch_stripes.png"> Arch stripes             |
| <img width="1604" alt="Nord geometric, stylized" src="https://raw.githubusercontent.com/CordlessCoder/Wallpapers/main/Nord_Geometric_1920x1080-8bit.png"> Nord geometric, stylized |          <img width="1604" alt="TokyoNight, cubes." src="https://github.com/CordlessCoder/Wallpapers/raw/main/TokyoNight_Cubes.png"> TokyoNight, cubes.           |
|             <img width="1604" alt='The "do as I say" meme' src="https://github.com/CordlessCoder/Wallpapers/raw/main/doasIsay_white_final.png"> The "do as I say" meme             | <img width="1604" alt="Arch_minimal_4000x4000.png" src="https://github.com/CordlessCoder/Wallpapers/raw/main/Arch_minimal_4000x4000.png"> Arch, minimal 4000x4000 |

</details>

<h1><span style="color:#f7768e">I use arch, btw.</span></h1>
I don't have lungs. At least that I know of.
