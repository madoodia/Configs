# how to play with AL_USDMaya


from pxr import Usd

cmds.AL_usdmaya_ProxyShapeImport(help=True)

cmds.AL_usdmaya_ProxyShapeImport(file="D:/_madoodia_/pixar_usd/USD/AL_USDMaya/samples/testchar_animallogo01_surfgeo_highres.usd")

cmds.AL_usdmaya_ProxyShapeImport(file="D:/_madoodia_/pixar_usd/USD/examples/Kitchen_set/Kitchen_set.usd")


# ========================
import maya
import os
from pxr import Sdf

ASSET_BASE = r"D:\_madoodia_\pixar_usd\USD\AL_USDMaya\tutorials\endToEndMaya"

def LoadStage():
    if not maya.cmds.pluginInfo('AL_USDMayaPlugin', l=True, q=True):
        maya.cmds.loadPlugin('AL_USDMayaPlugin')
    stageFile = os.path.join(ASSET_BASE, 'shots/s00_01/s00_01.usd')
    if not os.path.exists(stageFile):
        raise RuntimeError('File not found: %s'%stageFile)
    maya.cmds.AL_usdmaya_ProxyShapeImport(f=stageFile, name='shot')

def GetStage():
    from AL import usdmaya
    stageCache = usdmaya.StageCache.Get()
    stages = stageCache.GetAllStages()
    if stages:
        return stages[0]
    else:
        raise RuntimeError('No stage loaded in AL_USDMaya!')

def GetLayoutLayer():
    stage = GetStage()
    layoutLayerFilePath = os.path.join(ASSET_BASE, 'shots/s00_01/s00_01_layout.usd')

    # we use Sdf, a lower level library, to obtain the 'layout' layer.
    workingLayer = Sdf.Layer.FindOrOpen(layoutLayerFilePath)
    assert stage.HasLocalLayer(workingLayer)
    return workingLayer
    
def SetCurrentEditTarget():
    maya.cmds.AL_usdmaya_LayerCurrentEditTarget('shot', layer=GetLayoutLayer().identifier, findByIdentifier=True)

def OpenOutliner():
    import usdqt.app
    stage = GetStage()
    dialog = usdqt.app.UsdOutliner(stage)
    dialog.show()
    return dialog

def AnimateCamera():
    maya.cmds.setAttr("main_cam.readAnimatedValues", 1)
    maya.cmds.currentTime(1)
    maya.cmds.select('main_cam')
    maya.cmds.move(5, 121, 61)
    maya.cmds.rotate(-30, 5, 0)
    maya.cmds.setKeyframe('main_cam.translate')
    maya.cmds.setKeyframe('main_cam.rotate')
    
    maya.cmds.currentTime(10)
    maya.cmds.move(0, -1, 0, r=True)
    maya.cmds.rotate(0, -10, 0, r=True)
    maya.cmds.setKeyframe('main_cam.translate')
    maya.cmds.setKeyframe('main_cam.rotate')

def ExportLayoutAnimation():
    layer = GetLayoutLayer()
    for i in xrange(1, 11):
        maya.cmds.currentTime(i)
    layer.Export(os.path.join(ASSET_BASE, 'shots/s00_01/s00_01_layout.usd'))


maya.cmds.file(f=True, new=True)
LoadStage()
SetCurrentEditTarget()
AnimateCamera()