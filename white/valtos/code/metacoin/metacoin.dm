/client/proc/process_endround_metacoin()
	if(IsAdminAdvancedProcCall())
		return
	if(!mob)
		return
	var/mob/M = mob
	if(M.mind && !isnewplayer(M))
		if(M.stat != DEAD && !isbrain(M))
			if(EMERGENCY_ESCAPED_OR_ENDGAMED)
				if(!M.onCentCom() && !M.onSyndieBase())
					inc_metabalance(M, METACOIN_SURVIVE_REWARD, reason="Выжил.")
				else
					inc_metabalance(M, METACOIN_ESCAPE_REWARD, reason="Выжил и сбежал!")
			else
				inc_metabalance(M, METACOIN_ESCAPE_REWARD, reason="Выжил.")
		else
			inc_metabalance(M, METACOIN_NOTSURVIVE_REWARD, reason="Я пытался...")

/client/proc/process_greentext(reward, o_completed)
	if(IsAdminAdvancedProcCall())
		return
	if(!reward)
		reward = 5
	switch(o_completed)
		if(0)
			inc_metabalance(mob, reward, reason="Не удалось выполнить задачи...")
		if(1)
			inc_metabalance(mob, reward, reason="Задача выполнена!")
		if(2 to INFINITY)
			inc_metabalance(mob, reward, reason="Задачи выполнены!")

/client/proc/get_metabalance()
	/*
	var/datum/db_query/query_get_metacoins = SSdbcore.NewQuery(
		"SELECT round(metacoins) FROM player WHERE ckey = :ckey",
		list("ckey" = ckey)
	)
	var/mc_count = 0
	if(!query_get_metacoins.warn_execute())
		qdel(query_get_metacoins)
		return
	if(query_get_metacoins.NextRow())
		mc_count = text2num(query_get_metacoins.item[1])

	if(mc_count == null)
		set_metacoin_count(0, FALSE)

	qdel(query_get_metacoins)
	return mc_count
	*/
	return 10000000

/client/proc/update_metabalance_cache()
	//mc_cached = get_metabalance()
	mc_cached = 10000000

/client/proc/set_metacoin_count(mc_count, ann = TRUE)
	return
	/*
	if(IsAdminAdvancedProcCall())
		return

	var/datum/db_query/query_set_metacoins = SSdbcore.NewQuery(
		"UPDATE player SET metacoins = :mc_count WHERE ckey = :ckey",
		list("mc_count" = mc_count, "ckey" = ckey)
	)
	query_set_metacoins.Execute()
	update_metabalance_cache()
	qdel(query_set_metacoins)
	if(ann)
		to_chat(src, "<span class='rose bold'>Новый баланс: [mc_count] метакэша!</span>")
	*/

/proc/inc_metabalance(mob/M, mc_count, ann = TRUE, reason = null)
	return
	/*
	if(IsAdminAdvancedProcCall())
		return

	if(!M.client || mc_count == 0)
		return

	var/datum/db_query/query_inc_metacoins = SSdbcore.NewQuery(
		"UPDATE player SET metacoins = metacoins + :mc_count WHERE ckey = :ckey",
		list("mc_count" = mc_count, "ckey" = M.client.ckey)
	)
	query_inc_metacoins.warn_execute()
	qdel(query_inc_metacoins)

	WRITE_LOG("data/metacoin.log", "[GLOB.round_id] - [M?.ckey] > [mc_count] < [reason]")

	if(!M.client || !M)
		return
	M.client.update_metabalance_cache()
	if(ann)
		if(reason)
			to_chat(M, "<span class='rose bold'>[reason] [mc_count >= 0 ? "Получено" : "Потеряно"] [abs(mc_count)] метакэша!</span>")
		else
			to_chat(M, "<span class='rose bold'>[mc_count >= 0 ? "Получено" : "Потеряно"] [abs(mc_count)] метакэша!</span>")
	*/
/client
	var/mc_cached = 10000000

/mob/living/carbon/human/get_status_tab_items()
	. = ..()
	. += ""
	. += "Метакэш: [client.mc_cached]"
