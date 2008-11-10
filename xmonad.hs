import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import System.IO

main = do
	xmproc <- spawnPipe "xmobar"
	xmonad $ defaultConfig {
		manageHook = manageDocks <+> manageHook defaultConfig,
		layoutHook = avoidStruts  $  layoutHook defaultConfig,
		logHook    = dynamicLogWithPP $ xmobarPP {
					ppOutput = hPutStrLn xmproc,
					ppTitle = xmobarColor "green" ""
					}
		}
