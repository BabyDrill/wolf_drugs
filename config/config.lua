---------------| Developed by BabyDrill#7768 |---------------
Config = {

    AntiCheat = {
        
        MessaggioKick = "Bye Bye | BabyDrill on ToP",--Messaggio Kick del player

        MessaggioConsole = " Ha provato a Chettare con le droghe di wolf development"--Messaggio in console
    },

    Marker = {

        id = 22,

        colore = { r = 255, b = 255, g = 255 },

        grandezza = vector3(0.7, 0.7, 0.7),

        distanza = 5.0
 
    },

    Raccolta = {

        Info = "Premi [~r~E~w~] per raccogliere",--Testo inizionio Processo

        abilitato = true,--3dme se volte che si attivo mettete true

        Pogressbar = true,--ProgressBar se volete che sia attivo mettete true

        Animazione = true,--Animazione Raccolta se volete che sia attivo mettete true

        Messaggio = "me Sta Raccogliendo..",--Messagio 3dme sulla testa

        MessaggioProgressBar = "Raccogliendo..."--Messaggio ProgressBar
    },

    Processo = {

        Info = "Premi [~r~E~w~] per processare",--Testo inizionio Processo

        abilitato = true,--3dme se volte che si attivo mettete true

        Pogressbar = true,--ProgressBar se volete che sia attivo mettete true

        Animazione = true,--Animazione Raccolta se volete che sia attivo mettete true

        Messaggio = "me Sta Processando..",--Messagio 3dme sulla testa

        MessaggioProgressBar = "Processando..."--Messaggio ProgressBar
    },

    Vendita = {

        Info = "Premi [~r~E~w~] per vendendo",--Testo inizionio Processo

        abilitato = true,--3dme se volte che si attivo mettete true

        Pogressbar = true,--ProgressBar se volete che sia attivo mettete true

        Animazione = true,--Animazione Raccolta se volete che sia attivo mettete true

        Messaggio = "me Sta Contrattando..",--Messagio 3dme sulla testa

        MessaggioProgressBar = "Vendendo..."--Messaggio ProgressBar
    },

    Orario = {

        Abilitato = false,--Metti true se vuoi che raccolta, processo e vendita abbiano il blocco orario e invece metti false se non  vuoi che il tempo influenzi le tue droghe :)

        BloccaOre = "12:00",--Orario di blocco

        SbloccaOre = "20:00"--Orario di Sblocco
    },

    Blip = {
        {name="Campo di Marijuana", color=69, id=469, x = 2233.7734375, y = 5576.087890625, z = 54.048149108887, grandezza=0.6},
        {name="Processo di Marijuana", color=25, id=514, x = 2329.1206054688, y = 2571.6494140625, z = 46.676940917969, grandezza=0.6},
        {name="Vendita di Marijuana", color=1, id=500, x = -1171.8752441406, y = -1572.2219238281, z = 4.6636276245117, grandezza=0.6},
    },
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

    ['Marijuana'] = {

        ['raccoltadroga'] = vector3(2233.7734375,5576.087890625,54.048149108887), ['quantitaraccolta'] = 1,
        
        ['processodroga'] = vector3(2329.1206054688,2571.6494140625,46.676940917969), ['quantitadarimuovere'] = 2, ['quantitadaaggiungere'] = 1,

        ['raccoltaoggetto'] = 'cannabis', ['processooggetto'] = 'marijuana', 

        ['polizia'] = 0

    },
}

Config.Vendita2 = {

    ['Droga1'] = {

        ['venditaposizione'] = vector3(-1171.8752441406,-1572.2219238281,4.6636276245117), 

        ['venditaoggetto'] = 'marijuana', 
    
        ['prezzo'] = '100'

    },
}
---------------| Developed by BabyDrill#7768 |---------------