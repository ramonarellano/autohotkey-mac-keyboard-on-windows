#Requires AutoHotkey v2.0

;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
; <^>! = RALT

; --------------------------------------------------------------
; Config
; --------------------------------------------------------------
InstallKeybdHook
SetTitleMatchMode(2)
SendMode("Input")

; --------------------------------------------------------------
; Swap left Control and left Windows (Command) keys
; --------------------------------------------------------------
LWin::LCtrl

; --------------------------------------------------------------
; Mac-like screenshots in Windows (requires Windows 10 Snip & Sketch)
; --------------------------------------------------------------

; Capture entire screen with CMD/WIN + SHIFT + 3
+^3::Send("#{PrintScreen}")

; Capture portion of the screen with CMD/WIN + SHIFT + 4
+^4::Send("#+s")

; --------------------------------------------------------------
; media/function keys all mapped to the right option key
; --------------------------------------------------------------

RAlt & F7::Send("{Media_Prev}")
RAlt & F8::Send("{Media_Play_Pause}")
RAlt & F9::Send("{Media_Next}")
F10::Send("{Volume_Mute}")
F11::Send("{Volume_Down}")
F12::Send("{Volume_Up}")

; --------------------------------------------------------------
; Word skipping and marking
; --------------------------------------------------------------

; Remap word marking
<^>!+Right::Send("+^{Right}")
<^>!+Left::Send("+^{Left}")

; Remap word skipping
<^>!Right::Send("^{Right}")
<^>!Left::Send("^{Left}")

; Map Left Control + Right to END
<^Right::Send("{End}")

; Map Left Control + Left to Home
<^Left::Send("{Home}")

; Map Shift + Left Control + Right to Shift End
+<^Right::Send("+{End}")

; Map Shift + Left Control + Left to Shift Home
+<^Left::Send("+{Home}")

; --------------------------------------------------------------
; Swap Alt + Tab and Control + Tab
; --------------------------------------------------------------

; Remap Ctrl-Tab to Alt-Tab
^Tab::
{
    Send "{Alt down}{Tab}"
    KeyWait "Ctrl"
    Send "{Alt up}"
}

; Remap Ctrl-Shift-Tab to Alt-Shift-Tab
^+Tab::
{
    Send "{Alt down}{Shift down}{Tab}"
    KeyWait "Ctrl"
    Send "{Alt up}{Shift up}"
}

; Remap Left Windows key to Control
LWin::
{
    Send "{Ctrl down}"
    KeyWait "LWin"
    Send "{Ctrl up}"
}

; --------------------------------------------------------------
; Special characters
; --------------------------------------------------------------
; Map ' to @
$'::Send("{@}")

; Map | to <
$|:: {
    Send("{<}")
    Return
}

; Map § to >
$§:: {  
    Send("{>}")
   Return
}

; Map < to '
$<:: {
    Send("{'}")
    Return
}

; Map > to §
$>:: {
    Send("{§}")
    Return
}

; Map AltR + 7 to |
<^>!7::Send("{|}")

; Map AltR + 7 to \
+<^>!7::Send("{\}")

; Map Alt + 8 to [
<^>!8::Send("{[}")

; Map Alt + 9 to ]
<^>!9::Send("{]}")

; Map Shift + Alt + 8 to {
<^>!+8::Send("{{}")

; Map Shift + Alt + 9 to }
<^>!+9::Send("{}}")

; --------------------------------------------------------------
; Check if script is running with hotkey Control+Escape
; --------------------------------------------------------------
^Esc::
{
    DetectHiddenWindows(true)
    SetTitleMatchMode(2)

    if WinExist("Test Keyboard.ahk" . " ahk_class AutoHotkey")
    {
        ; Script is running
        MsgBox("The script is running")
    }
    else
    {
        ; Script is not running
        MsgBox("The script is not running")
    }
}

