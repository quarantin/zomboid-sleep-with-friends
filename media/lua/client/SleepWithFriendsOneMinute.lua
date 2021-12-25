function mpSleep()
	local player = getPlayer()
	if player:isAsleep() then
		local currentFatigue = player:getStats():getFatigue()
		local currentEndurance = player:getStats():getEndurance()
		local subtractFatigue = 0.016 / SandboxVars.SleepWithFriends.SleepLength
		local addEndurance = 0.024 / SandboxVars.SleepWithFriends.SleepLength
		player:getStats():setFatigue(math.max(0, currentFatigue - subtractFatigue))
		player:getStats():setEndurance(math.max(0, currentEndurance + addEndurance))
		if player:getStats():getFatigue() <= 0 then
			player:forceAwake()
		end
	end
end

Events.EveryOneMinute.Add(mpSleep)
