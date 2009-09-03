import XMonad
import qualified XMonad.StackSet as W

import XMonad.Layout.Grid
import XMonad.Layout.NoBorders(smartBorders)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Scratchpad

import XMonad.Prompt
import XMonad.Prompt.Shell(shellPrompt)
import XMonad.Prompt.Window

import System.IO(hPutStrLn)

myLayoutHook = tiled ||| Mirror tiled ||| Grid ||| Full
	where
		-- default tiling algorithm partitions the screen into two panes
		tiled   = Tall nmaster delta ratio

		-- The default number of windows in the master pane
		nmaster = 1

		-- Default proportion of screen occupied by master pane
		ratio   = 1/2

		-- Percent of screen to increment by when resizing panes
		delta   = 3/100

main = do
	xmproc <- spawnPipe "xmobar"
	xmonad $ defaultConfig
			{ manageHook = manageDocks <+> manageHook defaultConfig <+> scratchpadManageHook (W.RationalRect 0.25 0.25 0.5 0.5)
			, layoutHook = avoidStruts  $  smartBorders $ myLayoutHook
			, logHook    = dynamicLogWithPP $ xmobarPP
				{ ppOutput = hPutStrLn xmproc
				, ppTitle  = xmobarColor "#8AE234" ""
				}
			}
			`additionalKeysP`
			[ ("M-p", shellPrompt defaultXPConfig { position = Top })
			, ("M-S-a", windowPromptGoto defaultXPConfig { position = Top })
			, ("M-a", windowPromptBring defaultXPConfig { position = Top })
			, ("M-x", sendMessage ToggleStruts)
			, ("M-S-l", spawn "~/bin/lock")
			, ("M-g", scratchpadSpawnAction defaultConfig)
			]
