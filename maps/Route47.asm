	object_const_def ; object_event constants

Route47_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route47_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 43, 22, GOLDENROD_PIER, 1
	warp_event 43, 23, GOLDENROD_PIER, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
