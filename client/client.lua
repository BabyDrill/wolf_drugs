---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()

-- LOCAL --
local droga = false

-- RACCOLTA PARTE CLIENT --
Citizen.CreateThread(function()
    for k, v in pairs(Config.Droga) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'raccoltadroga',
            pos = v.raccoltadroga,
            size = vector3(2.1,2.1,2.1),
            scale = Config.Marker.grandezza,
            color = Config.Marker.colore,
            drawDistance = Config.Marker.distanza,
            msg = Config.Raccolta.Info,
            control = 'E',
            type = Config.Marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        raccolta()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("wolf_dev:babyraccolta", v.raccoltaoggetto, v.polizia, v.raccoltadroga, v.quantitaraccolta)
                        droga = false
                    end
                end
            end
        })
    end
end)

-- PROCESSO PARTE CLIENT -- 
Citizen.CreateThread(function()
    for k, v in pairs(Config.Droga) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'processodroga',
            pos = v.processodroga,
            size = vector3(2.1,2.1,2.1),
            scale = Config.Marker.grandezza,
            color = Config.Marker.colore,
            drawDistance = Config.Marker.distanza,
            msg = Config.Processo.Info,
            control = 'E',
            type = Config.Marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        processo()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("wolf_dev:babyprocesso", v.raccoltaoggetto, v.processooggetto, v.polizia, v.processodroga, v.quantitadarimuovere, v.quantitadaaggiungere)
                        droga = false
                    end
                end
            end
        })
    end
end)

-- VENDITA PARTE CLIENT -- 
Citizen.CreateThread(function()
    for k, v in pairs(Config.Vendita2) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'venditadroga',
            pos = v.venditaposizione,
            size = vector3(2.1,2.1,2.1),
            scale = Config.Marker.grandezza,
            color = Config.Marker.colore,
            drawDistance = Config.Marker.distanza,
            msg = Config.Vendita.Info,
            control = 'E',
            type = Config.Marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        vendita()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("wolf_dev:babyvendita", v.venditaoggetto, v.prezzo, v.venditaposizione)
                        droga = false
                    end
                end
            end
        })
    end
end)

---- FUNZIONI -----
function raccolta()
    if Config.Raccolta.Animazione then
        ExecuteCommand('e mechanic3')
    end
    if Config.Raccolta.abilitato then
        ExecuteCommand(Config.Raccolta.Messaggio)
    end
    if Config.Raccolta.Pogressbar then
        exports['progressBars']:startUI(5000, Config.Raccolta.MessaggioProgressBar)
    end
end

function processo()
    if Config.Processo.Animazione then
        ExecuteCommand('e mechanic')
    end
    if Config.Processo.abilitato then
        ExecuteCommand(Config.Processo.Messaggio)
    end
    if Config.Processo.Pogressbar then
        exports['progressBars']:startUI(5000, Config.Processo.MessaggioProgressBar)
    end
end

function vendita()
    if Config.Vendita.Animazione then
        ExecuteCommand('e leanbar')
    end
    if Config.Vendita.abilitato then
        ExecuteCommand(Config.Vendita.Messaggio)
    end
    if Config.Vendita.Pogressbar then
        exports['progressBars']:startUI(5000, Config.Vendita.MessaggioProgressBar)
    end
end
-- PARTE DEI BLIP
Citizen.CreateThread(function()
	for i=1, #Config.Blip, 1 do
		local blip = AddBlipForCoord(Config.Blip[i].x, Config.Blip[i].y, Config.Blip[i].z)
		SetBlipSprite(blip, Config.Blip[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour(blip, Config.Blip[i].color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		SetBlipScale(blip, Config.Blip[i].grandezza)
		AddTextComponentString(Config.Blip[i].name)
		EndTextCommandSetBlipName(blip)
	end
end)
---------------| Developed by BabyDrill#7768 |---------------