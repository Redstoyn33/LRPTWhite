//Meant for simple animals to drop lootable human bodies.

//If someone can do this in a neater way, be my guest-Kor

//This has to be separate from the Away Mission corpses, because New() doesn't work for those, and initialize() doesn't work for these.

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

//List of different corpse types

/obj/effect/mob_spawn/human/corpse/syndicatesoldier
	name = "Syndicate Operative"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/syndicatesoldiercorpse

/datum/outfit/syndicatesoldiercorpse
	name = "Syndicate Operative Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/helmet/swat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/advanced/chameleon
	id_trim = /datum/id_trim/chameleon/operative

/obj/effect/mob_spawn/human/corpse/syndicatecommando
	name = "Syndicate Commando"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/syndicatecommandocorpse

/datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/advanced/chameleon
	id_trim = /datum/id_trim/chameleon/operative


/obj/effect/mob_spawn/human/corpse/syndicatestormtrooper
	name = "Syndicate Stormtrooper"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/syndicatestormtroopercorpse

/datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen/harness
	id = /obj/item/card/id/advanced/chameleon
	id_trim = /datum/id_trim/chameleon/operative

/obj/effect/mob_spawn/human/clown/corpse
	roundstart = FALSE
	instant = TRUE
	skin_tone = "caucasian1"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/obj/effect/mob_spawn/human/corpse/pirate
	name = "Pirate"
	skin_tone = "caucasian1" //all pirates are white because it's easier that way
	outfit = /datum/outfit/piratecorpse
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/piratecorpse
	name = "Pirate Corpse"
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/eyepatch
	head = /obj/item/clothing/head/bandana


/obj/effect/mob_spawn/human/corpse/pirate/ranged
	name = "Pirate Gunner"
	outfit = /datum/outfit/piratecorpse/ranged

/datum/outfit/piratecorpse/ranged
	name = "Pirate Gunner Corpse"
	suit = /obj/item/clothing/suit/pirate
	head = /obj/item/clothing/head/pirate


/obj/effect/mob_spawn/human/corpse/russian
	name = "Russian"
	outfit = /datum/outfit/russiancorpse
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/russiancorpse
	name = "Russian Corpse"
	uniform = /obj/item/clothing/under/costume/soviet
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/bearpelt
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas



/obj/effect/mob_spawn/human/corpse/russian/ranged
	outfit = /datum/outfit/russiancorpse/ranged

/datum/outfit/russiancorpse/ranged
	name = "Ranged Russian Corpse"
	head = /obj/item/clothing/head/ushanka


/obj/effect/mob_spawn/human/corpse/russian/ranged/trooper
	outfit = /datum/outfit/russiancorpse/ranged/trooper

/datum/outfit/russiancorpse/ranged/trooper
	name = "Ranged Russian Trooper Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/helmet/alt
	mask = /obj/item/clothing/mask/balaclava


/obj/effect/mob_spawn/human/corpse/russian/ranged/officer
	name = JOB_RUSSIAN_OFFICER
	outfit = /datum/outfit/russiancorpse/officer

/datum/outfit/russiancorpse/officer
	name = "Russian Officer Corpse"
	uniform = /obj/item/clothing/under/costume/russian_officer
	suit = /obj/item/clothing/suit/security/officer/russian
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/ushanka


/obj/effect/mob_spawn/human/corpse/wizard
	name = "Space Wizard Corpse"
	outfit = /datum/outfit/wizardcorpse
	hairstyle = "Bald"
	facial_hairstyle = "Long Beard"
	skin_tone = "caucasian1"

/datum/outfit/wizardcorpse
	name = "Space Wizard Corpse"
	uniform = /obj/item/clothing/under/color/lightpurple
	suit = /obj/item/clothing/suit/wizrobe
	shoes = /obj/item/clothing/shoes/sandal/magic
	head = /obj/item/clothing/head/wizard


/obj/effect/mob_spawn/human/corpse/nanotrasensoldier
	name = "\improper Nanotrasen Private Security Officer"
	outfit = /datum/outfit/nanotrasensoldiercorpse2
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/nanotrasensoldiercorpse2
	name = "NT Private Security Officer Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/security
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/centcom/corpse/private_security/tradepost_officer

/obj/effect/mob_spawn/human/corpse/nanotrasenassaultsoldier
	name = "Nanotrasen Private Security Officer"
	outfit = /datum/outfit/nanotrasenassaultsoldiercorpse
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/nanotrasenassaultsoldiercorpse
	name = "NT Assault Officer Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/security
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/centcom/corpse/assault

/obj/effect/mob_spawn/human/corpse/cat_butcher
	name = "The Cat Surgeon"
	hairstyle = "Cut Hair"
	facial_hairstyle = "Watson Mustache"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/cat_butcher

/obj/effect/mob_spawn/human/corpse/der_cmo
	name = "Derelict mad doc"
	hairstyle = "Cut Hair"
	facial_hairstyle = "Watson Mustache"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/cat_butcher/cmo

/datum/outfit/cat_butcher
	name = "Cat Butcher Uniform"
	uniform = /obj/item/clothing/under/rank/medical/doctor/green
	suit = /obj/item/clothing/suit/apron/surgical
	shoes = /obj/item/clothing/shoes/sneakers/white
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack/satchel/med
	id = /obj/item/card/id/advanced
	glasses = /obj/item/clothing/glasses/hud/health
	id_trim = /datum/id_trim/away/cat_surgeon

/datum/outfit/cat_butcher/cmo
	name = "Derelict mad doc"
	suit = /obj/item/clothing/suit/toggle/labcoat/mad
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/polymer
	id_trim = /datum/id_trim/away/old

/obj/effect/mob_spawn/human/corpse/bee_terrorist
	name = "BLF Operative"
	outfit = /datum/outfit/bee_terrorist

/datum/outfit/bee_terrorist
	name = "BLF Operative"
	uniform = /obj/item/clothing/under/color/yellow
	suit = /obj/item/clothing/suit/hooded/bee_costume
	shoes = /obj/item/clothing/shoes/sneakers/yellow
	gloves = /obj/item/clothing/gloves/color/yellow
	ears = /obj/item/radio/headset
	belt = /obj/item/storage/belt/fannypack/yellow/bee_terrorist
	id = /obj/item/card/id/advanced
	l_pocket = /obj/item/paper/fluff/bee_objectives
	mask = /obj/item/clothing/mask/animal/rat/bee
