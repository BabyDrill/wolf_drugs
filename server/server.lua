---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()
local PoliziaMerda = 0

function ConteggioSbirri()
	local xPlayers = ESX.GetPlayers()
	PoliziaMerda = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == Config.Other.job_police then
			PoliziaMerda = PoliziaMerda + 1
		end
	end
	SetTimeout(15000, ConteggioSbirri)
end

ConteggioSbirri()


local function parse_time(str) 
    if Config.Other.block_time then
	local hour, min = str:match("(%d+):(%d+)")
	if hour == '00' then
		hour = 0
	end
	if min == '00' then
		min = 0
	end
	return os.time{hour = hour, min = min,sec = 1, day = 1, month = 1, year = 1971}
end
end

local function BetweenTimes(between,start,stop) 
    if Config.Other.block_time then
	between = parse_time(between)
	start = parse_time(start)
	stop = parse_time(stop)
	if stop < start then
		stop = stop + 24*60*60 
	end
	return (start <= between) and (between <= stop)
end
end

-- RACCOLTA DROGA -- 
RegisterServerEvent('wolf_dev:babyraccolta')
AddEventHandler('wolf_dev:babyraccolta', function(item, quantity, police, raccolta, block, unlock)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(item)
    local now = os.date('%H:%M')
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(raccolta)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. " Ha provato a Chettare con le droghe di wolf development".."^0")
                local Descrizione = LangS.mod ..GetCurrentResourceName()
                WolfDev(source, Descrizione, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
                DropPlayer(source, "Bye Bye | BabyDrill on ToP")
            else
                xPlayer.addInventoryItem(xItem.name, quantity)
                local Descrizione = LangS.raccolta ..xItem.label 
                WolfDev(source, Descrizione, ConfigS.Webhook.raccolta, ConfigS.Embed_Color.raccolta)
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.PoliziaOff)
    end
end)
-- PROCESSO DROGA --
RegisterServerEvent('wolf_dev:babyprocesso')
AddEventHandler('wolf_dev:babyprocesso', function(itemremove, itemadd, police, processo, quantityremove, quantityadd, block, unlock)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local name = GetPlayerName(source)
    local xItem, xItem2 = xPlayer.getInventoryItem(itemremove), xPlayer.getInventoryItem(itemadd)
    local now = os.date('%H:%M')
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(processo)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. " Ha provato a Chettare con le droghe di wolf development".."^0")
                local Descrizione = LangS.mod ..GetCurrentResourceName()
                WolfDev(source, Descrizione, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
                DropPlayer(source, "Bye Bye | BabyDrill on ToP")
            else
                if xItem.count >= quantityremove then
                    xPlayer.removeInventoryItem(itemremove, quantityremove)
                    xPlayer.addInventoryItem(itemadd, quantityadd)
                    local Descrizione = LangS.processo ..xItem.count.." | "..xItem.label
                    WolfDev(source, Descrizione, ConfigS.Webhook.processo, ConfigS.Embed_Color.processo)
                else
                    TriggerClientEvent("esx:showNotification", source, Lang.drogafinita)
                end
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.PoliziaOff)
    end
end)
-- VENDITA DROGA --
RegisterServerEvent('wolf_dev:babyvendita')
AddEventHandler('wolf_dev:babyvendita', function(police, itemremove, prezzo, vendita, block, unlock)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(itemremove)
    local totale = math.floor(prezzo*xItem.count)
    local now = os.date('%H:%M')
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(vendita)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. " Ha provato a Chettare con le droghe di wolf development".."^0")
                local Descrizione = LangS.mod ..GetCurrentResourceName()
                WolfDev(source, Descrizione, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
                DropPlayer(source, "Bye Bye | BabyDrill on ToP")
            else
                if xItem.count ~= 0 then
                    xPlayer.removeInventoryItem(itemremove, xItem.count)
                    xPlayer.addAccountMoney('black_money', prezzo*xItem.count)
                    local Descrizione = LangS.vendita ..xItem.count.." | "..xItem.label.. LangS.prezzo ..prezzo
                    WolfDev(source, Descrizione, ConfigS.Webhook.vendita, ConfigS.Embed_Color.vendita)
                    TriggerClientEvent("esx:showNotification", source, Lang.DrogaVenduta)
                else
                    TriggerClientEvent("esx:showNotification", source, Lang.drogavendita)
                end
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.PoliziaOff)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    wolflogo()
end)

function wolflogo()
    print("^4[Wolf Development]^0 Drugs System by BabyDrill on ToP")
end

function WolfDev(source, Descrizione, web, embedcolo)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gruppo = xPlayer.getGroup()
    local name = GetPlayerName(source)
    local now = os.date('%H:%M')
	local steam = "n/a"
    local discord = "n/a"
    local license = "n/a"
    local live = "n/a"
    local xbl = "n/a"
    local ip = "n/a"
    for m, n in ipairs(GetPlayerIdentifiers(_source)) do
        if n:match("steam") then
           steam = n
        elseif n:match("discord") then
           discord = n:gsub("discord:", "")
        elseif n:match("license") then
           license = n
        elseif n:match("live") then
           live = n
        elseif n:match("xbl") then
           xbl = n
        elseif n:match("ip") then
           ip = n:gsub("ip:", "")
        end
     end
    PerformHttpRequest(web, function()
    end, "POST", json.encode({
        embeds = {{
            author = {
                name = "| [Wolf Drugs] | Version 2.0",
                url = "https://discord.gg/yjPGt2YMcg",
                icon_url = "https://cdn.discordapp.com/attachments/963899883201388594/964323762877116477/WD.png"},
            title = ConfigS.NomeServer,
            description = LangS.player..name..LangS.id..source..LangS.licenza..license..LangS.steam..steam..LangS.gruppo..gruppo..LangS.discord.."<@"..discord..">"..LangS.ip..ip..LangS.live..live..LangS.xbl..xbl..Descrizione..LangS.tempo..now.."\n\n **Wolf Development - BabyDrill**",
            color = embedcolo
        }}}),{["Content-Type"] = "application/json"})
end

---------------| Developed by BabyDrill#7768 |---------------
