---------------| Developed by BabyDrill#7768 |---------------
Config = {

    AntiCheat = {
        
        MessaggioKick = "Bye Bye | BabyDrill on ToP",--Messaggio Kick del player

        MessaggioConsole = " Ha provato a Chettare con le droghe di wolf development"--Messaggio in console
    },

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
    ["cazzofull"] = "Inventario Pieno, Svuotati un po :)",
    ["veicolo"] = "Esci dal veicolo per compiere questa azione!",
    ["drogafinita"] = "Non hai abbastanza droga da processare!",
    ["drogavendita"] = "Non hai abbastanza droga da vendere!",
    ["PoliziaOff"] = "Non ci sono poliziotti sufficienti!",
    ["Orarioattivato"] = "Non puoi raccogliere a quest'ora! Vatti a fare una canna!",
    ["DrogaVenduta"] = "Hai venduto tutta droga con successo!"
}

Config.Droga = {

    Marijuana = {

        ["raccolta"] = {
            pos = vector3(2233.7734375,5576.087890625,54.048149108887),
            police = 0,
         
            item = {
                add = "cannabis",
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
            },

            other = {
                info = "Premi [~r~E~w~] per raccogliere",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Raccogliendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Raccogliendo..."--Messaggio ProgressBar
            }
        },

        ["processo"] = {
            pos = vector3(2329.1206054688,2571.6494140625,46.676940917969),
            police = 0,
         
            item = {
                add = "marijuana",
                add_quantity = 1,

                remove = "cannabis",
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
            },

            other = {
                info = "Premi [~r~E~w~] per processare",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Processando..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        },

        ["vendita"] = {
            pos = vector3(-1171.8752441406,-1572.2219238281,4.6636276245117), 
            police = 0,
         
            item = {
                remove = "marijuana",
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
            },

            other = {
                info = "Premi [~r~E~w~] per processare",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Processando..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        }
    },

    Cocaina = {
        ["raccolta"] = {
            pos = vector3(363.14041137695,6462.3559570313,30.238111495972),
            police = 0,
         
            item = {
                add = "fogli_coca",
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
            },

            other = {
                info = "Premi [~r~E~w~] per raccogliere",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Raccogliendo..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Raccogliendo..."--Messaggio ProgressBar
            }
        },

        ["processo"] = {
            pos = vector3(2433.9440917969,4969.0043945313,42.347564697266),
            police = 0,
         
            item = {
                add = "cocaina",
                add_quantity = 1,

                remove = "fogli_coca",
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
            },

            other = {
                info = "Premi [~r~E~w~] per processare",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Processando..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        },

        ["vendita"] = {
            pos = vector3(1721.2960205078,3319.9853515625,41.223514556885), 
            police = 0,
         
            item = {
                remove = "cocaina",
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
            },

            other = {
                info = "Premi [~r~E~w~] per processare",--Testo inizionio Processo
                key = 'E',
                abilitato = true,--3dme se volte che si attivo mettete true
                pogressbar = true,--ProgressBar se volete che sia attivo mettete true       
                animazione = true,--Animazione Raccolta se volete che sia attivo mettete true 
                messaggio = "me Sta Processando..",--Messagio 3dme sulla testa
                messaggio_progressbar = "Processando..."--Messaggio ProgressBar
            }
        }
    }
}
---------------| Developed by BabyDrill#7768 |---------------