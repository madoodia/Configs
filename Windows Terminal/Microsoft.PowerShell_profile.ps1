oh-my-posh init pwsh --config 'C:\\Users\\Chapool\\AppData\\Local\\Programs\\oh-my-posh\\themes\\madoodia.omp.json' | Invoke-Expression

#  custom commands
function dev {
    cd "D:\\madoodia\\dev"
}

function pkgs {
    cd "D:\\madoodia\\pkgs"
}

function sdks {
    cd "D:\\madoodia\\sdks"
}

function UE {
    cd "D:\\madoodia\\dev\\UnrealEngine"
}

function upd {
    & 'D:\\madoodia\\dev\\UE_Projects\\UE5_PluginDev\\UE5_PluginDev.code-workspace'
}

function u {
    cd ..
}

function ~ {
    cd "$home"
}

function mci {
    code "D:\\madoodia\\dev\\madoodia_info"
}

function pro {
    code $PROFILE
}

function ghp {
    & 'D:\\__GAME_PROJECTS__\\RetroPixelDigital\\Green-Hawk-Platoon.Game\\GHP_Beta.code-workspace'
}

function lyra {
    & 'D:\\madoodia\\dev\\UE_Projects\\LyraStarterGame\\LyraStarterGame.code-workspace'
}

function conf {
    code "D:\\madoodia\\dev\\Configs"
}

function stc {
    Copy-Item $PROFILE -Destination "D:\\madoodia\\dev\\Configs\\Windows Terminal\\Microsoft.PowerShell_profile.ps1" -Recurse -force;
    cd "D:\\madoodia\\dev\\Configs"; git add .;git commit -m "Update PROFILE Command";git push;
}

# ------------------------------------- HELP ---------------------------------------
function -h {
    echo -----------------------
    echo 'dev: Open dev folder'
    echo 'pkgs : Open pkgs folder'
    echo 'sdks : Open sdks folder'
    echo 'UE: Open dev\\UnrealEngine'
    echo 'upd: Open UE5_PluginDev in VSCode'
    echo 'u: cd ..'
    echo '~: cd $home'
    echo 'mci: Open madoodia_info in VSCode'
    echo '-h: Help of custom commands'
    echo 'pro: Open $PROFILE in VSCode'
    echo 'ghp: Open GHP_Beta in VSCode'
    echo 'conf: Open Configs in VSCode'
    echo 'stc: Copy $PROFILE into config and push changes into github'
    echo 'lyra: Open LyraStarterGame in VSCode'
    echo -----------------------
}