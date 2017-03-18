on run argv
	
	if script = class of argv then
		set target_date to current date
	else
		set target_date to (item 1 of argv)
	end if
	
	
	set next_day to (target_date + 1 * days)
	
	set next_day_dd to day of next_day
	if next_day_dd < 10 and next_day_dd > 0 then
		set next_day_dd to ("0" & next_day_dd)
	end if
	
	
	set next_day_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {next_day}
	set next_day_yyyy to year of next_day
	set next_day_yy to (next_day_yyyy mod 100)
	
	
	set target_date_yyyy to year of target_date
	set target_date_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {target_date}
	
	
	
	tell application "Evernote"
		
		# Move Note "Life - Framework"
		(*
		set note_query to "notebook:\"" & target_date_yyyy & "/" & target_date_mm & "\" intitle:\"Life - Fw\""
		log note_query
		set note_found to find notes note_query
		
		set life_framework_path to "/Users/IceHe/Documents/Enex/life_framework_" & next_day_yyyy & "_" & next_day_mm & ".enex"
		export note_found to (life_framework_path as POSIX file)
		
		set notebook_name to (next_day_yyyy & "/" & next_day_mm) as string
		import (life_framework_path as POSIX file) to notebook_name
		
		delete note_found
		*)
		
		
		# Move Note "yy/mm/dd stu spo"
		
		set note_query to "notebook:\"" & target_date_yyyy & "/" & target_date_mm & "\" intitle:\"yy/mm/dd stu spo\""
		set note_found to find notes note_query
		
		set life_framework_path to "/Users/IceHe/Documents/Enex/yymmdd_stu_spo_" & next_day_yyyy & "_" & next_day_mm & ".enex"
		
		try
			export note_found to (life_framework_path as POSIX file)
		on error
			return false
		end try
		
		set notebook_name to (next_day_yyyy & "/" & next_day_mm) as string
		import (life_framework_path as POSIX file) to notebook_name
		
		delete note_found
		
	end tell
	
	return true
	
end run