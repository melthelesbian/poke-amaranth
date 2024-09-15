MACRO pic_money
	dw \1
	bcd2 \2
ENDM

TrainerPicAndMoneyPointers::
	table_width 4, TrainerPicAndMoneyPointers
	; pic pointer, base reward money
	; money received after battle = base money × level of last enemy mon
	pic_money YoungsterPic,    15
	pic_money BugCatcherPic,   10
	pic_money LassPic,         15
	pic_money SailorPic,       30
	pic_money JrTrainerMPic,   20
	pic_money JrTrainerFPic,   20
	pic_money PokemaniacPic,   50
	pic_money SuperNerdPic,    25
	pic_money HikerPic,        35
	pic_money BikerPic,        20
	pic_money BurglarPic,      90
	pic_money EngineerPic,     50
	pic_money SweetheartPic,   75
	pic_money FisherPic,       35
	pic_money SwimmerPic,       5
	pic_money CueBallPic,      25
	pic_money GamblerPic,      70
	pic_money BeautyPic,       70
	pic_money PsychicPic,      10
	pic_money RockerPic,       25
	pic_money JugglerPic,      35
	pic_money TamerPic,        40
	pic_money BirdKeeperPic,   25
	pic_money BlackbeltPic,    25
	pic_money Rival1Pic,       100
	pic_money ProfOakPic,      100
	pic_money ChiefPic,        30
	pic_money ScientistPic,    50
	pic_money GiovanniPic,     150
	pic_money RocketPic,       30
	pic_money CooltrainerMPic, 35
	pic_money CooltrainerFPic, 35
	pic_money BrunoPic,        200
	pic_money BrockPic,        150
	pic_money MistyPic,        150
	pic_money LtSurgePic,      150
	pic_money ErikaPic,        150
	pic_money KogaPic,         150
	pic_money BlainePic,       150
	pic_money SabrinaPic,      150
	pic_money GentlemanPic,    70
	pic_money Rival2Pic,       150
	pic_money Rival3Pic,       250
	pic_money LoreleiPic,      200
	pic_money ChannelerPic,    30
	pic_money AgathaPic,       200
	pic_money LancePic,        200
	assert_table_length NUM_TRAINERS
