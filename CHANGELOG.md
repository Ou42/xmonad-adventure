# CHANGELOG

## TO-DO

- [ ] update how xmobar is setup in xmonad.org per tut
    - <https://xmonad.org/TUTORIAL.html>
- [ ] power-manager icon in trayer
- [ ] multiple screen setups
    - [ ] laptop only
    - [x] ext only
        - via `$ xrandr --output <laptop screen> --off`
    - [x] both
        - starts up with both screens on
        - can control via `xrandr`
- [ ] greedy-view vs view
- [ ] setup & test Wi-Fi
    - [x] `nm-applet` in `trayer`
- [ ] switch to geekosaur's xmessage override?
- [ ] are gfx drivers running? FireFox sometimes lags/tears when scrolling

## 2023-03-31

### xmobar & trayer up on ext monitor (WIP)

- explicitly sending both `xmobar` & `trayer` to 2nd screen
    - not yet tested: what happens when only using laptop screen?
- set fg/bg colors in `.Xresources` file
    - now have a "dark theme" for xmessage
- set font for `xmessage` in `.Xresources` file
    - this is ignored by xmonad!
    - xmonad hard codes font & font-size. BUMMER!
    - my main use case is: `M-S-/` for xmonad cheatsheet
- `lxappearance`, theme selector, works for some dialogs/apps
    - requires manually calling it from terminal.
    - Launches GUI to pick theme
    - works for `nemo` & `caja` file managers
    - only affects text input box of `hexchat`
- wallpaper set at start using `feh`
- network manager, `nm-applet` loaded at start
    - and picked up by `trayer`
- power management loaded at start
    - using, `xfce4-power-manager`, per tut
    - doesn't show in `trayer`
- volume control - `alsa`
    - only displays volume setting at 100%
    - currently, volume cannot be changed from xmobar

## 2023-04-01

### tweaks

- changed `xmobar` font-size & height
    - font-size from 24 to 18
    - height from 42 to 38
- can turn off laptop screen
    - via `$ xrandr --output <laptop screen> --off`
