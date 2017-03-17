on run argv
	
	if script = class of argv then
		set today to current date
	else
		set today to (item 1 of argv)
	end if
	
	
	
	set today to today - (((weekday of today) as integer) + 2) mod 7 * days
	
	set day_dd to day of today
	if day_dd < 10 and day_dd > 0 then
		set day_dd to ("0" & day_dd)
	end if
	
	set month_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.scpt") with parameters {today}
	set year_yyyy to year of today
	set year_yy to (year_yyyy mod 100)
	
	
	set target_note_name to (year_yy & month_mm & day_dd & " Job Report") as string
	set exported_note_name to year_yy & "_" & month_mm & "_" & day_dd & " Job Report"
	set exported_note_path to "/Users/IceHe/Documents/Enex/job_report/" & exported_note_name
	set report_path to (exported_note_path & "/" & target_note_name & ".resources/" & year_yyyy & "-" & month_mm & "-" & day_dd & " 何志远周报.md")
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/note_export_html.scpt") with parameters {target_note_name, exported_note_path}
	
	
	
	set email_app to "Mail"
	
	if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_running.scpt") with parameters {email_app}) then
		tell application email_app to launch
		delay 1
	end if
	
	tell application "Finder"
		set the clipboard to (report_path as POSIX file)
	end tell
	
	tell application "Mail"
		mailto "mailto:hubo3@staff.weibo.com,xinwu@staff.weibo.com?subject=【MAPI周报】何志远 " & year_yyyy & "-" & month_mm & "-" & day_dd
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