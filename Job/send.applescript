on run argv
	
	if script = class of argv then
		set today to (current date)
	else
		set today to (item 1 of argv)
	end if
	
	
	
	set today to today - (((weekday of today) as integer) + 2) mod 7 * days
	
	set day_dd to day of today
	if day_dd < 10 and day_dd > 0 then
		set day_dd to ("0" & day_dd)
	end if
	
	set month_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {today}
	set year_yyyy to year of today
	set year_yy to (year_yyyy mod 100)
	
	set base_dir to "/Users/IceHe/Documents/MapiReports/"
	set report_name_tail to " 何志远周报.md"
	set cur_thursday_str to (year_yyyy & "-" & month_mm & "-" & day_dd) as string
	set report_name to cur_thursday_str & report_name_tail
	set report_path to base_dir & report_name
	
	if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/file_exists.applescript") with parameters {report_path}) then
		display alert "Report Not Found! Auto Create Now!" giving up after 10
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Job_Report/edit.applescript") with parameters {today}
		return false
	end if
	
	
	
	set email_app to "Mail"
	
	if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_running.applescript") with parameters {email_app}) then
		tell application email_app to launch
		delay 1
	end if
	
	tell application "Finder"
		set the clipboard to (report_path as POSIX file)
	end tell
	
	tell application "Mail"
		mailto "mailto:hubo3@staff.weibo.com,haoming@staff.weibo.com?subject=【MAPI周报】何志远 " & year_yyyy & "-" & month_mm & "-" & day_dd
	end tell
	
	delay 0.2
	
	
	
	tell application "System Events" to tell process email_app
		
		activate
		set frontmost to true
		perform action "AXRaise" of (windows whose title is email_app)
		
		delay 0.2
		keystroke "v" using command down
		
	end tell
	
end run