# Make file for Maya plug-ins on Windows10 64-bit
# Author: madoodia@gmail.com
#
# ----------------------------------------------------------------------------------------------------
# PROJECT SETTINGS
# ----------------------------------------------------------------------------------------------------
PROJECT_NAME       = helloCmd2
OBJECTS            = $(PROJECT_NAME).obj
USELESS_EXT         = *.obj \
                     *.lib \
                     *.exp \
                     *.idb
# 
# ----------------------------------------------------------------------------------------------------
# LOCATION SETTINGS
# ----------------------------------------------------------------------------------------------------
DEVKIT_LOCATION    = "D:\Madoodia\_SDKs\_maya_sdks\Maya_2017"
#
# ----------------------------------------------------------------------------------------------------
# BUILD SETTINGS
# ----------------------------------------------------------------------------------------------------
TARGET             = $(PROJECT_NAME).mll
INCLUDES           = -I. -I$(DEVKIT_LOCATION)\include
LIBS               = glu32.lib opengl32.lib gdi32.lib user32.lib Image.lib OpenMaya.lib OpenMayaUI.lib OpenMayaAnim.lib OpenMayaFX.lib OpenMayaRender.lib Foundation.lib \
                     -LIBPATH:$(DEVKIT_LOCATION)\lib
LINKER_FLAGS       = -export:initializePlugin -export:uninitializePlugin -SUBSYSTEM:WINDOWS -MACHINE:X64 -DLL
DEL_FILE           = del
LINKER             = link
MAKE_DIR           = mkdir

#
# ----------------------------------------------------------------------------------------------------
# COMPILER SETTINGS
# ----------------------------------------------------------------------------------------------------
CL                 = cl
DEFINES            = -DREQUIRE_IOSTREAM -DUNICODE -DWIN32 -D_WIN64 -D_USRDLL -DNDEBUG -D_WINDOWS -DNT_PLUGIN
CL_FLAGS           = -nologo -Zc:wchar_t -FD -Fo -GS -O2 -MD -W3 -w34100 -w34189 -w44996 -GR -EHsc $(DEFINES)

.SUFFIXES: .cpp .c

.cpp.obj::
    $(CL) -c $(CL_FLAGS) $(INCLUDES) @<<
    $<
<<

all: Makefile  $(TARGET) clean

$(TARGET):  $(OBJECTS)
    $(LINKER) $(LINKER_FLAGS) -OUT:$(TARGET) $(OBJECTS) $(LIBS)

clean:
    -$(DEL_FILE) $(USELESS_EXT)