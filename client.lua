local sec = 1000
Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(DISCORD_APP_ID)
		SetDiscordRichPresenceAsset('DISCORD_BIG_PICTURE_NAME')
		SetDiscordRichPresenceAssetText('DISCORD_BIG_PICTURE_TEXT')
		SetDiscordRichPresenceAssetSmall('DISCORD_SMALL_PICTURE_NAME')
		SetDiscordRichPresenceAssetSmallText('DISCORD_SMALL_PICTURE_TEXT')
		Citizen.Wait(60*sec)
	end
end)
Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end
	while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end
	if ESX.GetPlayerData().job then
		Citizen.CreateThread(function()
			while true do
				local pName = GetPlayerName(PlayerId())
				local job = ESX.GetPlayerData().job.name
				SetRichPresence(GetPlayerName(PlayerId()).." is roleplaying as a "..ESX.GetPlayerData().job.name.." with "..GetNumberOfPlayers().." other player(s).")
				Citizen.Wait(15*sec)
			end
		end)
	end
end)