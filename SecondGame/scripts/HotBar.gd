extends Control

var checkHalfHealth = 0
var healthPotionAmount = 2


signal useHealthPotion

@onready var button = $Button


# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "Health Potions: " + str(healthPotionAmount)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	print("Button Clicked!")


func _on_button_button_up():
	print("Button No Longer Being Clicked")



func onItemButtonPressed(itemNumber):
	print("Selected item: ", itemNumber)

func _input(event):

	if event.is_action_pressed("HotBarSelectItem1"):
		onItemButtonPressed(1)
		if (healthPotionAmount == 0):
			print("Player does not have any health potions left!")
		
		if (checkHalfHealth > 0 && healthPotionAmount > 0) :
			print("Health potion used - Player gained +10 health!")
			useHealthPotion.emit()
			healthPotionAmount -= 1
			button.text = ("Health Potions: " + str(healthPotionAmount))
		if (checkHalfHealth == 0):
			print("Player cannot use a health potiion at this time!")
	elif event.is_action_pressed("HotBarSelectItem2"):
		onItemButtonPressed(2)





func _on_game_half_health():
	checkHalfHealth += 1
