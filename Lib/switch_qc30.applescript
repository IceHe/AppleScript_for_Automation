activate application "SystemUIServer"

tell application "System Events"
	# test click menu bar item of some app
	(*
	tell process "Script Editor"
		tell menu bar 1
			tell menu bar item "View"
				click
			end tell
		end tell
	end tell
	return
	*)
	
	tell process "SystemUIServer"
		-- Working CONNECT Script.  Goes through the following:
		-- Clicks on Volume Menu (OSX Top Menu Bar)
		--    => Clicks on 'icehe-qc30' Item
		set volumeMenu to (menu bar item 1 of menu bar 1 whose description contains "volume")
		
		tell volumeMenu
			click
			if exists menu item "ice-qc30" of menu 1 then
				click menu item "ice-qc30" of menu 1
				# return "Connecting..."
				display alert "Switch-ING" giving up after 2
			else
				-- Close main BT drop down if Connect wasn't present
				#click bluetoothMenu 
				-- `click bluetoothMenu` doesn't work now. So I use `key code 53`(⎋ escape)
				key code 53
				-- return "Connect menu was not found, are you already connected?"
				display alert "NOT EXIST" giving up after 2
			end if
		end tell
	end tell
end tell