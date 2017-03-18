on run argv
	
	if script = class of argv then
		set today to current date
	else
		set today to (item 1 of argv)
	end if
	
	
	
	if 1 ≠ day of today then
		return false
	end if
	
	set yesterday to (today - 1 * days)
	
	
	
	set day_dd to day of yesterday
	if day_dd < 10 and day_dd > 0 then
		set day_dd to ("0" & day_dd)
	end if
	
	set month_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {yesterday}
	set year_yyyy to year of yesterday
	set year_yy to (year_yyyy mod 100)
	
	set note_name to (year_yyyy & "/" & month_mm & " stu spo was") as string
	
	
	
	# 判断：本月的综合日志，否已完成统计（名字为"yyyy/mm stu spo"，即为未统计状态），或不存在
	set is_stat to (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/note_exist.applescript") with parameters {note_name})
	
	if is_stat = false then
		return false
	end if
	
	
	
	# 确认：是否进行后续操作（昨日\上一周的时间日志必须正确且完整，统计数据才会正确！）
	tell application "Evernote"
		display alert ¬
			"Confirm" message ¬
			"Ready to Stat Last Month?" as informational ¬
			buttons {"Cancel", "Now!"} ¬
			default button 1 ¬
			giving up after 60
	end tell
	
	if "Now!" ≠ (button returned of result) then
		return false
	end if
	
	
	
	# 对本月的时间日志进行格式简化
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/note_simplify_format.applescript") with parameters {note_name}
	
	
	# 备份本月的所有时间日志笔记
	tell application "Evernote"
		set day_logs_this_month to find notes ("notebook:\"" & year_yyyy & "/" & month_mm & "\"")
		set enex_path to "/Users/IceHe/Documents/Enex/Backup/" & year_yyyy & "_" & month_mm & "_Day_Logs.enex"
		export day_logs_this_month to (POSIX file enex_path)
		
		# 备一份到桌面，以便操作
		set desktop_enex_path to "/Users/IceHe/Desktop/" & year_yyyy & "_" & month_mm & "_Day_Logs.enex"
		export day_logs_this_month to (POSIX file desktop_enex_path)
	end tell
	
	
	
	# 启动终端，然后调用有关Python进行后续操作
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/cmds_in_iterm.applescript") with parameters {{"/Users/IceHe/Documents/Python/Month_Time_Stat.py " & (short date string of today)}}
	
	return true
	
end run