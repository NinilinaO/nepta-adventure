extends Control

signal closed
signal opened
var isOpen = false

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()
