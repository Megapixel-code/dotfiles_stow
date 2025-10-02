return 



KeyRelease event, serial 36, synthetic NO, window 0x400001,
root 0x27a, subw 0x0, time 18421526, (256,870), root:(2619,1571),
state 0x4, keycode 105 (keysym 0xffe4, Control_R), same_screen YES,
XLookupString gives 0 bytes:
XFilterEvent returns: False


xmodmap -e 'clear Control_R' 
xmodmap -e 'keycode 37 = Alt_Gr' 


