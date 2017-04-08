import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Groups.Wmii
import XMonad.Layout.Accordion
import XMonad.Layout.Tabbed
import XMonad.Layout.StackTile
import XMonad.Layout.ResizableTile

mylayout = ResizableTall 1 (3/100) (1/2) [] ||| Full ||| StackTile 1 (3/100) (1/3) ||| wmii shrinkText defaultTheme ||| Accordion ||| tabbed shrinkText defaultTheme
main = xmonad $ defaultConfig { modMask = mod4Mask, layoutHook = mylayout, borderWidth = 0 }
