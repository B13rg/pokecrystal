	object_const_def ; object_event constants
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavenderTownPokefanMText:
	text "That's quite some"
	line "building, eh?"

	para "It's KANTO's RADIO"
	line "TOWER."
	done

LavenderTownTeacherText:
	text "KANTO has many"
	line "good radio shows."
	done

LavenderTownGrampsText:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #MON."
	done

LavenderTownYoungsterText:
	text "You need a #"
	line "FLUTE to wake"
	cont "sleeping #MON."

	para "Every trainer has"
	line "to know that!"
	done

LavenderTownSignText:
	text "LAVENDER TOWN"

	para "The Noble Purple"
	line "Town"
	done

KantoRadioStationSignText:
	text "KANTO RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

SoulHouseSignText:
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 12,  5, LAV_RADIO_TOWER_1F, 1

	db 0 ; coord events

	db 11 ; bg events
	bg_event 13,  7, BGEVENT_READ, LavenderPokecenterSignText
	bg_event 3, 9, BGEVENT_READ, LavenderTownSign
	bg_event 3, 11, BGEVENT_READ, KantoRadioStationSign
	bg_event 3, 13, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 5, 9, BGEVENT_READ, SoulHouseSign
	bg_event 5, 11, BGEVENT_READ, LavenderPokecenterSignText
	bg_event 5, 13, BGEVENT_READ, LavenderMartSignText
	bg_event 13, 13, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 13, 11, BGEVENT_READ, SoulHouseSign
	bg_event 15, 13, BGEVENT_READ, LavenderPokecenterSignText
	bg_event 15, 11, BGEVENT_READ, LavenderMartSignText

	db 4 ; object events
	object_event 15,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  3, 10, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 19, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
