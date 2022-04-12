#script to connect to server
#this will auto load on start of game
extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1" #LOCAL internal ip - use this for running programs on the same computer
#var ip = ... #I am not sure what needs to be here, but I beleieve it might need to be a public static ip address
var port = 1909

var isConnected = false
var Score = 0


func _ready():
	ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port) #create our client
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")
	
func _OnConnectionFailed():
	print("Failed to connect")
	isConnected = false
	
func _OnConnectionSucceeded():
	print("Successfully connected")
	isConnected = true


#I had hoped to include sending my score from the game and accumulating scores in a
#score board (in the server project) and sending them back (to all clients/players). 
#But all I have been able to verify so far is a local connection can be made. 
#I hope this is okay.

#func FetchScoreBoard(scores):
#	rpc_id(1, "FetchScoreBoard", scores)
#
#remote func ReturnScoreBoard(scores, requester):
#	instance_from_id(requester).update_score_board(scores)
