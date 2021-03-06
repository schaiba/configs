import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Groups.Wmii
import XMonad.Layout.Accordion
import XMonad.Layout.Tabbed
import XMonad.Layout.StackTile
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.IndependentScreens
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops (ewmh)
-- import System.Taffybar.Hooks.PagerHints (pagerHints)


conf = defaultConfig {
        workspaces= myWorkspaces,
        modMask = mod4Mask,
        focusFollowsMouse = False,
        terminal = "st",
        layoutHook = mylayout,
         manageHook = mymanagehook,
         focusedBorderColor = "#6D0404",
         normalBorderColor = "#81F79F",
         borderWidth = 1 }
 `additionalKeys` myKeys

mymanagehook = composeAll [
    isFullscreen --> doFullFloat,
    className =? "VLC" --> doFloat,
    manageHook defaultConfig
    ]

myKeys =
         [
         -- workspaces are distinct by screen
         ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
               | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
               , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)
               ]

         ]
         ++
         [
           ((mod4Mask, xK_j ), windows W.focusUp) -- %! Move focus to the next window
         , ((mod4Mask, xK_k ), windows W.focusDown ) -- %! Move focus to the previous window
               ]
--         ++
--         [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
--                 | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
--                 , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
        ++
        [
--            ((mod4Mask, xK_Down), nextWS)
--          , ((mod4Mask, xK_Up), prevWS)
--          , ((mod4Mask, xK_Right), nextScreen)
            ((mod4Mask, xK_Right), nextScreen)
          , ((mod4Mask, xK_Left), prevScreen)
          , ((mod4Mask, xK_Tab), toggleWS)
          ]


myWorkspaces = withScreens 2 ["gen","wrk","med","dev","net","var","7","of","9"]
-- myWorkspaces = ["gen","wrk","med","dev","net","var","7","of","9"]



mylayout = ResizableTall 1 (3/100) (1/2) [] ||| noBorders Full ||| StackTile 1 (3/100) (1/3) ||| wmii shrinkText defaultTheme ||| Accordion ||| tabbed shrinkText defaultTheme
main = xmonad=<<xmobar conf
