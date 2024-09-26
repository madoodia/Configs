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
    & 'D:\\madoodia\\dev\\RiveCppBuilder\\RiveCppBuilder.code-workspace'
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
    code  "D:\\madoodia\\dev\\Configs"
    code $PROFILE
    # code "C:\\Users\\Chapool\\AppData\\Local\\Programs\\oh-my-posh\\themes\\madoodia.omp.json"
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

function cs {
    II 'D:\\madoodia\\dev\\Zolf'
    II 'D:\\madoodia\\dev\\ComputerGraphics'
    & 'D:\\madoodia\\dev\\OpenGL\\OpenGL.code-workspace'
    & 'D:\\madoodia\\dev\\OpenCL\\OpenCL.code-workspace'
    & 'D:\\madoodia\\dev\\ComputerGraphics\\ComputerGraphics.code-workspace'
    & 'D:\\madoodia\\dev\\Zolf\\Zolf.code-workspace'
    & 'D:\\madoodia\\dev\\codelab\\codelab.code-workspace'
    & 'D:\\madoodia\\dev\\Learning\\Learning.code-workspace'
    & 'D:\\madoodia\\dev\\MoleculeStructureViewer\\MoleculeStructureViewer.code-workspace'
    & 'D:\\madoodia\\dev\\OSLViewer\\OSLViewer.code-workspace'
    & 'D:\\madoodia\\dev\\VSCodeForCpp\\VSCodeForCpp.code-workspace'
    & 'D:\\madoodia\\dev\\vscode-qml\\vscode-qml.code-workspace'
    & 'D:\\madoodia\\dev\\xstudio\\xstudio.code-workspace'
    code 'D:\\madoodia\\pkgs\\QML'
}

function hou {
    & 'D:\\madoodia\\dev\\HoudiniPlugins\\HoudiniPlugins.code-workspace'
}

function pyt {
    # & 'D:\\madoodia\\dev\\HoudiniPlugins\\HoudiniPlugins.code-workspace'
}

function hmh {
    & "D:\madoodia\dev\CPP\CPP.code-workspace"
}

# Setup the environment for the project
function setup {
    param(        
        [string]$directory = ""
    )
    drvp-r
    drvp $directory
    # $env:VCVARS_LOCATION = "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build"
    # & "${env:VCVARS_LOCATION}\vcvarsall.bat" x64
}

function run {
    param(
        [string]$command = "",
        [string]$arg = ""

    )
    $env:path = "W:\bin;" + "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE;" + $env:path
    if ($arg -ne "") {
        $env:myExeFile = "W:\bin\${arg}"
    }
    else {
        $env:myExeFile = ""
    }
    & $command $env:myExeFile
}

function ppp {
    $env:path -split ';'
}

function drvp {
    param(        
        [string]$project_path = ""
    )
    SUBST "W:" $project_path
}

function drvp-r {
    SUBST /D "W:"
}

function rnr {
    code 'D:\\madoodia\\pkgs\\Renderers'
}

function rtr {
    & 'D:\madoodia\dev\Realtime_Rendering\Realtime_Rendering.code-workspace'
}

function zlf {
    & 'D:\madoodia\dev\Zolf\Zolf.code-workspace'
}

function brv {
    & 'D:\madoodia\dev\Bravo\Bravo.code-workspace'
}

function rnd {
    & 'D:\madoodia\dev\Rend\Rend.code-workspace'
}

function spd {
    & 'D:\madoodia\dev\Speed\Speed.code-workspace'
}

function smt {
    & 'D:\madoodia\dev\Smart\Smart.code-workspace'
}



# ------------------------------------- CALLS ---------------------------------------
# setup

# ------------------------------------- HELP ---------------------------------------
function hhh {
    echo -----------------------
    echo $PROFILE
    echo "D:\madoodia\dev\Configs\Windows Terminal\Microsoft.PowerShell_profile.ps1"
    echo "Commands -----------------------------------------"
    echo "hhh:`tHelp of custom commands"
    echo "dev:`tOpen dev folder"
    echo "pkgs:`tOpen pkgs folder"
    echo "sdks:`tOpen sdks folder"
    # echo "UE:`tOpen dev\\UnrealEngine"
    # echo "upd:`tOpen UE5_PluginDev and Rive in VSCode"
    echo "u:`tcd .."
    echo "~: `tcd $home"
    echo "mci:`tOpen madoodia_info in VSCode"
    # echo "ghp:`tOpen GHP_Beta in VSCode"
    # echo "ghp-p:`tOpen GHP_Beta UE5 Project"
    echo "conf:`tOpen Configs and PROFILE in VSCode"
    echo "stc:`tCopy PROFILE into config and push changes into github"
    # echo "lyra:`tOpen LyraStarterGame in VSCode"
    # echo "lyra-p:`tOpen LyraStarterGame UE5 Project"
    # echo "idea:`tOpen __Games_Ideation__ Folder"
    # echo "CS:`tOpen Zolf Project and OpenGL Project in VSCode"
    # echo "HOU:`tOpen HoudiniPlugin Project in VSCode"
    # echo "PYT:`tOpen Python Related Projects in VSCode"
    # echo "setup:`tSetup the environment for the project"
    echo "ppp:`tPrint env:path"
    echo "drvp:`tCreate a virtual drive From your path"
    echo "drvp-r:`tRemove the virtual drive"
    echo "hmh:`tOpen handmadehero project in VSCode"
    # echo "run:`tRun the project's executable"
    echo "rnr:`tOpen Renderers folder in VSCode"
    echo "rtr:`tOpen Realtime_Rendering folder in VSCode"
    echo "zlf: `tOpen [Zolf] Project (C++, Qt, OpenGL, OpenCL) in VSCode"
    echo "brv: `tOpen [Bravo] Project (OpenGL, GLSL [PBR Renderer]) in VSCode"
    echo "rnd: `tOpen [Rend] Project (C++, DOD, CUDA, OPENGL, GLSL [Raytracing Renderer]) in VSCode"
    echo "spd: `tOpen [Speed] Project (DirectX12, DXR, HLSL [Real-Time Renderer]) in VSCode"
    echo "smt: `tOpen [Smart] Project (Vulkan, SPIRV [Real-Time Renderer]) in VSCode"
    echo -----------------------
}