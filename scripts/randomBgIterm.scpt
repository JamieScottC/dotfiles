tell application "System Events"
  set bgPathList to POSIX path of disk items of folder "/Users/jamiescott/Documents/iterm_backgrounds"
end tell

set filePathListWithoutDS_Store to {}
repeat with i from 1 to count bgPathList 
  if item i of bgPathList does not end with ".DS_Store" then
    set end of filePathListWithoutDS_Store to item i of bgPathList 
  end if
end repeat

set randomIndex to random number from 1 to count of filePathListWithoutDS_Store 

set randomBgPath to item randomIndex of filePathListWithoutDS_Store as string
tell application "iTerm2"
  tell current session of current window
    set background image to randomBgPath 
  end tell
end tell
