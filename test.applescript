on logVoiceOverLastPhrase()
  tell application "VoiceOver"
    set lastPhrase to content of last phrase
    log lastPhrase
  end tell
end logVoiceOverLastPhrase

-- Reduce chance of "Application isn't running" error
delay 1

with timeout of 1800 seconds
  -- Start VoiceOver
  do shell script "/System/Library/CoreServices/VoiceOver.app/Contents/MacOS/VoiceOverStarter"
  
  -- Reduce chance of "Application isn't running" error
  delay 4

  -- Launch Safari
  tell application "Safari" to activate
  delay 1

  -- Focus VoiceOver
  tell application "VoiceOver" to activate
  delay 1

  tell application "System Events"
    -- Wait for Safari to actually exist
    repeat until (exists window 1 of application process "Safari")
      delay 1
    end repeat

    -- Interact with element
    key code 125 using {control down, option down, shift down}
    delay 1
    my logVoiceOverLastPhrase()

    -- Move right 5 times
    key code 124 using {control down, option down}
    delay 1
    my logVoiceOverLastPhrase()

    key code 124 using {control down, option down}
    delay 1
    my logVoiceOverLastPhrase()

    key code 124 using {control down, option down}
    delay 1
    my logVoiceOverLastPhrase()

    key code 124 using {control down, option down}
    delay 1
    my logVoiceOverLastPhrase()

    key code 124 using {control down, option down}
    delay 1
    my logVoiceOverLastPhrase()
    
    -- Navigate to GitHub
    tell application "Safari" to activate
    keystroke "https://github.com/guidepup/guidepup"
    key code 36
    delay 4
    my logVoiceOverLastPhrase()
  end tell

  tell application "VoiceOver" to quit
  tell application "Safari" to quit
end timeout