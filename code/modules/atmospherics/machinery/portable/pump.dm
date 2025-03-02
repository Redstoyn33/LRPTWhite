#define PUMP_OUT "out"
#define PUMP_IN "in"
#define PUMP_MAX_PRESSURE (ONE_ATMOSPHERE * 25)
#define PUMP_MIN_PRESSURE (ONE_ATMOSPHERE / 10)
#define PUMP_DEFAULT_PRESSURE (ONE_ATMOSPHERE)

/obj/machinery/portable_atmospherics/pump
	name = "портативный воздушный насос"
	icon_state = "psiphon:0"
	density = TRUE

	max_integrity = 250
	///Max amount of heat allowed inside of the canister before it starts to melt (different tiers have different limits)
	var/heat_limit = 5000
	///Max amount of pressure allowed inside of the canister before it starts to break (different tiers have different limits)
	var/pressure_limit = 50000

	var/on = FALSE
	var/direction = PUMP_OUT
	var/target_pressure = ONE_ATMOSPHERE
	///Associated sound loop, plays when the pump is on
	var/datum/looping_sound/pump/soundloop

	volume = 1000

/obj/machinery/portable_atmospherics/pump/Initialize(mapload)
	. = ..()
	soundloop = new(src)

/obj/machinery/portable_atmospherics/pump/Destroy()
	var/turf/T = get_turf(src)
	T.assume_air(air_contents)
	air_update_turf()
	QDEL_NULL(soundloop)
	return ..()

/obj/machinery/portable_atmospherics/pump/update_icon_state()
	icon_state = "psiphon:[on]"

/obj/machinery/portable_atmospherics/pump/update_overlays()
	. = ..()
	if(holding)
		. += "siphon-open"
	if(connected_port)
		. += "siphon-connector"

/obj/machinery/portable_atmospherics/pump/process_atmos(delta_time)
	..()

	var/pressure = air_contents.return_pressure()
	var/temperature = air_contents.return_temperature()
	///function used to check the limit of the pumps and also set the amount of damage that the pump can receive, if the heat and pressure are way higher than the limit the more damage will be done
	if(temperature > heat_limit || pressure > pressure_limit)
		take_damage(clamp((temperature/heat_limit) * (pressure/pressure_limit) * delta_time * 0.5, 5, 50), BURN, 0)
		return

	if(!on)
		return

	var/turf/T = get_turf(src)
	var/datum/gas_mixture/sending
	var/datum/gas_mixture/receiving
	if(direction == PUMP_OUT) // Hook up the internal pump.
		sending = (holding ? holding.air_contents : air_contents)
		receiving = (holding ? air_contents : T.return_air())
	else
		sending = (holding ? air_contents : T.return_air())
		receiving = (holding ? holding.air_contents : air_contents)

	var/output_starting_pressure = receiving.return_pressure()

	if((sending.total_moles() > 0) && (sending.return_temperature() > 0))
		var/pressure_delta = target_pressure - output_starting_pressure
		var/transfer_moles = pressure_delta * receiving.return_volume() / (sending.return_temperature() * R_IDEAL_GAS_EQUATION)

		if(sending.transfer_to(receiving, transfer_moles) && !holding)
			air_update_turf() // Update the environment if needed.

/obj/machinery/portable_atmospherics/pump/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(is_operational)
		if(prob(50 / severity))
			on = !on
		if(prob(100 / severity))
			direction = PUMP_OUT
		target_pressure = rand(0, 100 * ONE_ATMOSPHERE)
		update_icon()

/obj/machinery/portable_atmospherics/pump/replace_tank(mob/living/user, close_valve)
	. = ..()
	if(.)
		if(close_valve)
			if(on)
				on = FALSE
				update_icon()
				soundloop.stop()
		else if(on && holding && direction == PUMP_OUT)
			investigate_log("[key_name(user)] started a transfer into [holding].", INVESTIGATE_ATMOS)

/obj/machinery/portable_atmospherics/pump/ui_interact(mob/user, datum/tgui/ui)
	if(isobserver(user) && !isAdminGhostAI(user))
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PortablePump", name)
		ui.open()

/obj/machinery/portable_atmospherics/pump/ui_data()
	var/data = list()
	data["on"] = on
	data["direction"] = direction == PUMP_IN ? TRUE : FALSE
	data["connected"] = connected_port ? TRUE : FALSE
	data["pressure"] = round(air_contents.return_pressure() ? air_contents.return_pressure() : 0)
	data["target_pressure"] = round(target_pressure ? target_pressure : 0)
	data["default_pressure"] = round(PUMP_DEFAULT_PRESSURE)
	data["min_pressure"] = round(PUMP_MIN_PRESSURE)
	data["max_pressure"] = round(PUMP_MAX_PRESSURE)

	if(holding)
		data["holding"] = list()
		data["holding"]["name"] = holding.name
		data["holding"]["pressure"] = round(holding.air_contents.return_pressure())
	else
		data["holding"] = null
	return data

/obj/machinery/portable_atmospherics/pump/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("power")
			on = !on
			if(on)
				if(!holding)
					var/plasma = air_contents.get_moles(GAS_PLASMA)
					var/n2o = air_contents.get_moles(GAS_NITROUS)
					if(n2o || plasma)
						message_admins("[ADMIN_LOOKUPFLW(usr)] turned on a pump that contains [n2o ? "N2O" : ""][n2o && plasma ? " & " : ""][plasma ? "Plasma" : ""] at [ADMIN_VERBOSEJMP(src)]")
						log_admin("[key_name(usr)] turned on a pump that contains [n2o ? "N2O" : ""][n2o && plasma ? " & " : ""][plasma ? "Plasma" : ""] at [AREACOORD(src)]")
				else if(direction == PUMP_OUT)
					investigate_log("[key_name(usr)] started a transfer into [holding].", INVESTIGATE_ATMOS)
				soundloop.start()
			else
				soundloop.stop()
			. = TRUE
		if("direction")
			if(direction == PUMP_OUT)
				direction = PUMP_IN
			else
				if(on && holding)
					investigate_log("[key_name(usr)] started a transfer into [holding].", INVESTIGATE_ATMOS)
				direction = PUMP_OUT
			. = TRUE
		if("pressure")
			var/pressure = params["pressure"]
			if(pressure == "reset")
				pressure = PUMP_DEFAULT_PRESSURE
				. = TRUE
			else if(pressure == "min")
				pressure = PUMP_MIN_PRESSURE
				. = TRUE
			else if(pressure == "max")
				pressure = PUMP_MAX_PRESSURE
				. = TRUE
			else if(text2num(pressure) != null)
				pressure = text2num(pressure)
				. = TRUE
			if(.)
				target_pressure = clamp(round(pressure), PUMP_MIN_PRESSURE, PUMP_MAX_PRESSURE)
				investigate_log("was set to [target_pressure] kPa by [key_name(usr)].", INVESTIGATE_ATMOS)
		if("eject")
			if(holding)
				replace_tank(usr, FALSE)
				. = TRUE
	update_icon()
