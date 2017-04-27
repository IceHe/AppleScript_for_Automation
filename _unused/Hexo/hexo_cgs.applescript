set cur_path to POSIX path of ((path to me as text) & "::")

run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/cmds_in_iterm.scpt") with parameters {{"cd " & cur_path & " && clear", "hexo clean && hexo generate && hexo server"}}