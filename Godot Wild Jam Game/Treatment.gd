extends Control

var reached5 = false
var virusInfections = 0
var isInScene

func _process(delta):
	var timer = get_node("Timer")
	timer.wait_time = 0.26
	
	var button = get_node("Button2")
	var checked = get_node("CheckButton")
	var text = get_node("Label3")
	var backButton = get_node("Button")
	var MainHospital = get_parent().get_node("Hospital Purchasing")
	

	
	if visible == true:
		isInScene = true
	if visible == false:
		isInScene = false
	
	if backButton.pressed == true:
		MainHospital.visible = true
		visible = false
			
	if button.pressed == true:
		virusInfections += 1

	
	if virusInfections > 10:
		virusInfections = 10

		
	if virusInfections == 10:
		timer.autostart = true
	
	if virusInfections != 10:
		checked.pressed = false
		
	text.text = str(virusInfections)

func _on_Timer_timeout():
	var checked = get_node("CheckButton")
	
	var text = get_node("Label3")
	text.text = str(virusInfections)
	if virusInfections > 0 and checked.pressed == false:
		virusInfections -= 1
		
	