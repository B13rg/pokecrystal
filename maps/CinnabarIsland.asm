;tile block id
BASE_DOOR_OPEN   EQU $06
BASE_DOOR_CLOSED   EQU $57

ugdoor: MACRO
\1_YCOORD EQU \2
\1_XCOORD EQU \3
ENDM

	ugdoor BASE_ENTRANCE,  $08, $04

doorstate: MACRO
	changeblock UGDOOR_\1_YCOORD, UGDOOR_\1_XCOORD, UNDERGROUND_DOOR_\2
ENDM

	object_const_def ; object_event constants
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd pokecentersign

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

RocketBaseScript:
	opentext
	checkevent EVENT_SWITCH_1
	iftrue .On
	writetext SwitchText_OffTurnOn
	yesorno
	iffalse RocketBaseSwitch_DontToggle
	setevent EVENT_SWITCH_1
	sjump OpenBase

.On:
	writetext SwitchText_OnTurnOff
	yesorno
	iffalse RocketBaseSwitch_DontToggle
	clearevent EVENT_SWITCH_1
	sjump CloseBase

.OpenBase:
	doorstate 1, OPEN
	sjump .UpdateMap

.CloseBase:
	doorstate 1, CLOSED

.UpdateMap:
	reloadmappart
	closetext
	end

RocketBaseSwitch_DontToggle:
	closetext
	end

CinnabarIslandBlueText:
	text "Who are you?"

	para "Well, it's plain"
	line "to see that you're"
	cont "a trainer…"

	para "My name's BLUE."

	para "I was once the"
	line "CHAMPION, although"

	para "it was for only a"
	line "short time…"

	para "That meddling RED"
	line "did me in…"

	para "Anyway, what do"
	line "you want? You want"

	para "to challenge me or"
	line "something?"

	para "…I hate to say"
	line "it, but I'm not in"

	para "the mood for a"
	line "battle now."

	para "Take a good look"
	line "around you…"

	para "A volcano erupts,"
	line "and just like"

	para "that, a whole town"
	line "disappears."

	para "We can go on win-"
	line "ning and losing in"

	para "#MON. But if"
	line "nature so much as"

	para "twitches, we can"
	line "lose in a second."

	para "…"

	para "That's the way it"
	line "is…"

	para "But, anyway, I'm"
	line "still a trainer."

	para "If I see a strong"
	line "opponent, it makes"
	cont "me want to battle."

	para "If you want to"
	line "battle me, come to"
	cont "the VIRIDIAN GYM."

	para "I'll take you on"
	line "then."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "CINNABAR GYM has"
	line "relocated to SEA-"
	cont "FOAM ISLANDS."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done

SwitchText_OffTurnOn:
	text "It's OFF."
	line "Turn it ON?"
	done

SwitchText_OnTurnOff:
	text "It's ON."
	line "Turn it OFF?"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1
	warp_event  8,  5, ROCKET_CINNABAR_BASE_ENTRANCE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy
	bg_event 11,  1, BGEVENT_READ, RocketBaseScript

	db 1 ; object events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
