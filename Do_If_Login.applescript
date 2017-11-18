on run argv
	
	set uptime to do shell script "uptime | awk -F ',' '{print $1}' | awk '{print $3}' | awk -F ':' '{hrs=$1; min=$2; print hrs*60 + min}'"
	
	if (uptime as integer) < 5 then
		delay 10
	else
		return 1
	end if
	
	set wifi_name to do shell script "networksetup -getairportnetwork en0 | awk -F ': ' '{print $2}'"
	
	if wifi_name = "Sina Plaza Mobile" then return do shell script "networksetup -setairportnetwork en0 'Sina Plaza Office' urtheone"
	
	tell application "Keyboard Maestro" to quit
	tell application "Karabiner-Elements" to quit
	
end run