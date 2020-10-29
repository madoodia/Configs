For setup a project in Visual Studio for creating maya plugin (or add other libraries)
we need these addresses and configs on properties of project: 

Configuration: All Configuration 
Platform: All Platforms

Configuration Properties > General > Configuration Type: Dynamic Library (.dll) 
Configuration Properties > General > Target Extension: .mll 
Configuration Properties > C/C++ > General > Additional Include Directories: ${SDKS_LOCATION}\Maya_2018\include; 
Configuration Properties > C/C++ > Preprocessor > Preprocessor Definitions: WIN32;_WIN64;_USRDLL;NDEBUG;_WINDOWS;NT_PLUGIN;REQUIRE_IOSTREAM; 

Configuration Properties > Linker > General > Additional Library Directories: ${SDKS_LOCATION}\Maya_2018\lib; 
Configuration Properties > Linker > General > Output File: $(OutDir)$(TargetName)_x64$(TargetExt) 
Configuration Properties > Linker > Input > Additional Dependencies: Foundation.lib;OpenMaya.lib;OpenMayaUI.lib;OpenMayaAnim.lib;OpenMayaFX.lib;OpenMayaRender.lib;Image.lib;opengl32.lib;glu32.lib; 
Configuration Properties > Linker > Command Line > Additional Options: /export:initializePlugin /export:uninitializePlugin 
Configuration Properties > Linker > Advanced > Target Machine: MachineX64 (/MACHINE:X64)
