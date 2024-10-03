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

; --------------------------------------------------------------
; Special characters
; --------------------------------------------------------------

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

; Map ' to @
$'::Send("{@}")

; Map Shift + 4 to $
+4::Send("{$}")

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

; Map Shift 0 Alt + 9 to }
<^>!+9::Send("{}}")

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

