function mpSleep()
	local player = getPlayer()
	if player:isAsleep() then
		local currentFatigue = player:getStats():getFatigue()
		player:getStats():setFatigue(math.max(0, currentFatigue - 0.008))
		if player:getStats():getFatigue() <= 0 then
			player:forceAwake()
		end
	end
end

Events.EveryOneMinute.Add(mpSleep)
