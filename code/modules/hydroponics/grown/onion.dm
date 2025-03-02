/obj/item/seeds/onion
	name = "Пачка семян лука"
	desc = "Эти семена вырастают в луковицы."
	icon_state = "seed-onion"
	species = "onion"
	plantname = "Onion Sprouts"
	product = /obj/item/food/grown/onion
	lifespan = 20
	maturation = 3
	production = 4
	yield = 6
	endurance = 25
	instability = 10
	growthstages = 3
	weed_chance = 3
	growing_icon = 'icons/obj/hydroponics/growing_vegetables.dmi'
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	mutatelist = list(/obj/item/seeds/onion/red)

/obj/item/food/grown/onion
	seed = /obj/item/seeds/onion
	name = "Лук"
	desc = "Не для стрельбы."
	icon_state = "onion"
	bite_consumption_mod = 2
	tastes = list("лук" = 1)
	wine_power = 30

/obj/item/food/grown/onion/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/onion_slice, 2, 15)

/obj/item/seeds/onion/red
	name = "Пачка семян красного лука"
	desc = "Для выращивания очень мощного лука."
	icon_state = "seed-onionred"
	species = "onion_red"
	plantname = "Red Onion Sprouts"
	weed_chance = 1
	product = /obj/item/food/grown/onion/red
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/consumable/tearjuice = 0.05)

/obj/item/food/grown/onion/red
	seed = /obj/item/seeds/onion/red
	name = "красный onion"
	desc = "Фиолетовый, несмотря на название."
	icon_state = "onion_red"
	wine_power = 60

/obj/item/food/grown/onion/red/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/onion_slice/red, 2, 15)

/obj/item/food/grown/onion/UsedforProcessing(mob/living/user, obj/item/I, list/chosen_option)
	var/datum/effect_system/fluid_spread/smoke/chem/S = new	//Since the onion is destroyed when it's sliced,
	var/splat_location = get_turf(src)	//we need to set up the smoke beforehand
	S.attach(splat_location)
	S.set_up(0, carry = reagents, location = splat_location)
	S.start()
	qdel(S)
	return ..()

/obj/item/food/onion_slice
	name = "Луковые кольца"
	desc = "Кольца, не бижутерия."
	icon_state = "onionslice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	gender = PLURAL
	w_class = WEIGHT_CLASS_TINY
	microwaved_type = /obj/item/food/onionrings

/obj/item/food/onion_slice/red
	name = "Кольца красного лука"
	desc = "Они сияют, будто низкокачественный аметист."
	icon_state = "onionslice_red"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/tearjuice = 2.5)
