## Building, Using and Debugging OSL in Windows
---

### Contents

0. Introduction
    - Experimental
    - My Setup
    - Inspiration
1. Preparing Environment
    - Cleaning Up the PATH
    - Set-Up needed Environment Variables
    - Set Flags based on your needs
2. Building (Release, Debug)
    - Running the code based on your config
    - Be Patient
    - Clean-Up
    - Errors
3. Running
    - osltoy
    - oslc
4. Development in Windows


---
### 0. Introduction

This document is prepared for those who have problem in building OSL in Windows OS, this is completely custom setup.

(Disclaimer: This Process is completely Experimental and it worked on my system, maybe you get error with changing some errors during this process).

So it would be great to share our experiences to reach to best way of building in Windows (and of course other Operating Systems) to save our time and energy to focus on OSL development and OSL Shader writing.
I try to make it short.

### 0.1 Experimental 

After a lot of effort on manual building OSL on Windows, Finally I found a clean way to do that, I explained every steps I did, I hope it works for you too.
This method is stricktly related to Environment Variables you create and Flags you set to the command and need patient and hard disk.

I've built OSL with **minimal needed packages**, for extra packages, they should be set as flag (**script is under development**)


### 0.2 My Setup

This is my setup I have on my PC for building OSL, so you need to install some software before begin.

My System and Setup Configuration:

**OS**: Windows 10 Home

**Compiler**: Microsoft Visual Studio 2019

**Git**: 2.28.0

**Python**: 3.7 `tip: disable python App Installer in Manage App Execution Aliases (Windows 10)`

**Cmake**: 3.18.4

**Qt**: 5.15.0

**NASM**: 2.15.05 `for JPEG`

**OpenShadingLanguage**: cloned from latest master branch

**Boost**: 1.70

**LLVM**: 11.0.0    `C++ is set on C++14`

**CLANG**: 11.0.0    `C++ is set on C++14`

**WinFlexBison**: 2.5.22

**Zlib**: 1.2.11

**JPEG**: 2.0.5

**TIFF**: 4.1.0

**PNG**: 1.6.35

**PyBind11**: 2.6.0

**LibRaw**: 0.20.2

**OpenImageIO**: 2.1.20

**OpenColorIO**: 1.1.0

**OpenEXR/IlmBase**: 2.5.3

