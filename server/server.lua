---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()
local PoliziaMerda = 0

function ConteggioSbirri()
	local xPlayers = ESX.GetPlayers()
	PoliziaMerda = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			PoliziaMerda = PoliziaMerda + 1
		end
	end
	SetTimeout(15000, ConteggioSbirri)
end

ConteggioSbirri()


local function parse_time(str) 
    if Config.Orario.Abilitato then
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
    if Config.Orario.Abilitato then
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
AddEventHandler('wolf_dev:babyraccolta', function(droga, cops, coordporcodio, quantitaraccolta)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(droga)
	local count = 2
    local now = os.date('%H:%M')
    local gruppo = xPlayer.getGroup()
    local steamid = xPlayer.identifier
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(coordporcodio)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= cops then
        if BetweenTimes(now, Config.Orario.BloccaOre, Config.Orario.SbloccaOre) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato, Config.Orario.BloccaOre)
        else
        if distanza > 5 then
            print("^8ID: ["..source.."] "..GetPlayerName(source).. Config.AntiCheat.MessaggioConsole.."^0")
            DropPlayer(source, Config.AntiCheat.MessaggioKick)
            local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.mod ..GetCurrentResourceName().. "\n \n **© BabyDrill#7768**"
            AntiCheat(Descrizione)
        else
        if xItem.count < xItem.weight then
            xPlayer.addInventoryItem(xItem.name, quantitaraccolta)
            local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.raccolta ..xItem.label.. LangS.tempo ..now.."\n \n **© BabyDrill#7768**"
            BabyDrill(Descrizione)
            --Babylogo()
        else
            TriggerClientEvent("esx:showNotification", source, Lang.cazzofull)
        end
    end
    end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.PoliziaOff)
    end
end)
-- PROCESSO DROGA --
RegisterServerEvent('wolf_dev:babyprocesso')
AddEventHandler('wolf_dev:babyprocesso', function(oggettorimosso, oggettoaggiunto, cops, coordporcodio, quantitadarimuovere, quantitadaaggiungere)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local name = GetPlayerName(source)
    local xItem, xItem2 = xPlayer.getInventoryItem(oggettorimosso), xPlayer.getInventoryItem(oggettoaggiunto)
    local now = os.date('%H:%M')
    local gruppo = xPlayer.getGroup()
    local steamid = xPlayer.identifier
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(coordporcodio)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= cops then
        if BetweenTimes(now, Config.Orario.BloccaOre, Config.Orario.SbloccaOre) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato, Config.Orario.BloccaOre)
        else
        if distanza > 5 then
            print("^8ID: ["..source.."] "..GetPlayerName(source).. Config.AntiCheat.MessaggioConsole.."^0")
            DropPlayer(source, Config.AntiCheat.MessaggioKick)
            local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.mod ..GetCurrentResourceName().. "\n \n **© BabyDrill#7768**"
            AntiCheat(Descrizione)
        else
            if xItem.count >= quantitadarimuovere then
                xPlayer.removeInventoryItem(oggettorimosso, quantitadarimuovere)
                xPlayer.addInventoryItem(oggettoaggiunto, quantitadaaggiungere)
                local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.processo ..xItem.count.." | "..xItem.label.. LangS.tempo ..now.."\n \n **© BabyDrill#7768**"
                BabyDrill(Descrizione)
                --Babylogo()
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
AddEventHandler('wolf_dev:babyvendita', function(oggettorimosso, prezzo, coordporcodio)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(oggettorimosso)
    local totale = math.floor(prezzo*xItem.count)
    local gruppo = xPlayer.getGroup()
    local steamid = xPlayer.identifier
    local now = os.date('%H:%M')
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(coordporcodio)
	local distanza = #(dista1 - dista2)

    if PoliziaMerda >= 0 then
        if BetweenTimes(now, Config.Orario.BloccaOre, Config.Orario.SbloccaOre) then 
            TriggerClientEvent('esx:showNotification', source, Lang.Orarioattivato, Config.Orario.BloccaOre)
        else
        if distanza > 5 then
            print("^8ID: ["..source.."] "..GetPlayerName(source).. Config.AntiCheat.MessaggioConsole.."^0")
            DropPlayer(source, Config.AntiCheat.MessaggioKick)
            local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.mod ..GetCurrentResourceName().. "\n \n **© BabyDrill#7768**"
            AntiCheat(Descrizione)
        else
        if xItem.count ~= 0 then
            xPlayer.removeInventoryItem(oggettorimosso, xItem.count)
            xPlayer.addAccountMoney('black_money', prezzo*xItem.count)
            local Descrizione = LangS.player ..name.. LangS.steam ..steamid.. LangS.gruppo ..gruppo.. LangS.vendita ..xItem.count.." | "..xItem.label.. LangS.prezzo ..prezzo
            BabyDrill(Descrizione)
            TriggerClientEvent("esx:showNotification", source, Lang.DrogaVenduta)
            --Babylogo()
        else
            TriggerClientEvent("esx:showNotification", source, Lang.drogavendita)
        end
    end
    end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.PoliziaOff)
    end
end)

function logo()
print([[
    
  ^4██╗       ██╗ █████╗ ██╗     ███████╗
  ^4██║  ██╗  ██║██╔══██╗██║     ██╔════╝
  ^4╚██╗████╗██╔╝██║  ██║██║     █████╗  
  ^4 ████╔═████║ ██║  ██║██║     ██╔══╝  
  ^4 ╚██╔╝ ╚██╔╝ ╚█████╔╝███████╗██║     
  ^4 ╚═╝   ╚═╝   ╚════╝ ╚══════╝╚═╝     

  ^1|Wolf Development|
  |Developed by BabyDrill|^0]])
end

BabyDrill = function(Descrizione)
    PerformHttpRequest(ConfigS.Generale.Webhook, function()
    end, "POST", json.encode({
        embeds = {{
            author = {
                name = ConfigS.Generale.NomeServer,
                url = "https://discord.gg/prtRpMH9we",
                icon_url = ConfigS.Generale.LogoServer},
            title = ConfigS.Generale.TitoloLog,
            description = Descrizione,
            color = ConfigS.Generale.ColoreWebhook
        }}}),{["Content-Type"] = "application/json"})
end

AntiCheat = function(Descrizione)
    PerformHttpRequest(ConfigS.Anticheat.Webhook, function()
    end, "POST", json.encode({
        embeds = {{
            author = {
                name = ConfigS.Anticheat.NomeServer,
                url = "https://discord.gg/prtRpMH9we",
                icon_url = ConfigS.Anticheat.LogoServer},
            title = ConfigS.Anticheat.TitoloLog,
            description = Descrizione,
            color = ConfigS.Anticheat.ColoreWebhook
        }}}),{["Content-Type"] = "application/json"})
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    logo()
end)

---------------| Developed by BabyDrill#7768 |---------------