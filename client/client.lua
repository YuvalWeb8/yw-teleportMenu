local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    while true do
        Wait(1000) 
        updateZones()
    end
end)

function teleportPlayer(coords, message)
    local player = PlayerPedId()
    if player then
        SetEntityCoords(player, coords.x, coords.y, coords.z, false, false, false, true)
        if message then
            if Config.Notification == 'codem-notification' then
                TriggerEvent('codem-notification:Create', message, 'success', 'Teleport Menu', 5000)
            elseif Config.Notification == 'qbcore' then
                TriggerEvent('QBCore:Notify', message, "info")
            end
        end
    end
end

function updateZones()
    for _, spawnerData in ipairs(Config.Coords["SpawnerMenu"]) do
        ox_target:addBoxZone({
            coords = spawnerData.coords,
            size = vec3(1, 1, 1), 
            rotation = 0,
            options = {
                {
                    name = 'spawn_menu',
                    label = 'Open teleport menu',
                    onSelect = function()
                        local organization = exports.core_gangs:getPlayerOrganization()

                        local options = {
                            {
                                title = 'Legion Square',
                                description = 'Teleport to legion square',
                                icon = 'tree',
                                onSelect = function() teleportPlayer({x = 197.82, y = -997.88, z = 29.50}) end
                            },
                            {
                                title = 'Airport',
                                description = 'Teleport to airport',
                                icon = 'plane',
                                onSelect = function() teleportPlayer({x = -1037.47, y = -2735.05, z = 13.76}) end
                            },
                            {
                                title = 'Legion Garage',
                                description = 'Teleport to legion garage',
                                icon = 'car',
                                onSelect = function() teleportPlayer({x = 218.51, y = -803.18, z = 30.9}) end
                            }
                        }

                        if organization and config.GangTeleport then
                            table.insert(options, {
                                title = ('Gang: %s'):format(organization),
                                description = 'Teleport to your gang neighborhood',
                                icon = 'person-rifle',
                                iconColor = 'green',
                                onSelect = function()
                                    local gangLocations = {
                                        CHANG = {coords = {x = -684.38, y = -889.07, z = 24.50}, message = 'You are teleporting to Chang neighborhood'},
                                        GSF = {coords = {x = -136.11, y = -1594.91, z = 34.24}, message = 'You are teleporting to GSF neighborhood'},
                                        BALLAS = {coords = {x = 105.71, y = -1940.45, z = 20.80}, message = 'You are teleporting to Ballas neighborhood'}
                                    }


                                    local gangData = gangLocations[organization]

                                    if gangData then
                                        teleportPlayer(gangData.coords, gangData.message)
                                    else
                                        TriggerEvent('codem-notification:Create', 'Your gang doesn\'t have a neighborhood.', 'error', 'Green - Gangs & DM', 5000)
                                    end
                                end
                            })
                        end

                        lib.registerContext({
                            id = 'some_menu',
                            title = 'Teleport Menu',
                            options = options
                        })
                        lib.showContext('some_menu')
                    end
                }
            }
        })
    end
end