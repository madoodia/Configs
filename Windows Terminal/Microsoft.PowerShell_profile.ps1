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
    cd "D:\\madoodia\\dev\\madoodia_info"; code .;
}

function pro {
    code $PROFILE
}

function ghp {
    & 'D:\\__GAME_PROJECTS__\\RetroPixelDigital\\Green-Hawk-Platoon.Game\\GHP_Beta.code-workspace'
}
function ghp-p {
    & 'D:\\__GAME_PROJECTS__\\RetroPixelDigital\\Green-Hawk-Platoon.Game\\GHP_Beta.uproject'
}

function lyra {
    & 'D:\\madoodia\\dev\\UE_Projects\\LyraStarterGame\\LyraStarterGame.code-workspace'
}

function lyra-p {
    & 'D:\\madoodia\\dev\\UE_Projects\\LyraStarterGame\\LyraStarterGame.uproject'
}

function conf {
    cd "D:\\madoodia\\dev\\Configs"; code .;
    code $PROFILE;
}

function idea {
    II "D:\\__LiftOff__"
}

function stc {
    Copy-Item $PROFILE -Destination "D:\\madoodia\\dev\\Configs\\Windows Terminal\\Microsoft.PowerShell_profile.ps1" -Recurse -force;
    cd "D:\\madoodia\\dev\\Configs"; git add .; git commit -m "Update PROFILE Command"; git push;
}

function cppp {
    & 'D:\\madoodia\\dev\\UE_Projects\\UE5_CPP\\UE5_CPP.code-workspace'
}

function cppp-p {
    & 'D:\\madoodia\\dev\\UE_Projects\\UE5_CPP\\UE5_CPP.uproject'
}

function usd {
    & 'D:\\madoodia\\dev\\UE_Projects\\UE5_USD\\UE5_USD.code-workspace'
}

function usd-p {
    & 'D:\\madoodia\\dev\\UE_Projects\\UE5_USD\\UE5_USD.uproject'
}

function CS {
    II 'D:\\madoodia\\dev\\Zolf'
    II 'D:\\madoodia\\dev\\ComputerGraphics'
    & 'D:\\madoodia\\dev\\OpenGL\\OpenGL.code-workspace'
    & 'D:\\madoodia\\dev\\ComputerGraphics\\ComputerGraphics.code-workspace'
    & 'D:\\madoodia\\dev\\RiveCppBuilder\\RiveCppBuilder.code-workspace'
    & 'D:\\madoodia\\dev\\Zolf\\Zolf.code-workspace'
    & 'D:\\madoodia\\dev\\Zolf\\Zolf.code-workspace'
}

# ------------------------------------- HELP ---------------------------------------
function -h {
    echo -----------------------
    echo $PROFILE
    echo 'D:\madoodia\dev\Configs\Windows Terminal\Microsoft.PowerShell_profile.ps1'
    echo 'Commands ------------------------------------------'
    echo '-h: Help of custom commands'
    echo 'dev: Open dev folder'
    echo 'pkgs : Open pkgs folder'
    echo 'sdks : Open sdks folder'
    echo 'UE: Open dev\\UnrealEngine'
    echo 'upd: Open UE5_PluginDev in VSCode'
    echo 'u: cd ..'
    echo '~: cd $home'
    echo 'mci: Open madoodia_info in VSCode'
    echo 'ghp: Open GHP_Beta in VSCode'
    echo 'ghp-p: Open GHP_Beta UE5 Project'
    echo 'conf: Open Configs and "$PROFILE" in VSCode'
    echo 'stc: Copy $PROFILE into config and push changes into github'
    echo 'lyra: Open LyraStarterGame in VSCode'
    echo 'lyra-p: Open LyraStarterGame UE5 Project'
    echo 'idea: Open __Games_Ideation__ Folder'
    echo 'CS: Open __Games_Ideation__ Folder'
    echo -----------------------
}