**GLUT**: 3.2.1 `freeglut on windows` (this is needed for **partio**) (unfortunately Partio didn't build, it has a problem) (I created a PR for it in Disney github repo)

**Disney Partio**: latest from master (zip file) (Skip this for now) (I didn't build OSL with Partio)

**PugiXML**: 1.10



### 0.3 Inspiration
After lots of manual building dependencies one by one and fix errors and things I got inspired by the way Pixar uses on USD building and borrowed its structure to build OSL.

so I studied its python build script and found we can use same logic for installing OSL, fortunately after changing and adding OSL needed packages and some custom setup it worked fine

It still needs some other works to make it complete for all dependencies (optionals) and cleaning up

We will keep Pixar name on it as inspiration code (or we can keep their copyright)

The edited version of USD script is available on my OpenShadingLanguage forked repo in this address:

(on rz-building-on-windows branch)

https://github.com/madoodia/OpenShadingLanguage

**TIP:** copy build_scripts folder to your local repo root

---
### 1. Preparing Environment

There are bunch od prerequisites for building OSL that I explained in following sections

### 1.1 Cleaning Up the PATH

Be sure you don't have any custom item added to PATH in your global Environment Variables of Windows

you can reach it:

Start Menu > Edit the system environmment variables > Environment Variables > User Variables/System Variables

so you should not have any path that refer to previous osl installation folders

Recommendation: remove added path for cmake, git, python, Qt, llvm

it should be clean now.

### 1.2 Set-Up needed Environment Variables

For running batch scripts without any problem I recommend to create some base environment variables I listed below

**Needed Environment Variables: (Key/Value based on my installation folder)**

Name | Lunch order
------- | ----------------
BASE_LOCATION | D:\madoodia\sdks
PYTHON_LOCATION | D:\madoodia\sdks
QT_LOCATION | C:\Qt\5.15.0\msvc2019_64
NASM_LOCATION | C:\NASM
GIT_LOCATION | "C:\Program Files\Git"
CMAKE_LOCATION | "C:\Program Files\CMake"
VCVARS_LOCATION | "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build"
|


**Method 1:**

go to Start Menu > Edit the system environmment variables > Environment Variables > User Variables > New button

add Key/value pairs of **Variable Name**/**Variable Value** for each Environment Variable

**Method 2:** (I recomend this method)

Open **build_scripts/osl_env_var_setup.bat**

and edit paths' values based on your installation folders



### 1.3 Set Flags based on your needs

`Under Development`

The main build launcher is here **build_scripts/build_osl.bat**

For now we can not assign pre-installed llvm or boost so we have to build all together at once and put all of them in one directory

I am working on it to see how we can use external llvm and boost installation without error.


---
### 2. Building (Release, Debug)

We Prepared some batch files to do it for you automatically.
Based on Environment Variables you set in previous sections you can just call them and wait for it to be built and installed.

### 2.1 Running the code based on your config

Based on the config (Release or Debug) that you send for installer it will create directory in **BASE_LOCATION** for you

**BASE_LOCATION/osl_release** for Release mode
**BASE_LOCATION/osl_debug** for Debug mode

**IMPORTANT**: `Good to know you can not have Release and Debug files in one directory at the same time, it makes conflict and give you weired errors. So keep them separate.`

### 2.2 Be Patient

You should be patient because the whole process (based on your PC config) takes time between 30 minutes to 1 hour

And it take 85Gb of your hard disk, so please set a location to **BASE_LOCATION** that have enough space.

### 2.3 Clean-Up
If you like you can remove all contents of **BASE_LOCATION/build** except **OpenShadingLanguage** directory, After Installation successfully.

### 2.4 Errors

If you get any error in any step of building process, you can remove the related package's build directory from **BASE_LOCATION/build** and run the installer again.

If you got any error please report to the forum of OSL.

---
### 3. Running

We Prepared some batch files to do it for you automatically.
Based on Environment Variables you set in previous sections you can just call it.

Recommend to use **Powershell**

If you can add your osl installation folders in global windows Environment Variable setup for both Release and Debug, you will get error.

So I recommend to use batch files:
For example, if you use VSCode and want to compile your shader in its terminal, it is better to:
- open a Powershell
- cd OpenShadingLanguage repo
- cd build_script
- run osl_env_setup.bat
- run vscode


### 3.1 osltoy
**Release mode**:
- open powershell
- cd OpenShadingLanguage repo
- cd build_script
- run osl_env_setup.bat
- run osl_release_launcher.bat

### 3.2 oslc
- open powershell
- cd OpenShadingLanguage repo
- cd build_script
- run osl_env_setup.bat
- oslc /path/to/your/shader/shader.osl

---
### 4. Development in Windows

  After editing your code, when you want to see your changes you should build osl again. But the point is it is so faster than before, (I said keep build folder for now)
So just need to rebuild it in release mode.

**Release mode**:
- open powershell
- cd OpenShadingLanguage repo
- cd build_script
- run osl_env_setup.bat
- run build_osl_release.bat

If you open Visual Studio solution (sln) from release or debug, you can build it from inside it after your code editing

So first run osl_env_setup.bat in powershell
then open **.sln** (release or debug) file from inside powershell


plus you can use Visual Studio for debugging.


---

**TIP:** 

If you load a shader in **osltoy** and when hit Recompile, it is crashed and closed, probabely your output color attribute is not **Cout**

It is mandatory to have one **Cout** output Variable in any shader, Otherwise osltoy will crash.


---
**Building Commands Review in order:** (batch file method)

`After editing the osl_env_var_setup.bat content with your path`

in **Powershell** (in your local OpenShadingLanguage repo)

- cd build_scripts
- .\build_osl.bat release       (or .\build_osl.bat debug)
- .\osl_release_launcher.bat    (or .\osl_debug_launcher.bat)
- or open Visual Studio Solution with
    - .\osl_release_sln.bat     (or .\osl_debug_sln.bat)
---



That's it

TIP: this process is getting better, I will update the document soon

---
Reza Aarabi

(C) madoodia.com
