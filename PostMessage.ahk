; 상수
global KEY_DOWN := 0x100
global KEY_UP := 0x101

global MOUSE_MOVE := 0x200

global MOUSE_DOWN_L := 0x201
global MOUSE_UP_L := 0x202
global MOUSE_DB_CLICK_L := 0x203

global MOUSE_DOWN_R := 0x204
global MOUSE_UP_R := 0x205
global MOUSE_DB_CLICK_R := 0x206

global A = new KeyParam(65, 2097153)

Class KeyParam{
	wParam := 0
	lParam := 0
	
	__New(wParam, lParam){
		this.wParam := wParam
		this.lParam := lParam
	}
}

; key press
SendKeyPress(key, classNm, titleNm){
	postmessage, %KEY_DOWN%, %key%.wParam, %key%.lParam, %classNm%, %titleNm%
	Sleep, 20
	postmessage, %KEY_UP%, %key%.wParam, %key%.lParam, %classNm%, %titleNm%
}

; key down
SendKeyPress(key, classNm, titleNm){
	postmessage, %KEY_DOWN%, %key%.wParam, %key%.lParam, %classNm%, %titleNm%
}


