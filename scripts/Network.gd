extends Label

func _process(_delta):
	self.text = "Network Connected:" + str(Server.isConnected)
