---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()

-- LOCAL --
local droga = false

-- RACCOLTA PARTE CLIENT --
Citizen.CreateThread(function()
    for k, v in pairs(Config.Droga) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'raccolta:'..k,
            pos = v.raccolta.pos,
            size = vector3(2.1,2.1,2.1),
            scale = v.raccolta.marker.grandezza,
            color = v.raccolta.marker.colore,
            drawDistance = v.raccolta.marker.distanza,
            msg = v.raccolta.other.info,
            control = v.raccolta.other.key,
            type = v.raccolta.marker.id,
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
                        TriggerServerEvent("wolf_dev:babyraccolta", v.raccolta.item.add, v.raccolta.item.add_quantity, v.raccolta.police, v.raccolta.pos, v.raccolta.time.block, v.raccolta.time.unblock)
                        babydrill()
                        droga = false
                    end
                end
            end
        })
        
        TriggerEvent('gridsystem:registerMarker', {
            name = 'processo'..k,
            pos = v.processo.pos,
            size = vector3(2.1,2.1,2.1),
            scale = v.processo.marker.grandezza,
            color = v.processo.marker.colore,
            drawDistance = v.processo.marker.distanza,
            msg = v.processo.other.info,
            control = v.processo.other.key,
            type = v.processo.marker.id,
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
                        TriggerServerEvent("wolf_dev:babyprocesso", v.processo.item.remove, v.processo.item.add, v.processo.police, v.processo.pos, v.processo.item.remove_quantity, v.processo.item.add_quantity, v.processo.time.block, v.processo.time.unblock)
                        babydrill()
                        droga = false
                    end
                end
            end
        })
        
        TriggerEvent('gridsystem:registerMarker', {
            name = 'venditadroga:'..k,
            pos = v.vendita.pos,
            size = vector3(2.1,2.1,2.1),
            scale = v.vendita.marker.grandezza,
            color = v.vendita.marker.colore,
            drawDistance = v.vendita.marker.distanza,
            msg = v.vendita.other.info,
            control = v.vendita.marker.key,
            type = v.vendita.marker.id,
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
                        TriggerServerEvent("wolf_dev:babyvendita", v.vendita.police, v.vendita.item.remove, v.vendita.item.add_money, v.vendita.pos, v.vendita.time.block, v.vendita.time.unblock)
                        babydrill()
                        droga = false
                    end
                end
            end
        })
    end
end)

---- FUNZIONI -----
function raccolta()
    for k, v in pairs(Config.Droga) do
        if v.raccolta.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.raccolta.other.abilitato then
            ExecuteCommand(v.raccolta.other.messaggio)
        end
        if v.raccolta.other.pogressbar then
            exports['progressBars']:startUI(5000, v.raccolta.other.messaggio_progressbar)
        end
    end
end

function processo()
    for k, v in pairs(Config.Droga) do
        if v.processo.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.processo.other.abilitato then
            ExecuteCommand(v.processo.other.messaggio)
        end
        if v.processo.other.pogressbar then
            exports['progressBars']:startUI(5000, v.processo.other.messaggio_progressbar)
        end
    end
end

function vendita()
    for k, v in pairs(Config.Droga) do
        if v.vendita.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.vendita.other.abilitato then
            ExecuteCommand(v.vendita.other.messaggio)
        end
        if v.vendita.other.pogressbar then
            exports['progressBars']:startUI(5000, v.vendita.other.messaggio_progressbar)
        end
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

function babydrill()
    print("^1BabyDrill on ToP^0")
end
---------------| Developed by BabyDrill#7768 |---------------