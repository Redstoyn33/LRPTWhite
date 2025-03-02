/obj/structure/alien/weeds/xen
	name = "xen weeds"
	desc = "A thick vine-like surface covers the floor."
	color = "#ac3b06"

/obj/structure/spacevine/xen
	name = "xen vines"
	color = "#ac3b06"

/obj/structure/spacevine/xen/Initialize(mapload)
	. = ..()
	add_atom_colour("#ac3b06", FIXED_COLOUR_PRIORITY)

/obj/structure/spacevine/xen/thick
	name = "thick xen vines"
	color = "#ac3b06"
	opacity = TRUE

/obj/structure/mineral_door/xen
	name = "organic door"
	color = "#ff8d58"
	icon = 'white/valtos/icons/black_mesa/xen_door.dmi'
	icon_state = "resin"
	openSound = 'white/valtos/sounds/black_mesa/xen_door.ogg'
	closeSound = 'white/valtos/sounds/black_mesa/xen_door.ogg'

/obj/machinery/door/keycard/xen
	name = "locktight organic door"
	desc = "An oddly robust organic looking door."
	icon = 'white/valtos/icons/black_mesa/xen_door.dmi'
	icon_state = "resin"
	puzzle_id = "xen"

/obj/item/keycard/xen
	name = "xen keycard"
	desc = "A xen keycard."
	color = "#ac3b06"
	puzzle_id = "xen"

/obj/machinery/conveyor/inverted/auto
	processing_flags = START_PROCESSING_ON_INIT

/obj/machinery/conveyor/inverted/auto/Initialize(mapload, newdir)
	. = ..()
	set_operating(TRUE)

/obj/machinery/conveyor/inverted/auto/update()
	. = ..()
	if(.)
		set_operating(TRUE)

/obj/structure/marker_beacon/green
	picked_color = "Lime"
	// set icon_state to make it clear for mappers
	icon_state = "markerlime-on"

/obj/structure/pod
	name = "supply pod"
	desc = "Someone must have sent this a long way."
	icon = 'white/valtos/icons/black_mesa/structures.dmi'
	icon_state = "pod"
	pixel_x = SUPPLYPOD_X_OFFSET
	anchored = TRUE

