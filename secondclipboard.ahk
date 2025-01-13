; Initialize variables to store the last two clipboard entries
LastClipboard := ""
SecondLastClipboard := ""

; Monitor clipboard content changes
SetTimer, TrackClipboard, 100

^Space:: ; Ctrl + Space to paste the second-most recent clipboard item
    if (SecondLastClipboard != "") {
        Clipboard := SecondLastClipboard ; Set clipboard to second-most recent item
        Send, ^v ; Paste the second-most recent clipboard item
    } else {
        MsgBox, Not enough clipboard history available.
    }
    return

TrackClipboard:
    if (Clipboard != LastClipboard) {
        SecondLastClipboard := LastClipboard ; Move the current last clipboard to second last
        LastClipboard := Clipboard ; Update the last clipboard with the current clipboard content
    }
return
