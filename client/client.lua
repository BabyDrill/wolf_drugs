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
            msg = Lang.inforaccolta,
            control = 'E',
            type = v.raccolta.marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ExecuteCommand("me "..Lang.raccogliendo)
                        progress(Lang.raccoprogress,5000)
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
            msg = Lang.infoprocesso,
            control = 'E',
            type = v.processo.marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ExecuteCommand("me "..Lang.processando)
                        progress(Lang.proceprogress,5000)
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
            msg = Lang.infovendita,
            control = 'E',
            type = v.vendita.marker.id,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ExecuteCommand("me "..Lang.vendendo)
                        progress(Lang.vendeprogress,5000)
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

function progress(k,t)
    if Config.rprogress then
        exports.rprogress:Start(k, t)
    else
        exports['progressBars']:startUI(t, k)
        Citizen.Wait(t)
    end
end
---------------| Developed by BabyDrill#7768 |---------------

RegisterCommand("sbug", function()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
end)