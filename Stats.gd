extends Node

export(int) var max_health = 1 setget set_max_health
var health = max_health setget set_health
export(int) var damage = 1 setget set_damage
export(int) var defence = 1 setget set_defence
export(int) var money = 1 setget set_money
export(int) var ShaiEXP = 1 setget set_ShaiEXP
export(int) var TsukiEXP = 1 setget set_TsukiEXP
#creates health - Hadi

signal death
signal health_depleted()
signal health_changed(value)
signal max_health_changed(value)
signal damage_changed(value)
signal defence_changed(value)
signal money_changed(value)
signal ShaiEXP_changed(value)
signal TsukiEXP_changed(value)
#creates signals - Hadi

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)
#max health code - Hadi

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health == 0:
		emit_signal("health_depleted")
	if health <= 0:
		emit_signal("death")
#health code - Hadi

func _ready():
	self.health = max_health
#replaces onready var

func set_damage(value):
	damage = value
	emit_signal("damage_changed", damage)
#Damage stat - Hadi

func set_defence(value):
	defence = value
	emit_signal("defence_changed", defence)

func set_money(value):
	money = value 
	emit_signal("money_changed", money)

func set_ShaiEXP(value):
	ShaiEXP = value
	emit_signal("ShaiEXP_changed", ShaiEXP)

func set_TsukiEXP(value):
	TsukiEXP = value
	emit_signal("TsukiEXP_changed", TsukiEXP)
