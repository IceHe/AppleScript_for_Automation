tell application "System Events"
	set inputsource to do shell script "/Users/IceHe/Documents/Tools/inputsource/inputsource"
	
	# com.apple.keylayout.US
	# com.sogou.inputmethod.sogou.pinyin

	if inputsource = "com.sogou.inputmethod.sogou.pinyin" then
		return false
	else
		# https://eastmanreference.com/complete-list-of-applescript-key-codes
		key code 49 using {control down}
		#keystroke space using {control down}
		return true
	end if
	
end tell