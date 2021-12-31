delay 1

on logVoiceOverLastPhrase()
  tell application "VoiceOver"
    set lastPhrase to content of last phrase
    log lastPhrase
  end tell
end logVoiceOverLastPhrase

do shell script "mkdir -p ./screenshots/"
do shell script "/System/Library/CoreServices/VoiceOver.app/Contents/MacOS/VoiceOverStarter"

delay 4

do shell script "screencapture ./screenshots/starting.png"

tell application "System Events"
  tell application "Safari" to activate

  repeat until (exists window 1 of application process "Safari")
    delay 0.1
  end repeat

  tell process "Safari"
    set frontmost to true
  end tell

  do shell script "screencapture ./screenshots/safari_activated.png"

  repeat until (name of every process contains ("VoiceOver"))
    delay 0.1
  end repeat

  tell application "VoiceOver" to activate

  tell process "VoiceOver"
    set frontmost to true
  end tell

  do shell script "screencapture ./screenshots/voiceover_activated.png"

  my logVoiceOverLastPhrase()

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
  delay 2
  my logVoiceOverLastPhrase()

  do shell script "screencapture ./screenshots/voiceover_navigated.png"

  tell application "VoiceOver" to quit
end tell

tell application "Safari" to quit