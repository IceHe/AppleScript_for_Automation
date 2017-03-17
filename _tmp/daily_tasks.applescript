(*
set today to (current date)

if run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_task_run.scpt") with parameters today then return false

if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/wait_till_network_available.scpt") with parameters today) then return false
*)

(*
set is_sync to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.scpt")
log is_sync
if false = is_sync or 0 = is_sync then
	tell application "Evernote"
		display alert Â
			"Error" message Â
			("Evernote Sync for too long time!
Maybe any error appeared?
Please Re-execute Daily_Task manually~") Â
				as warning Â
			buttons {"Stop"}
	end tell
	return false
end if
*)

(*
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "add_day_log"}) then
	delay 3
	if false ­ (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/add_day_log.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "add_day_log"}
		delay 7
	end if
end if
*)

(*
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_day"}) then
	if false ­ (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_day.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_day"}
		delay 7
	end if
end if
*)

(*
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_week"}) then
	if false ­ (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_week.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_week"}
		delay 7
	end if
end if
*)

(*
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_month"}) then
	if false ­ (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_month.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_month"}
		delay 7
	end if
end if
*)

(*
run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/add_job_report.scpt") with parameters today

return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_task_run.scpt") with parameters today
*)