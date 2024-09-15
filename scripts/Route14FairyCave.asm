Route14FairyCave_Script:
    jp EnableAutoTextBoxDrawing

Route14FairyCave_TextPointers:
    def_text_pointers
    dw_const Route14FairyCaveSweetheartText, TEXT_ROUTE14FAIRYCAVE_SWEETHEART

Route14FairyCaveSweetheartText:
    text "Oh! You caught me"
    line "by surprise."

    para "The #MON here"
    line "are adorable,"
    cont "don't you think?"
    done