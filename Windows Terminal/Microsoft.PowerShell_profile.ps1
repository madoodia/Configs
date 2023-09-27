oh-my-posh init pwsh --config 'C:\Users\Chapool\AppData\Local\Programs\oh-my-posh\themes\madoodia.omp.json' | Invoke-Expression

#  custom commands
function dev {
    cd D:\madoodia\dev
}

function sdks {
    cd D:\madoodia\sdks
}

function UE {
    cd D:\madoodia\dev\UnrealEngine
}

function pl {
    cd D:\madoodia\dev\UE_Projects\UE5_PluginDev
}

function u {
    cd ..
}

function ~ {
    cd $home
}
