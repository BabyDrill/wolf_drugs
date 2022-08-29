---------------| Developed by BabyDrill#7768 |---------------
Config = {

    rprogress = false,--metti true se usi rprogress e false se usai progressBars

    Blip = {
        {name="Campo di Marijuana", color=69, id=469, x = 2233.7734375, y = 5576.087890625, z = 54.048149108887, grandezza=0.6},
        {name="Processo di Marijuana", color=25, id=514, x = 2329.1206054688, y = 2571.6494140625, z = 46.676940917969, grandezza=0.6},
        {name="Vendita di Marijuana", color=1, id=500, x = -1171.8752441406, y = -1572.2219238281, z = 4.6636276245117, grandezza=0.6},
    },

    Other = {
        job_police = "police",
        block_time = false 
    }
}

Lang = {
    ["inforaccolta"] = "Premi [~r~E~w~] per raccogliere",
    ["infoprocesso"] = "Premi [~r~E~w~] per processare",
    ["infovendita"] = "Premi [~r~E~w~] per vendere",
    ["cazzofull"] = "Inventario Pieno, Svuotati un po :)",
    ["veicolo"] = "Esci dal veicolo per compiere questa azione!",
    ["drogafinita"] = "Non hai abbastanza droga da processare!",
    ["drogavendita"] = "Non hai abbastanza droga da vendere!",
    ["PoliziaOff"] = "Non ci sono poliziotti sufficienti!",
    ["Orarioattivato"] = "Non puoi raccogliere a quest'ora! Vatti a fare una canna!",
    ["DrogaVenduta"] = "Hai venduto tutta droga con successo!",
    ["raccogliendo"] = "Sta Raccogliendo",
    ["raccoprogress"] = "Stai Raccogliendo",
    ["processando"] = "Sta Processando",
    ["proceprogress"] = "Stai Processando",
    ["vendendo"] = "Sta Vendendo",
    ["vendeprogress"] = "Stai Vendendo"
}

Config.Droga = {

    Marijuana = {

        ["raccolta"] = {
            pos = vector3(2233.7734375,5576.087890625,54.048149108887),
            police = 0,
         
            item = {
                add = "medikit",
                add_quantity = 1
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }

        },

        ["processo"] = {
            pos = vector3(2329.1206054688,2571.6494140625,46.676940917969),
            police = 0,
         
            item = {
                add = "pane",
                add_quantity = 1,

                remove = "medikit",
                remove_quantity = 2
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }

        },

        ["vendita"] = {
            pos = vector3(-1171.8752441406,-1572.2219238281,4.6636276245117), 
            police = 0,
         
            item = {
                remove = "pane",
                add_money = 100
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }

        }
    },

    Cocaina = {
        ["raccolta"] = {
            pos = vector3(363.14041137695,6462.3559570313,30.238111495972),
            police = 0,
         
            item = {
                add = "acqua",
                add_quantity = 1
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }

        },

        ["processo"] = {
            pos = vector3(2433.9440917969,4969.0043945313,42.347564697266),
            police = 0,
         
            item = {
                add = "pane",
                add_quantity = 1,

                remove = "acqua",
                remove_quantity = 2
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }

        },

        ["vendita"] = {
            pos = vector3(1721.2960205078,3319.9853515625,41.223514556885), 
            police = 0,
         
            item = {
                remove = "pane",
                add_money = 100
            },

            time = {
                block = "02:00",
                unlock = "08:00"
            },

            marker = {
                id = 22,
                colore = { r = 255, b = 255, g = 255 },
                grandezza = vector3(0.7, 0.7, 0.7),
                distanza = 5.0
            }
            
        }
    }
}
---------------| Developed by BabyDrill#7768 |---------------