Helper
======

Shortcuts
---------

Given below list is not exhaustive. It focuses on shortcuts that are most likely to be applied.

### Global shortcuts 

#### Launchers

- **Super+A**: show/hide Albert launcher
- **Super+S**: open/close Whiskermenu
- **Super+Enter**: open terminal
- **Super+F1**: open browser
- **Super+F2**: open file manager
- **Super+F3**: open mail reader
- **Super+F11**: open this 'Helper' file
- **Super+F12**: open sxhkd config file (where keybinding are defined)
- **Super+P**: open display settings (useful while projecting presentations)
- **Print**: open xfce4-screenshooter
- **Print+Ctrl**: make a screenshot of entire screen and copy it to clipboard

#### Window Manager

##### Single window controls

- **Super+Q**: close window
- **Alt+F4**: close window
- **Super+F**: toggle fullscreen
- **Super+T**: toggle tiling mode of window (tiled or pseudo_tiled)
- **Super+Shift+K**: kill window
- **Super+Shift+X**: lock a window from closing (in particular accidental closing or closing by another shortcut)

##### Workspace navigation

- **Super+{1-9}**: go to desktop 1-9
- **Super+Ctrl+Right**: go to next occupied workspace
- **Super+Ctrl+Left**: go to previous occupied workspace
- **Super+N**: go to next workspace
- **Super+M**: go to previous workspace

##### Window navigation

- **Alt+Tab**: cycle through windows
- **Shift+Alt+Tab**: cycle windows in reverse order
- **Super+arrowkeys**: move focus with arrows

##### Moving windows

- **Super+Shift+{1-9}**: move window to workspace 1-9
- **Super+Shift+arrowkeys**: move window in given direction

##### Layout controls

- **Super+comma**: flip layout over horizontal axis
- **Super+period**: flip layout over vertical axis
- **Super+Shift+comma**: rotate layout
- **Super+Shift+period**: rotate layout in reverse direcction
- **Super+B**: "balance" layout, give all windows equal area
- **Super+Shift+B**: undo layout balancing

##### Workspacewise manipulations

- **Super+Ctrl+W**: force all windows of the desktop to float
- **Super+Ctrl+Shift+W**: force all windows to tile

### Useful applications shortcuts

#### Thunar

- **Ctrl+H**: show/hide dotfiles (hidden files)
- **Ctrl+B**: show/hide sidepane

#### Firefox

