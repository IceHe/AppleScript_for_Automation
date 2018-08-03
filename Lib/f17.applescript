tell application "System Events"
	set inputsource to do shell script "/Users/IceHe/Documents/Tools/inputsource/inputsource"
	if inputsource = "com.apple.keylayout.US" then
		# f17 : https://eastmanreference.com/complete-list-of-applescript-key-codes
		key code 64
		return true
	else
		return false
	end if
end tell