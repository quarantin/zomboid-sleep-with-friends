function mpSleep()
	local player = getPlayer()
	if player:isAsleep() then
		local currentFatigue = player:getStats():getFatigue()
		local subtractFatigue = 0.016 / SandboxVars.SleepWithFriends.SleepLength
		player:getStats():setFatigue(math.max(0, currentFatigue - subtractFatigue))
		if player:getStats():getFatigue() <= 0 then
			player:forceAwake()
		end
	end
end

Events.EveryOneMinute.Add(mpSleep)
