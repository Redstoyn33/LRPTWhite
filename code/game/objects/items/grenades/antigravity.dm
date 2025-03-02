/obj/item/grenade/antigravity
	name = "antigravity grenade"
	icon_state = "emp"
	inhand_icon_state = "emp"

	var/range = 7
	var/forced_value = 0
	var/duration = 300

/obj/item/grenade/antigravity/detonate(mob/living/lanced_by)
	. = ..()
	update_mob()

	for(var/turf/T in view(range,src))
		T.AddElement(/datum/element/forced_gravity, forced_value)
		addtimer(CALLBACK(T, /datum/.proc/_RemoveElement, list(forced_value)), duration)

	qdel(src)

/obj/item/grenade/antigravity/heavy
	name = "Магнитная граната"
	desc = "Данный образец на короткое время увеличивает гравитацию в радиусе взрыва за счет активных частиц."
	forced_value = 3
