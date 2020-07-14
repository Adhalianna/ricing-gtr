Helper
======

Shortcuts
---------

### Global shortcuts

#### Provided in Xfce keyboard settings

- **Super+A**: show albert launcher
- **Super+Enter**: open terminal
- **Super+F1**: open browser
- **Super+F2**: open file manager
- **Super+P**: show display settings (useful for projecting presentations)
- **WWW**: open browser
- **Mail**: open default mail reader
- **Display**: show diplay settings

#### Provided in ~/.config/sxhkd/sxhkdrc

### Window Manager

- **Super+Shift+Q**: close window
- **Alt+F4**: close window
- **Super+F**: toggle fullscreen
- **Alt+Tab**: cycle through windows
- **Shift+Alt+Tab**: cycle windows in reverse order
- **Super+Shift+S**: make window sticky
- **Super+Ctrl+Right**: move to next workspace/desktop
- **Super+Ctrl+Left**: move to previous workspace/desktop

#### Bspwm only

- **Super+Shift+K**: kill window
- **Super+Shift+X**: lock a window from closing
- **Super+T**: toggle tiling mode of window (tiled or pseudo_tiled)
- **Super+Ctrl+T**: force all windows of the desktop to tile
- **Super+Ctrl+Shift+T**: force all windows to float
- **Super+Shift+W**: create a "master area" splittinng whole desktop

#### Xfwm4 only

- **Alt+Space**: window operations menu


### Useful applications shortcuts

#### Thunar
- **Ctrl+H**: show/hide dotfiles (hidden files)

FAQ and possible issues
-----------------------

#### Which configs I can touch relatively safely?
Most of commonly done configuration can be performed with gui settings available at xfce4-settings so most likely you will not need to look into any text files. If you know what you are doing, however, you might be interested in:
- a section of bspwmrc file that contains rules for specific windows
- a section of bspwmrc that that contains settings for workspaces in monitors (in case you plug in extra monitor)
- a section of bspwmrc that defines sizes of gaps and border thickness
- *~/.config/alacritty/alacritty.yml* lines defining font

#### I cannot make any use of extra monitors with bspwm
It might that your graphic card uses different naming for its outputs. Type *xrandr -q | awk  '/D./ { print $1 }'* in terminal to find out the names and adapt the naming convention in proper place of *~/.config/bspwm/bspwmrc* script. 

Tips & tricks
-------------

#### Avoid enabling 'files' extension in albert
It has been known to cause memory leaks and in general causes performance dropdown.

### When performance drops try...
- Disabling composition (if on bspwm try shortcut for toggling composition by picom)
- Checking systray (called notification area in xfce4-panel) and disabling every app that is not needed

### Terminal commands

Glossary
--------

- **sxhkd** - a program that is run in background (at autostart) to listen and respond globally for shortcuts.
- **bspwm** - a tiling window manager with configs under ~/.config/bspwm/bspwmrc and available commands descriptions at *man bspwm*
	- **monocle mode** -
	- **pseudo_tiled mode** -
	- **private window** -
- **xfwm4** - a default window manager of xfce4 desktop. Its settings are under *Settings > Window Manager* and *Settings > Window Manager Tweaks*
- **markdown** - simple text formatting syntax that is used commonly in programming projects (i.e. github's README.md) because of its readability in source code and quick writting

