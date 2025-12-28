MoveManiacHouse_Script:
	jp EnableAutoTextBoxDrawing

MoveManiacHouse_TextPointers:
	def_text_pointers
    dw_const MoveManiacHouseMoveManiacText,  TEXT_MOVEMANIACHOUSE_MOVE_MANIAC
	
MoveManiacHouseMoveManiacText:
	text_far MoveManiacText
	text_end