extends Label

#var score_board
#
#func _ready():
##	#get the score board (first give the server this client's score)
#	Server.FetchScoreBoard(Server.Score) 

func _process(_delta):
	self.text = "Score: " + str(Server.Score)
#
#func update_score_board(scores):
#	#update score board with all scores from server
#	score_board = scores
