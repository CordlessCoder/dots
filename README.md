# My BSPWM Config

# Dependencies

<details>
<summary>List of all dependencies(click to expand)</summary>
<pre>fish kitty nerd-fonts-fira-code adobe-source-code-pro-fonts ttf-icomoon-feather otf-raleway ttf-ubuntu-font-family nerd-fonts-fantasque-sans-mono cantarell-fonts oxygen-cursors xdo xdotool wmctrl slop polybar picom-jonaburg-fix glava rofi sxhkd scrot feh dunst conky playerctl xorg-xprop i3lock-color xclip xcolor vim-plug npm go</pre>
</details>

<details>
<summary> Separate Dependencies(For only using part of the config)</summary>

## Required for WM Funcitonality:

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
- picom-jonaburg-fix
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
- vim-plug
- npm
- go

## Conky Requirements

- conky
- otf-raleway
- ttf-ubuntu-font-family

## Visualiser

- GLava[`glava`]

</details>

# Troubleshooting

<details>
<summary>How do I make QT5 apps not look bad?????????????????</summary>

1. Install QT5CT
2. Get weird error
3. Try to find a solution
4. BASH your skull against the table, repeatedly
5. Read this line
6. Create a file `/etc/X11/Xsession.d/100-qt5ct`
7. Put this into it: <pre lang=bash>
   export QT_QPA_PLATFORMTHEME=qt5ct
   export QT_PLATFORMTHEME=qt5ct
   export QT_PLATFORM_PLUGIN=qt5ct
   export QT_AUTO_SCREEN_SCALE_FACTOR=0
   export QT_SCALE_FACTOR=1</pre>
8. Configure QT5CT and Kvantum engine to your superior tastes
9. Log out and back in/reload Xorg in another way(a crash will do)
10. Emerge from this experience, a devout buddhist.(OPTIONAL)

<details>
<summary> What the hell is Kvantum and how what do I do to buy it? </summary>

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
<hr>
</details>
<details>
<summary> How do I make GTK apps not look bad??????????? </summary>

1. Install LXAppearance
2. Customize(using LXAppearance)
3. Enjoy your epic and original Gruvbox theme
</details>

<h1><span style="color:#f7768e">I use arch, btw.</span></h1>
