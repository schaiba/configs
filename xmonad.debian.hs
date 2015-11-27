import XMonad

import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders

-- mylayoutHook = Full ||| noBorders (tabbed shrinkText defaultTheme) ||| Accordion

main = xmonad $ defaultConfig { layoutHook = noBorders $  layoutHook defaultConfig
					, modMask = mod4Mask }