- **Ctrl+L** / **Alt+D** / **F6**: focus address bar
- **Ctrl+K** / **Ctrl+J**: focus address bar to start searching with search engine
- **Ctrl+F**: find on page
- **/**: quick find
- **Ctrl+[** / **Alt+leftarrow**: back
- **Ctrl+]** / **Alt+rightarrow**: forward
- **Ctrl+W** / **Ctrl+F4**: close tab
- **Ctrl+Shift+T**: undo close tab
- **Ctrl+T**: open new tab
- **Ctrl+Tab**: cycle through tabs
- **Ctrl+M**: mute/unmute tab
- **Ctrl+D**: bookmark page
- **Tab**: focus next link/input
- **Shift+Tab**: focus previous link/input
- **Ctrl+H**: open history sidebar
- **Ctrl+B**: open bookmarks sidebar

#### Alacritty

- **Ctrl+Shift+C**: copy selection
- **Ctrl+Shift+V**: paste selection

FAQ and possible issues
-----------------------

#### Which textual configs I can touch relatively safely?
Most of commonly done configuration can be performed with gui settings available at xfce4-settings so most likely you will not need to look into any text files. If you know what you are doing, however, you might be interested in:
- a section of bspwmrc file that contains rules for specific windows (`bspc rule --add ...`)
- a section of bspwmrc that defines sizes of gaps and border thickness
- *~/.config/alacritty/alacritty-common.yml* lines defining font

#### I cannot make any use of extra monitors with bspwm
It might that your graphic card uses different naming for its outputs. Type `xrandr -q | awk  '/D./ { print $1 }'` in terminal to find out the names and adapt the naming convention in proper place of *~/.config/bspwm/bspwmrc* script. 

#### A terrible window/screen tearing occurs, how to stop it?
It might be that picom has some issues. Disable it with a shortcut (by default Super+Ctrl+Space). Try enabling it and see if restarting is enough. If not, *picom.conf* requires some work. Settings need to be adjusted for your particular hardware! 

#### Help! Panel in bspwm session is always below other windows, I cannot see it!
Using a task manager check if a process named `xdotool search --onlyvisible --class xfce4-panel behave %@ mouse-enter windowraise` is running. If not start it using it simply as a terminal command. It should be autostarted by *bspwmrc* file. Verify it is there. The command is a kind of workaround so you will not find anything useful on that on web, most likely.

#### Why a list of songs in ncmpcpp is empty?
Mopidy must be running somewhere in the background for ncmpcpp to work. Check if there is already an instance of mopidy process running (use task manager) and press **2** in ncmpcpp to open playlists window.

#### I suddenly cannot open the terminal (Alacritty)!
If you have just run some system updates it is possible that one of those was a driver update. If so, you need to reboot to use Alacritty as it uses gpu to increase its speed. Meanwhile, you can use different terminal emulator.

#### I run into error downloading a package from AUR that says sth about pgp...
PGP is a key used to sign packages and verified before and during installing by pacman. You can find more information about that on [Archwiki](https://wiki.archlinux.org/index.php/Pacman/Package_signing#Managing_the_keyring). There is a list of keys used by the package manager by default (packages *archlinux-keyring*, *manjaro-keyring*) but it might happen that a certain package uses a key that needs to be added manually. An example of command run in such case is: `gpg --keyserver hkp://keys.gnupg.net --receive-keys 702353E0F7E48EDB`. If an error *keyserver receive failed: No data* appears try a different keyserver. A list of valid keyservers can be found on the internet. The key-id supplemented after *--receive-key* should be found somewhere in the log of failed package build. Once the key is succesfully found and added try downloading the package again.

#### How do I open youtube songs in my mopidy client (eg. ncmpcpp)?
To add a youtube track to your playlist or listen to a youtube playlist you can use an URL. Input that URL prefixed with `yt:` to search with the client, e.g. `yt:https://www.youtube.com/watch?v=POFeKd9TTbQ` as a filename. Searching mopidy's database might not return anything from youtube module as browsing it easily leads to timeout.

#### How do I change the alarm played in mopidy/ncmpcpp?
Setting of the alarm is managed by a crontab which ensures that alarm defaults are loaded daily (at 4am). You can access `http://localhost:6680/alarmclock/` to override that behaviour (mopidy must be running) and set your own alarm playlist, time and volume. You can also change the defaults in mopidy config located in `~/.config/mopidy/mopidy.conf` (look for *alarmclock* section). The crontab command is located under `~/.config/mopidy/alarmclock-automate/command` but visiting the directory is not recommended unless things don't work in any expected way.

#### How can I use synchronization of google's calendar with orage?
There are 3-6 (less on weekends) synchronization tasks run daily by cron which will make orage keep you notified about coming events but if that is not enough you can manually run additional synchronization with `vdirsyncer sync` or panel widget. You can use orage to add new elements to your google calendar but remeber to select the gcalendar from list and not the orage's default calendar. 
If you are curious about how you could benefit from using orage's calendar more see [this section](#### Make the most of your system-based orage calendar)

#### What is Dijo and how do I use it?
To make the most out of Dijo it is best to know some shell sccripting and use it to automate and connect some processes with Dijo. There is no man page for Dijo, instead it has good wiki on it's github page [here](https://github.com/NerdyPepper/dijo/wiki/Getting-Started).

#### I'm bored with Vimix theme, how can I change it?
To change a theme all you need to do is download new one with pamac and open Settings > Appearance. However, only custom vimix themes work with theme changing button on the panel and the theme changing script. The same applies to icon theme and some app themes such as alacritty and zathura.

#### How can I disable shortcuts cheatsheet on the desktop if I no longer need it? 
Find bspwmrc file and comment line starting with 'conky'. It won't open on next login.



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

#### Extend your mopidy's possibilites!
You can find some extra modules for mopidy in AUR. Each is well documented and its configuration options can be found on the website provided in the package details. 
*In fact you already have one module that requires configuration to work. Go to `~/.config/mopidy/mopidy.conf` and find section named 'scrobbler' (last.fm player). Provide your username and password to have the extra module working. If you don't want to ever use scrobbler it is recommended to remove package 'mopidy-scrobbler'.*
Provided some networking knowledge and some small device serving as a server host it is possible to turn mopidy into a bigger service. With further automated alarmclock module (see: [here](#### How do I change the alarm played in mopidy/ncmpcpp?)) something similar to a smart home module could be achieved. It is merely an idea...

#### Make the most of your system-based orage calendar
First of all, when you add events with orage you can choose a shell command to be executed on the time of the event (this could be used to make a more userfriendly version of cron for yourself) and that gives limitless possibilites: sending mails, playing music, turning on-off any app on your system, performing actions on the web, (`man lynx` or search for inspiration [here](https://blog.unixy.net/2009/06/script-to-automate-browsing-actions-using-lynx/)), etc.
Secondly, orage uses iCalendar format which is kind of dumb and easy to manage. It's easy to write scripts that automate addition of events or to find existing scripts that parse the format. *Vdirsyncer* is responsible for parsing icalendar to CalDAV.


Glossary
--------

- **pacman** - the default package manager for all Arch-based distros. 
- **pamac** - a variant of pacman created for Manjaro. Allows access to Manjaro Official Repositories.
- **sxhkd** - a program that is run in background (at autostart) to globally listen and respond to key binding.
- **bspwm** - a tiling window manager with configs at *~/.config/bspwm/bspwmrc* and available commands descriptions at `man bspwm`.
	- **monocle mode** - a mode in which only one window is opened and visible on the screen, similar to fullscreen but does not send a signal to the opened app that fullscreen mode was turned on
	- **pseudo_tiled mode** - in this mode the maximum size of the window is defined by the tile it resides in but, unlike the tiled mode, the size of the window itself can be changed and it does not have to fill the whole tile area.
	- **private window** - a window that tries to mantain its position on the screen, workspaces and its size.
- **xfwm4** - a default window manager of xfce4 desktop. Its settings are under *Settings > Window Manager* and *Settings > Window Manager Tweaks*
- **conky** - a system monitor that can output to a window with many options of customization and possibility of scripting in lua.
- **markdown** - simple text formatting syntax that is used commonly in programming projects (i.e. github's README.md) because of its readability in source code and quick writting
- **ncmpcpp** - an mpd client
- **mopidy** - an mpd server

