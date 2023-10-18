#Include Gdip_all.ahk
#Include Gdip_ImageSearch.ahk
#Include Search_img.ahk

; 필드 ------------------------------------------------------------------------------------------------------

; 키 값
global key_up
global key_left
global key_right
global key_down
global key_empty
global key_party1
global key_party2
global key_party3
global key_party4
global key_party5
global key_party6
global key_cmd1
global key_cmd2
global key_cmd3
global key_cmd4
global key_cmd5
global key_attack
global key_kurosagiTarget

; App플레이어 관련
global classNm
global titleNm
global appPlayer

; 옵션 ini 값 불러오기 ---------------------------------------------------------------------------------------------
IniRead, key_up, Options.ini, Keys, Up
IniRead, key_left, Options.ini, Keys, Left
IniRead, key_right, Options.ini, Keys, Right
IniRead, key_down, Options.ini, Keys, Down
IniRead, key_empty, Options.ini, Keys, Empty
IniRead, key_party1, Options.ini, Keys, Party1
IniRead, key_party2, Options.ini, Keys, Party2
IniRead, key_party3, Options.ini, Keys, Party3
IniRead, key_party4, Options.ini, Keys, Party4
IniRead, key_party5, Options.ini, Keys, Party5
IniRead, key_party6, Options.ini, Keys, Party6
IniRead, key_cmd1, Options.ini, Keys, Cmd1
IniRead, key_cmd2, Options.ini, Keys, Cmd2
IniRead, key_cmd3, Options.ini, Keys, Cmd3
IniRead, key_cmd4, Options.ini, Keys, Cmd4
IniRead, key_cmd5, Options.ini, Keys, Cmd5
IniRead, key_attack, Options.ini, Keys, Attack
IniRead, key_kurosagiTarget, Options.ini, Keys, KurosagiTarget

IniRead, classNm, Options.ini, AppPlayer, ClassNN
IniRead, titleNm, Options.ini, AppPlayer, Title
WinGet, appPlayer, ID, %titleNm%

; 메소드 ------------------------------------------------------------------------------------------------------

; 창 크기 조정
SetSize(w, h) {
	WinGetPos, X, Y, , , %titleNm%
	WinMove, %titleNm%, , X, Y, w, h
}

; 랜덤 인카운트
Encounter() {		
	Loop {

		ControlFocus, %classNm%, %titleNm%
		ControlSend, %classNm%, {Blind}{%key_right% Down}, %titleNm%
		Sleep, 1000
		ControlSend, %classNm%, {Blind}{%key_right% Up}, %titleNm%
		Sleep, 200
		ControlSend, %classNm%, {Blind}{%key_left% Down}, %titleNm%
		Sleep, 1000
		ControlSend, %classNm%, {Blind}{%key_left% Up}, %titleNm%
		
		/*
		postmessage, 0x100, 68, 2097153, %classNm%, %titleNm%
		Sleep, 1000
		postmessage, 0x101, 68, 2097153, %classNm%, %titleNm%
		Sleep, 200
		postmessage, 0x100, 65, 1966081, %classNm%, %titleNm%
		Sleep, 1000
		postmessage, 0x101, 65, 1966081, %classNm%, %titleNm%
		*/
	
		if(Search_img("state.png", appPlayer, x, y)) {
			if (!x || !y) {
				; MsgBox, 이미지 '파일'을 찾을 수 없습니다.
			} else {
				; MsgBox, success!! x=%x% y=%y%
				; 이미지 찾음
				break
			}
		} else {
			; MsgBox, 이미지를 찾을 수 없습니다.
		}
	}
}

; 전투 결과창 확인
BattleResultSkip() {
	Loop {
		if(Search_img("battle_result.png", appPlayer, x, y)) {
			if (!x || !y) {
				; MsgBox, 이미지 '파일'을 찾을 수 없습니다.
			} else {
				; MsgBox, success!! x=%x% y=%y%
				; 이미지 찾음
				Sleep, 500
				ControlFocus, %classNm%, %titleNm%
				ControlSend, %classNm%, {Blind}{%key_empty% Down}{%key_empty% Up}, %titleNm%
				;postmessage, 0x100, 68, 2097153, %classNm%, %titleNm%
				;Sleep, 1000
				;postmessage, 0x101, 68, 2097153, %classNm%, %titleNm%
				break
			}
		} else {
			; MsgBox, 이미지를 찾을 수 없습니다.
		}
	}
}

; 전투 중 멤버 체인지
MemberChange(party1, party2) {
	ControlFocus, %classNm%, %titleNm%
	ControlSend, %classNm%, {Blind}{%party1% Down}{%party1% Up}, %titleNm%
	Sleep, 300
	ControlSend, %classNm%, {Blind}{%key_cmd5% Down}{%key_cmd5% Up}, %titleNm%
	Sleep, 300
	ControlSend, %classNm%, {Blind}{%party2% Down}{%party2% Up}, %titleNm%
	Sleep, 300
}

; 마수성 반복 매크로
MasusungMacro() {
	Loop {
		Encounter()
		Sleep, 1000
		MemberChange(key_party3, key_party5)
		ControlSend, %classNm%, {Blind}{%key_attack% Down}{%key_attack% Up}, %titleNm%
		BattleResultSkip()
		Sleep, 2000
	}
}

; 쿠로사기성 반복 매크로
KurosagiMacro() {
	Loop {
		Encounter()
		Sleep, 1000
		ControlSend, %classNm%, {Blind}{%key_kurosagiTarget% Down}{%key_kurosagiTarget% Up}, %titleNm%
		Sleep, 300
		MemberChange(key_party4, key_party6)
		MemberChange(key_party3, key_party5)
		ControlSend, %classNm%, {Blind}{%key_attack% Down}{%key_attack% Up}, %titleNm%
		BattleResultSkip()
		Sleep, 2000
	}
}

; 일반 공격 반복 매크로
AttackMacro() {
	Loop {
		Encounter()
		ControlSend, %classNm%, {Blind}{%key_attack% Down}{%key_attack% Up}, %titleNm%
		BattleResultSkip()
		Sleep, 2000
	}
}

; Gui -----------------------------------------------------------------------------------------------------

; ui 구성
Gui, Add, Button, x20 y20 w200 h30 gMasu, 마수성
Gui, Add, Button, x20 y60 w200 h30 gKurosagi, 쿠로사기성
Gui, Add, Button, x20 y100 w200 h30 gAttack, 일반 공격
Gui, Add, Button, x20 y140 w200 h30 gStopMacro, 중지
Gui, Add, Button, x20 y180 w200 h30 gGuiClose, 종료
Gui, Show, w240 h300, AnotherEden Macro
OnMessage(0x200, "Help")
return

; 마수성 매크로
Masu:
SetSize(1600, 900)
MasusungMacro()
return

; 쿠로사기성 매크로
Kurosagi:
SetSize(1600, 900)
KurosagiMacro()
return

; 일반 공격 매크로
Attack:
SetSize(1600, 900)
AttackMacro()
return

; 매크로 중지 ctrl r
;^r::
StopMacro:
Reload
return

; 조커 VC 어택
;^`::
JokerVC:
MemberChange(key_party3, key_party5)
ControlSend, %classNm%, {Blind}{%key_attack% Down}{%key_attack% Up}, %titleNm%
return

GuiClose:
ExitApp

Help(wParam, lParam, Msg) {
	MouseGetPos,,,, OutputVarControl

	;IfEqual, OutputVarControl, Button3
		;Help := "Ctrl + R"
	ToolTip % Help
}
