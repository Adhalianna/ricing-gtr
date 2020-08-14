Helper
======

Shortcuts
---------

### Global shortcuts

- **Super+A**: show/hide Albert launcher
- **Super+S**: open/close Whiskermenu
- **Super+Enter**: open terminal
- **Super+F1**: open browser
- **Super+F2**: open file manager
- **Super+F12**: open sxhkd config file (where keybinding are defined)
- **Super+P**: show display settings (useful while projecting presentations)

### Window Manager

- **Super+Shift+Q**: close window
- **Alt+F4**: close window
- **Super+F**: toggle fullscreen
- **Alt+Tab**: cycle through windows
- **Shift+Alt+Tab**: cycle windows in reverse order
- **Super+Shift+S**: make window sticky
- **Super+Ctrl+Right**: go to next workspace/desktop
- **Super+Ctrl+Left**: go to previous workspace/desktop

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

#### Which textual configs I can touch relatively safely?
Most of commonly done configuration can be performed with gui settings available at xfce4-settings so most likely you will not need to look into any text files. If you know what you are doing, however, you might be interested in:
- a section of bspwmrc file that contains rules for specific windows (`bspc rule --add ...`)
- a section of bspwmrc that defines sizes of gaps and border thickness
- *~/.config/alacritty/alacritty.yml* lines defining font and colors

#### I cannot make any use of extra monitors with bspwm
It might that your graphic card uses different naming for its outputs. Type `xrandr -q | awk  '/D./ { print $1 }'` in terminal to find out the names and adapt the naming convention in proper place of *~/.config/bspwm/bspwmrc* script. 

#### A terrible window/screen tearing occurs, how to stop it?
It might be that picom has some issues. Disable it with a shortcut (by default Super+Ctrl+Space). Try enabling it and see if restarting is enough. If not, *picom.conf* requires some work. Settings need to be adjusted for your particular hardware! 

#### Help! Panel in bspwm session is always below other windows, I cannot see it!
Using a task manager check if a process named `xdotool search --onlyvisible --class xfce4-panel behave %@ mouse-enter windowraise` is running. If not start it using it simply as a terminal command. It should be autostarted by *bspwmrc* file. Verify it is there. The command is a kind of workaround so you will not find anything useful on that on web, most likely.

#### Why I cannot preview conkies when I am using conky manager?
You have to restart session (log out) to see changes applied. That is so because a workaround using xdotool is applied to conkies to work as expected in bspwm session. You can use the same workaround manually, just type in terminal `xdotool search --class conky windowraise %@`, but the conkies will be raised above any windows in your session so you will have to close them or move them to different workspace in order to make conky stay below any windows.

#### Why I cannot see any conkies ("desktop decorations")?
Something could have happened to its autostart. A script created by conky-manager (*~/.conky/conky-startup.sh*) should be in session autostart. Enabling it in conky-manager gui should be sufficient. It should be also marked as an executable file (thunar > right click > properties > permissions). If this occurs in bspwm session only, try to alter sleep time which happens just before command `xdotool search --class conky windowraise %@` in *bspwmrc* script.

#### Why I cannot see a specific conky under bspwm session?
For a conky to work in the bspwm session it must have following set up:
- *own_window_type* to *desktop*
- *own_window_class* to *conky*
This is caused by workaround that brings conkies in front of desktop (they are kind of sitting below wallpaper otherwise)

#### Why a list of songs in ncmpcpp is empty?
Mopidy must be running somewhere in the background for ncmpcpp to work. If there is already an instance of mopidy process running (use task manager) but ncmpcpp is still empty you will need to check used ports in config files of both ncmpcpp and mopidy: *~/.config/ncmpcpp/config* and *~/.config/mopidy/mopidy.conf*. A port used by ncmpcpp must be the same as the one used by mopidy for **mpd** service, preffered: 6600.

#### I suddenly cannot open the terminal (Alacritty)!
If you have just run some system updates it is possible that one of those was a driver update. If so, you need to reboot to use Alacritty as it uses gpu to increase its speed. Meanwhile, use different terminal emulator.

#### I run into error downloading a package from AUR that says sth about pgp...
PGP is a key used to sign packages and verified before and during installing by pacman. You can find more information about that on [Archwiki](https://wiki.archlinux.org/index.php/Pacman/Package_signing#Managing_the_keyring). There is a list of keys used by the package manager by default (packages *archlinux-keyring*, *manjaro-keyring*) but it might happen that a certain package uses a key that needs to be added manually. An example of command run in such case is: `gpg --keyserver hkp://keys.gnupg.net --receive-keys 702353E0F7E48EDB`. If an error *keyserver receive failed: No data* appears try a different keyserver. A list of valid keyservers can be found on the internet. The key-id supplemented after *--receive-key* should be found somewhere in the log of failed package build. Once the key is succesfully found and added try downloading the package again.

Tips & tricks
-------------

#### Avoid enabling 'files' extension in albert
It has been known to cause memory leaks and in general causes performance dropdown but feel free to verify that.

#### When performance drops try...
- Disabling window composing (if on bspwm try shortcut for toggling composition by picom)
	- If you don't want to disable compositing completly, you can boost performance changing config file of picom. A good start would be disabling the blur effect. Find a line with *blur-method* and change *double_kawase* into *none*.
- Killing *desknamer* process
- Checking systray (called notification area in xfce4-panel) and switching off every app that is not needed at the moment

#### Do not restart the computer whenever an issue occurs
Often it is enough to log out from the session and start it fresh. It is also a much quicker solution.

#### If you quite often run out of RAM quicker than you run out of processing power...
Try to install (activate) zswap to your kernel: [info on Archwiki](https://wiki.archlinux.org/index.php/Zswap). But first learn a bit more about the issue. 

#### If you accidentially close windows too often...
For bspwm get yourself bspwm-undo (can be found in AUR) and add a keybinding in sxhkd.

#### When there are two packages for the same software in a repository...
The packages can differ by the suffix used (or not used), e.g. *git*, *bin*, or by the repository in which they are located (AUR, Manjaro Official). Always choose first packages from Manjaro Official Repositories. When choosing between one with git suffix and no suffix, check the software version and the date of last update of the package (go to details of the package in pamac) 

Glossary
--------

- **pacman** - the default package manager for all Arch-based distros. 
- **pamac** - a variant of pacman created for Manjaro. Allows access to Manjaro Official Repositories.
- **sxhkd** - a program that is run in background (at autostart) to globally listen and respond to key binding.
- **bspwm** - a tiling window manager with configs at *~/.config/bspwm/bspwmrc* and available commands descriptions at `man bspwm`.
	- **monocle mode** - a mode in which only one window is opened and visible on the screen, similar to fullscreen but does not fill the entire screen.
	- **pseudo_tiled mode** - in this mode the maximum size of the window is defined by the tile it resides in but, unlike the tiled mode, the size of the window itself can be changed and it does not have to fill the whole tile area.
	- **private window** - a window that tries to mantain its position on the screen and size.
- **xfwm4** - a default window manager of xfce4 desktop. Its settings are under *Settings > Window Manager* and *Settings > Window Manager Tweaks*
- **conky** - 
- **markdown** - simple text formatting syntax that is used commonly in programming projects (i.e. github's README.md) because of its readability in source code and quick writting

