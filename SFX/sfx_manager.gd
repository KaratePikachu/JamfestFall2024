extends Node

var sound_loc = "res://SFX/Sounds/"

var bgm_file := "School.ogg"
var death_file = "die.ogg"
var glasses_break_file = "glasses_break.ogg"
var ir_file = "ir.ogg"
var jump_file = "jump.ogg"
var land_file = "land.ogg"
var menu_click_file = "menu.ogg"
var switch_file = "switch.ogg"
var walking_file = "walking.ogg"
var drone_file = "drone.ogg"
var glasses_pick_up_file = "glasses_pick_up.ogg"

@onready var bgm := $bgm
@onready var death = $death
@onready var glasses_break = $glasses_break
@onready var ir = $ir
@onready var jump = $jump
@onready var land = $land
@onready var menu_click = $menu_click
@onready var switch = $switch
@onready var walking = $walking
@onready var drone = $drone
@onready var glasses_pick_up = $glasses_pick_up

func _ready() -> void:
	bgm.stream = AudioStreamOggVorbis.load_from_file(sound_loc + bgm_file)
	death.stream = AudioStreamOggVorbis.load_from_file(sound_loc + death_file)
	glasses_break.stream = AudioStreamOggVorbis.load_from_file(sound_loc + glasses_break_file)
	ir.stream = AudioStreamOggVorbis.load_from_file(sound_loc + ir_file)
	jump.stream = AudioStreamOggVorbis.load_from_file(sound_loc + jump_file)
	land.stream = AudioStreamOggVorbis.load_from_file(sound_loc + land_file)
	menu_click.stream = AudioStreamOggVorbis.load_from_file(sound_loc + menu_click_file)
	switch.stream = AudioStreamOggVorbis.load_from_file(sound_loc + switch_file)
	walking.stream = AudioStreamOggVorbis.load_from_file(sound_loc + walking_file)
	drone.stream = AudioStreamOggVorbis.load_from_file(sound_loc + drone_file)
	glasses_pick_up.stream = AudioStreamOggVorbis.load_from_file(sound_loc + glasses_pick_up_file)

	bgm.volume_db = -9.0
	walking.volume_db = -5.0
	glasses_pick_up.volume_db = 5.0
	death.volume_db = -5.0
	
	bgm.play()


func _on_bgm_finished() -> void:
	bgm.play()


func _on_walking_finished() -> void:
	walking.play()


func _on_drone_finished() -> void:
	drone.play()
