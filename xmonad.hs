import XMonad

-- EWMH compliance
import XMonad.Hooks.EwmhDesktops

-- for XMobar & trayer(?)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.Themes
import XMonad.Util.Ungrab

-- cannot bind to the same name as a func!
-- tabbed = tabbed shrinkText (theme darkTheme) -- BAD!

-- "dark theme" with xmessage, used for error msgs
--   & M-S-/ is set in ~/.Xresources
-- ( but upon reboot, only the fg color was set )
-- ( had to reissue: `xrdb` cmd see file r info )

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
           ||| simpleTabs ||| darkTabs
  where
    simpleTabs = tabbed shrinkText def {fontName = "xft:Mono-16"}
    darkTabs   = tabbed shrinkText (theme darkTheme)
    threeCol   = ThreeColMid nmaster delta ratio
    tiled      = Tall nmaster delta ratio
    nmaster    = 1
    ratio      = 1/2
    delta      = 3/100

-- Compiler can't infer the type as it's not being used!
-- it needs that "connection" to infer the types!
-- myTabsLayout01 = tabbed shrinkText (theme smallClean)

main :: IO ()
-- main = xmonad $ def
main = do
  -- Launching multiple instances of xmobar on their respective monitors.
  -- This didn't work ... might try again / find alt method
  -- also, is a spawnOnce more efficient than spawnPipe?!
  -- xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.xmobarrc"
  -- xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.xmobarrc"
  -- xmonad $ ewmhFullscreen $ ewmh $ myConfig
  xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ myConfig

myConfig = def
  { startupHook = myStartupHook
  , borderWidth = 3
  , layoutHook  = myLayout
  , modMask     = mod4Mask -- Rebind Mod to the Super key
  , terminal    = "xfce4-terminal"
  }

myStartupHook = do
  spawnOnce "xrdb merge ~/.Xresources &"

  spawnOnce "picom &" -- or -- spawnOnce "compton &"
  -- spawnOnce "picom -c --shadow-red 1 --shadow-green 0 --shadow-blue 1 &"
  -- spawnOnce "picom -cf &"

    spawnOnce $  "trayer --edge top"        -- or try: "--edge bottom"
                  ++ " --align right"
                  ++ " --SetDockType true"
                  ++ " --SetPartialStrut true"
                  ++ " --expand true"
                  ++ " --width 10"          -- NEEDED or ELSE!!
                  ++ " --transparent true"
                  ++ " --tint 0x5f0000"
                  ++ " --monitor 1"         -- ext monitor ?!
                  ++ " --height 42 &"

  spawnOnce "feh --bg-fill --no-fehbg ~/.wallpapers/comet.jpg"

  spawnOnce "xfce4-power-manager &"       -- Power Management

  spawnOnce "nm-applet --sm-disable &"    -- Network Manager
