# ==============================================================================
# 1. Hello World - Creating Your First USD Stage
# 1. Hello World Redux - Using Generic Prims

from pxr import Usd

# help(Usd.Stage)

stage = ""
stage = Usd.Stage.CreateNew('HelloWorld.usda')
xform = stage.DefinePrim('/hello', 'Xform')
sphere = stage.DefinePrim('/hello/world', 'Sphere')

stage.GetRootLayer().Save()

# OR

from pxr import Usd, UsdGeom

stage = Usd.Stage.CreateNew('HelloWorld.usda')
xformPrim = UsdGeom.Xform.Define(stage, '/hello')
spherePrim = UsdGeom.Sphere.Define(stage, '/hello/world')
stage.GetRootLayer().Save()



# ==============================================================================
# 2. Inspecting and Authoring Properties

# section 1
from pxr import Usd, UsdGeom, Vt

stage = Usd.Stage.Open('HelloWorld.usda')
xform = stage.GetPrimAtPath('/hello')
sphere = stage.GetPrimAtPath('/hello/world')

# section 2 
expected = ['proxyPrim', 'purpose', 'visibility', 'xformOpOrder']
assert xform.GetPropertyNames() == expected
        
expected = ['doubleSided', 'extent', 'orientation',
            'primvars:displayColor', 'primvars:displayOpacity', 
            'proxyPrim', 'purpose', 'radius', 'visibility', 'xformOpOrder']
assert sphere.GetPropertyNames() == expected


# section 3
extentAttr = sphere.GetAttribute('extent')
expected = Vt.Vec3fArray([(-1, -1, -1), (1, 1, 1)])
assert extentAttr.Get() == expected

# section 4
radiusAttr = sphere.GetAttribute('radius')
radiusAttr.Set(2)
extentAttr.Set(extentAttr.Get() * 2)
print stage.GetRootLayer().ExportToString()

# section 5
from pxr import UsdGeom
sphereSchema = UsdGeom.Sphere(sphere)
color = sphereSchema.GetDisplayColorAttr()
color.Set([(0,0,1)])
print stage.GetRootLayer().ExportToString()
stage.GetRootLayer().Save()

# ==============================================================================
# 3. Referencing Layers

from pxr import Usd, UsdGeom

stage = Usd.Stage.Open('HelloWorld.usda')
# XXX: save the usd file to the local directory where the test
# is being administered so RefExample will have access to it
stage.Export('HelloWorld.usda')
hello = stage.GetPrimAtPath('/hello')
stage.SetDefaultPrim(hello)
UsdGeom.XformCommonAPI(hello).SetTranslate((4, 5, 6))
print stage.GetRootLayer().ExportToString()
stage.GetRootLayer().Save()

# Create an over on which to create our reference.
refStage = Usd.Stage.CreateNew('RefExample.usda')
refSphere = refStage.OverridePrim('/refSphere')
print refStage.GetRootLayer().ExportToString()

# Reference in the layer.
refSphere.GetReferences().AddReference('./HelloWorld.usda')
print refStage.GetRootLayer().ExportToString()
refStage.GetRootLayer().Save()

# Clear out any authored transformation over the reference.
refXform = UsdGeom.Xformable(refSphere)
refXform.SetXformOpOrder([])
print refStage.GetRootLayer().ExportToString()

# Reference in the layer again, on another over.
refSphere2 = refStage.OverridePrim('/refSphere2')
refSphere2.GetReferences().AddReference('./HelloWorld.usda')
print refStage.GetRootLayer().ExportToString()
refStage.GetRootLayer().Save()

# Author displayColor on a namespace descendant of the referenced prim.
overSphere = UsdGeom.Sphere.Get(refStage, '/refSphere2/world' )
overSphere.GetDisplayColorAttr().Set( [(1, 0, 0)] )
print refStage.GetRootLayer().ExportToString()
refStage.GetRootLayer().Save()

# Print the final composed results.
print refStage.ExportToString()

'''
# file: RefExample.usda

#usda 1.0

over "refSphere" (
    prepend references = @./HelloWorld.usda@
)
{
    uniform token[] xformOpOrder = []
}

over "refSphere2" (
    prepend references = @./HelloWorld.usda@
)
{
    over "world"
    {
        color3f[] primvars:displayColor = [(1, 0, 0)]
    }
}

# is equal to:

#usda 1.0
(
    doc = """Generated from Composed Stage of root layer D:\\_madoodia_\\pixar_usd\\USD\\RefExample.usda
"""
)

def Xform "refSphere"
{
    double3 xformOp:translate = (4, 5, 6)
    uniform token[] xformOpOrder = []

    def Sphere "world"
    {
        float3[] extent = [(-2, -2, -2), (2, 2, 2)]
        color3f[] primvars:displayColor = [(0, 0, 1)]
        double radius = 2
    }
}

def Xform "refSphere2"
{
    double3 xformOp:translate = (4, 5, 6)
    uniform token[] xformOpOrder = ["xformOp:translate"]

    def Sphere "world"
    {
        float3[] extent = [(-2, -2, -2), (2, 2, 2)]
        color3f[] primvars:displayColor = [(1, 0, 0)]
        double radius = 2
    }
}

'''








# ==============================================================================
# 4. Converting Between Layer Formats

# A. Converting .usda <-> .usdc Formats:

# $ cd examples\extras\usd\tutorials\convertingLayerFormats
# $ usdcat -o NewSphere.usdc Sphere.usda
# or
# $ usdcat -o NewSphere.usda NewSphere.usdc
# $ usddiff NewSphere.usdc NewSphere.usda

# B. Converting .usd(Binary) <-> .usd(Ascii) :

# $ usdcat -o NewSphere_binary.usd --usdFormat usdc Sphere.usd

# We can then verify the contents of this binary .usd file match the contents of the original text .usd file:
# $ usddiff Sphere.usd NewSphere_binary.usd

# Converting a binary .usd file to a text .usd file and verifying the contents match can be done in the same way:
# $ usdcat -o NewSphere_text.usd --usdFormat usda NewSphere_binary.usd
# $ usddiff NewSphere_binary.usd NewSphere_text.usd


# ==============================================================================
# 5. Traversing a Stage

# Open RefExample.usda in usdview and bring up the interpreter by hitting i or the Window --> Interpreter menu item.
# >>> [x for x in usdviewApi.stage.Traverse()]
# >>> [x for x in usdviewApi.stage.Traverse() if UsdGeom.Sphere(x)]

# >>> treeItr = iter(Usd.PrimRange.PreAndPostVisit(usdviewApi.stage.GetPseudoRoot()))
# >>> for x in treeItr: print x, treeItr.IsPostVisit()

from pxr import Usd, UsdGeom

# section 1
stage = Usd.Stage.Open("RefExample.usda")
assert([x for x in stage.Traverse()] == [stage.GetPrimAtPath("/refSphere"), 
    stage.GetPrimAtPath("/refSphere/world"), stage.GetPrimAtPath("/refSphere2"), 
    stage.GetPrimAtPath("/refSphere2/world")])

# section 2
assert([x for x in stage.Traverse() if UsdGeom.Sphere(x)] == 
        [stage.GetPrimAtPath("/refSphere/world"), 
         stage.GetPrimAtPath("/refSphere2/world")])

# section 3
treeIter = iter(Usd.PrimRange.PreAndPostVisit(stage.GetPseudoRoot()))
    
treeIterExpectedResults = [(stage.GetPrimAtPath("/"), False),
        (stage.GetPrimAtPath("/refSphere"), False),
        (stage.GetPrimAtPath("/refSphere/world"), False),
        (stage.GetPrimAtPath("/refSphere/world"), True),
        (stage.GetPrimAtPath("/refSphere"), True),
        (stage.GetPrimAtPath("/refSphere2"), False),
        (stage.GetPrimAtPath("/refSphere2/world"), False),
        (stage.GetPrimAtPath("/refSphere2/world"), True),
        (stage.GetPrimAtPath("/refSphere2"), True),
        (stage.GetPrimAtPath("/"), True)]

treeIterActualResults = [(x, treeIter.IsPostVisit()) for x in treeIter]
assert treeIterExpectedResults == treeIterActualResults

# section 4
# Deactivate the prim as we would in usdview
ref2Prim = stage.GetPrimAtPath('/refSphere2')
stage.SetEditTarget(stage.GetSessionLayer())
Usd.Prim.SetActive(ref2Prim, False)

assert ([x for x in stage.Traverse()] == [stage.GetPrimAtPath("/refSphere"), 
    stage.GetPrimAtPath("/refSphere/world")])


# ==============================================================================
# 6. Authoring Variants



from pxr import Usd, UsdGeom

stage = Usd.Stage.Open('HelloWorld.usda')

# Clear local opinion, which alwauys wins over variants.
colorAttr = UsdGeom.Gprim.Get(stage, '/hello/world').GetDisplayColorAttr()
colorAttr.Clear()
print stage.GetRootLayer().ExportToString()

# Create variant set.
rootPrim = stage.GetPrimAtPath('/hello')
vset = rootPrim.GetVariantSets().AddVariantSet('shadingVariant')
print stage.GetRootLayer().ExportToString()

# Create variant options.
vset.AddVariant('red')
vset.AddVariant('blue')
vset.AddVariant('green')
print stage.GetRootLayer().ExportToString()

# Author red color behind red variant.
vset.SetVariantSelection('red')
with vset.GetVariantEditContext():
    colorAttr.Set([(1,0,0)])
print stage.GetRootLayer().ExportToString()

vset.SetVariantSelection('blue')
with vset.GetVariantEditContext():
    colorAttr.Set([(0,0,1)])
vset.SetVariantSelection('green')
with vset.GetVariantEditContext():
    colorAttr.Set([(0,1,0)])
print stage.GetRootLayer().ExportToString()

stage.GetRootLayer().Export('HelloWorldWithVariants.usda')

# Print composed results-- note that variants get flattened away.
print stage.ExportToString(False)



# ==============================================================================
# 7. Generating New Schema Classes

# $ cd $ examples\extras\usd\examples\usdSchemaExamples
# $ usdGenSchema schema.usda

# Make a Test.usda file:
'''
#usda 1.0

def ComplexPrim "Complex"
{
    string complexString = "a really complex string"
	int intAttr = 10
	add rel target = </Object>
}

def Xform "Object" (
    prepend apiSchema = ["ParamsAPI"]
)
{
    custom double params:mass = 1.0;
    custom double params:velocity = 10.0;
    custom double params:volume = 4.0;
}

'''

from pxr import Usd, UsdSchemaExamples
stage = Usd.Stage.Open("Test.usda")
cp = stage.GetPrimAtPath("/Complex")
simple = UsdSchemaExamples.Simple(cp)
target = simple.GetTargetRel()
intAttr = simple.GetIntAttrAttr()
complex = UsdSchemaExamples.Complex(cp)
print 'complexString: %s' % complex.GetComplexStringAttr().Get()
obj = stage.GetPrimAtPath("/Object")
paramsAPI = UsdSchemaExamples.ParamsAPI.Apply(obj);
assert obj.HasAPI(UsdSchemaExamples.ParamsAPI)
print 'mass: %s' % paramsAPI.GetMassAttr().Get()
print 'velocity: %s' % paramsAPI.GetVelocityAttr().Get()
print 'volume: %s' % paramsAPI.GetVolumeAttr().Get()

# ==============================================================================
# 8. End to End Example

# 
# A. Create Assets

# $ cd examples\extras\usd\tutorials\endToEnd

# $ python scripts/create_asset.py Ball --shadingVariantLayer -o models/Ball

# $ python scripts/create_asset.py Table -o models/Table

'''
Creates an asset file that consists of a top level layer and sublayers for
shading and geometry.
'''

import os
from pxr import Kind, Sdf, Usd, UsdGeom

def main():
    import optparse

    descr = __doc__.strip()
    usage = 'usage: %prog [options] asset'
    parser = optparse.OptionParser(description=descr, usage=usage)
    parser.add_option('-k', '--kind', default=Kind.Tokens.component,
                      help="sets asset's model kind")
    parser.add_option('-o', '--outputDir',
            help='directory to create assets.  if none specified, will use modelName.')
    parser.add_option('-s', '--shadingVariantLayer',
            help='add <asset>.shadingVariants.usda to model references.', default=False,
            action='store_true')
    parser.add_option('-f', '--force', default=False, action='store_true',
            help='if False, this will error if [outputDir] exists')
    options, args = parser.parse_args()

    if len(args) != 1:
        parser.error("No asset specified")

    asset = args[0]
    force = options.force

    outputDir = options.outputDir
    if not outputDir:
        outputDir = asset

    if os.path.exists(outputDir):
        if not force:
            parser.error('outputDir "%s" exists.  Use -f to override' % outputDir)
    else:
        os.makedirs(outputDir)

    _CreateAsset(asset, outputDir, options.kind, options.shadingVariantLayer)

def _CreateAsset(assetName, assetDir, assetKind, addShadingVariantLayer):
    assetFilePath = os.path.join(assetDir, '%s.usd' % assetName)

    print "Creating asset at %s" % assetFilePath
    # Make the layer ascii - good for readability, plus the file is small
    rootLayer = Sdf.Layer.CreateNew(assetFilePath, args = {'format':'usda'})
    assetStage = Usd.Stage.Open(rootLayer)

    # Define a prim for the asset and make it the default for the stage.
    assetPrim = UsdGeom.Xform.Define(assetStage, '/%s' % assetName).GetPrim()
    assetStage.SetDefaultPrim(assetPrim)
    # Lets viewing applications know how to orient a free camera properly
    UsdGeom.SetStageUpAxis(assetStage, UsdGeom.Tokens.y)

    # Usually we will "loft up" the kind authored into the exported geometry
    # layer rather than re-stamping here; we'll leave that for a later
    # tutorial, and just be explicit here.
    model = Usd.ModelAPI(assetPrim)
    if assetKind:
        model.SetKind(assetKind)

    model.SetAssetName(assetName)
    model.SetAssetIdentifier('%s/%s.usd' % (assetName, assetName))

    refs = []
    if addShadingVariantLayer:
        # if we're going to add it, then shading is stronger than geom and needs
        # to be added first
        refs.append('./%s.shadingVariants.usda' % assetName)

    refs.append('./%s.maya.usd' % assetName)

    _CreateAndReferenceLayers(assetPrim, assetDir, refs)

    assetStage.GetRootLayer().Save()

def _CreateAndReferenceLayers(assetPrim, assetDir, refs):
    from pxr import Usd
    for refLayerPath in refs:
        referencedStage = Usd.Stage.CreateNew(os.path.join(assetDir, refLayerPath))
        referencedAssetPrim = referencedStage.DefinePrim(assetPrim.GetPath())
        referencedStage.SetDefaultPrim(referencedAssetPrim)
        referencedStage.GetRootLayer().Save()

        assetPrim.GetReferences().AddReference(refLayerPath)

    # If you want to print things out, you can do:
    #print rootLayer.ExportToString()

if __name__ == '__main__':
    main()

# 
# B. Maya

# 
# C. Shading Variants

# $ python tutorial_scripts/add_shadingVariants.py

# $ usdview models/Ball/Ball.usd

'''
This script adds shading to the models at:

    models/
      Ball/

This script will change the texture path to point to different textures (though
we only ship textures for '1', '9', '8', '4').  We also set the displayColor in
the shadingVariants.

'''
import os
ASSET_BASE = os.path.join(os.getcwd(), 'models')

def main():
    from pxr import Usd
    stage = Usd.Stage.CreateNew(os.path.join(
        ASSET_BASE, 
        'Ball/Ball.shadingVariants.usda'))
    stage.GetRootLayer().defaultPrim = 'Ball'
    _AddShadingToBall(stage)
    stage.GetRootLayer().Save()

def _AddShadingToBall(stage):
    from pxr import Sdf, UsdRi
    model = stage.OverridePrim('/Ball')
    texDir =  os.path.join(ASSET_BASE, 'Ball/tex')
    mesh = stage.OverridePrim('/Ball/mesh')

    ballTextureNode = UsdRi.RisObject(stage.OverridePrim(
        model.GetPath().AppendPath('Looks/BallMaterial/BallTexture')))

    # now we'll show adding some shading variants to the ball as well.
    shadingVariantsInfo = [
        ('Cue', '', _Color(0.996, 0.992, 0.874)), # white

        ('Ball_1', '', _Color(1.000, 0.929, 0.184)), # yellow
        ('Ball_2', '', _Color(0.157, 0.243, 0.631)), # blue
        ('Ball_3', '', _Color(0.976, 0.212, 0.141)), # red
        ('Ball_4', '', _Color(0.250, 0.156, 0.400)), # purple
        ('Ball_5', '', _Color(0.980, 0.498, 0.184)), # orange
        ('Ball_6', '', _Color(0.050, 0.255, 0.239)), # green
        ('Ball_7', '', _Color(0.607, 0.059, 0.094)), # darkred

        ('Ball_8', '', _Color(0.122, 0.118, 0.110)), # black

        ('Ball_9',  'striped', _Color(1.000, 0.929, 0.184)), # yellow
        ('Ball_10', 'striped', _Color(0.157, 0.243, 0.631)), # blue
        ('Ball_11', 'striped', _Color(0.976, 0.212, 0.141)), # red
        ('Ball_12', 'striped', _Color(0.250, 0.156, 0.400)), # purple
        ('Ball_13', 'striped', _Color(0.980, 0.498, 0.184)), # orange
        ('Ball_14', 'striped', _Color(0.050, 0.255, 0.239)), # green
        ('Ball_15', 'striped', _Color(0.607, 0.059, 0.094)), # darkred
    ]


    # create the shadingVariant variantSet
    shadingVariant = model.GetVariantSets().AddVariantSet('shadingVariant')
    for variantName, decoration, color in shadingVariantsInfo:
        # creates a variant inside 'shadingVariant'
        shadingVariant.AddVariant(variantName)

        # switch to that variant
        shadingVariant.SetVariantSelection(variantName)

        # this 'with' construct here tells Usd that authoring operations should
        # write to the shadingVariant.
        with shadingVariant.GetVariantEditContext():
            whichBall = variantName.split('_')[-1]
            texPath = os.path.join(texDir, 'ball%s.tex' % whichBall)
            # in the current variant, modify the color
            _SetParameters(ballTextureNode, [
                ('filename', Sdf.ValueTypeNames.String, texPath),
            ])

            # set the display color for hydra
            _SetDisplayColor(mesh, color)

            # currently not doing anything with decoration, but we could maybe
            # use this to make the solid vs. stripes.

    # now make the variant selection 'Cue' instead of the last variant that we
    # created above.
    shadingVariant.SetVariantSelection('Cue')

def _SetParameters(shadingNode, params):
    '''
    shadingNode is a RisObject
    params are (paramName, paramType, value) tuples
    '''

    for paramName, paramType, value in params:
        shadingNode.CreateInput(paramName, paramType).Set(value)

def _Color(r, g, b):
    # for this tutorial, the colors i got are not in linear space.
    from pxr import Gf
    return Gf.ConvertDisplayToLinear(Gf.Vec3f(r, g, b))

def _SetDisplayColor(mesh, color):
    from pxr import UsdGeom

    # DisplayColor is actually an array.  Here, we just author one color which
    # applies to the whole mesh.
    UsdGeom.Gprim(mesh).CreateDisplayColorAttr([color])

if __name__ == '__main__':
    main()

# 
# D. Set dressing

# $ python tutorial_scripts/create_Room_set.py
# $ usdview models/Room_set/Room_set.usd


'''
This script assumes you have models at

  models/
    Ball/
    Table/

It will create a new "set" (aggregate) model, Room_set at

  models/Room_set

'''

import os
ASSET_BASE = os.path.join(os.getcwd(), 'models')
TABLE_HEIGHT = 74.5
BALL_RADIUS = 5.715 * 0.5

def main():
    from pxr import Kind, Usd, UsdGeom

    setFilePath = os.path.join(ASSET_BASE, 'Room_set/Room_set.usd')

    # Create the model stage, the model prim, and also make the modelPrim the
    # default prim so that the layer can be referenced without specifying a
    # root path.
    stage = Usd.Stage.CreateNew(setFilePath)
    setModelPrim = UsdGeom.Xform.Define(stage, '/Room_set').GetPrim()
    stage.SetDefaultPrim(setModelPrim)

    # Lets viewing applications know how to orient a free camera properly
    UsdGeom.SetStageUpAxis(stage, UsdGeom.Tokens.y)

    # Models can have a "kind" which can be used to categorize models into
    # different types.  This is useful for other applications to reason about
    # the model hierarchy.
    Usd.ModelAPI(setModelPrim).SetKind(Kind.Tokens.assembly)

    # add child models to our set.
    _AddModel(stage, '/Room_set/Furniture/Table', 'Table/Table.usd')

    ballNumber = 0

    import math
    for row in xrange(5):

        tableX = 10 + row * 2 * BALL_RADIUS * math.cos(math.pi/6)
        tableRowZ = -row * BALL_RADIUS
        numBallsInRow = row + 1

        for i in xrange(numBallsInRow):
            ballNumber += 1

            b = _AddModel(
                stage, 
                '/Room_set/Props/Ball_%d' % ballNumber, 
                'Ball/Ball.usd')

            # tableX and tableZ will arrange the balls into a triangle.
            tableZ = tableRowZ + i * 2 * BALL_RADIUS
            ballXlate = (tableX, TABLE_HEIGHT + BALL_RADIUS, tableZ)

            # Apply the UsdGeom.Xformable schema to the model, and then set the
            # transformation.
            # We are only going to translate the balls, but we still use
            # the helper XformCommonAPI schema to  instantiate a translate op.
            # XformCommonAPI helps ensure transform ops are interchangeable 
            # between applications, when you can make do with SRT + pivot
            UsdGeom.XformCommonAPI(b).SetTranslate(ballXlate)

            # we conveniently named the shadingVariant the same as the name of
            # the ball.
            shadingVariantName = b.GetName()

            # get the variantSet "shadingVariant" and then set it accordingly.
            vs = b.GetVariantSets().GetVariantSet('shadingVariant')
            vs.SetVariantSelection(shadingVariantName)

    stage.GetRootLayer().Save()
    
def _AddModel(stage, path, refPath):
    '''
    Adds a reference to refPath at the given path in the stage.  This will make
    sure the model hierarchy is maintained by ensuring that all ancestors of
    the path have "kind" set to "group".

    returns the referenced model.
    '''

    from pxr import Kind, Sdf, Usd, UsdGeom

    # convert path to an Sdf.Path which has several methods that are useful
    # when working with paths.  We use GetPrefixes() here which returns a list
    # of all the prim prefixes for a given path.  
    path = Sdf.Path(path)
    for prefixPath in path.GetPrefixes()[1:-1]:
        parentPrim = stage.GetPrimAtPath(prefixPath)
        if not parentPrim:
            parentPrim = UsdGeom.Xform.Define(stage, prefixPath).GetPrim()
            Usd.ModelAPI(parentPrim).SetKind(Kind.Tokens.group)
    
    # typeless def here because we'll be getting the type from the prim that
    # we're referencing.
    m = stage.DefinePrim(path)
    m.GetReferences().AddReference(os.path.join(ASSET_BASE, refPath))
    return m

if __name__ == '__main__':
    main()

# 
# E. Shot Work

# 
# F. Sequence/Shot setup

# $ usdcat assets/shot.usd
# $ python scripts/create_shot.py s00 -o shots/s00 -b ../../assets/shot.usd
# $ python scripts/create_shot.py s00_01 -o shots/s00_01 -b ../s00/s00.usda

'''
Creates a shot with separate layers for departments.  

'''

import os
def main():
    import optparse

    descr = __doc__.strip()
    usage = 'usage: %prog [options] shot'
    parser = optparse.OptionParser(description=descr, usage=usage)
    parser.add_option('-b', '--baseLayer', 
            help='this will be added verbatim in the subLayerPaths.')
    parser.add_option('-o', '--outputDir',
            help='directory to create shot.  if none specified, will use shotName.')

    parser.add_option('-f', '--force', default=False, action='store_true',
            help='if False, this will error if [outputDir] exists')
    options, args = parser.parse_args()

    if len(args) != 1:
        parser.error("No shot specified")

    shot = args[0]
    force = options.force

    outputDir = options.outputDir
    if not outputDir:
        outputDir = shot

    if os.path.exists(outputDir):
        if not force:
            parser.error('outputDir "%s" exists.  Use -f to override' % outputDir)
    else:
        os.makedirs(outputDir)

    _CreateShot(shot, outputDir, options.baseLayer)

def _CreateShot(shotName, shotDir, baseLayer):
    shotFilePath = os.path.join(shotDir, '%s.usda' % shotName)

    from pxr import Usd, UsdGeom
    shotStage = Usd.Stage.CreateNew(shotFilePath)
    print "Creating shot at %s" % shotFilePath

    _CreateAndAddSubLayers(shotStage, shotName, shotDir, [
        './%s_sim.usda' % shotName,
        './%s_anim.usda' % shotName,
        './%s_layout.usda' % shotName,
        './%s_sets.usda' % shotName,
        ])

    if baseLayer:
        shotStage.GetRootLayer().subLayerPaths.append(baseLayer)

    # Lets viewing applications know how to orient a free camera properly
    UsdGeom.SetStageUpAxis(shotStage, UsdGeom.Tokens.y)
    shotStage.GetRootLayer().Save()

def _CreateAndAddSubLayers(stage, shotName, shotDir, subLayers):
    # We use the Sdf API here to quickly create layers.  Also, we're using it
    # as a way to author the subLayerPaths as there is no way to do that
    # directly in the Usd API.

    from pxr import Sdf
    rootLayer = stage.GetRootLayer()
    for subLayerPath in subLayers:
        Sdf.Layer.CreateNew(os.path.join(shotDir, subLayerPath))
        rootLayer.subLayerPaths.append(subLayerPath)

    # If you want to print things out, you can do:
    #print rootLayer.ExportToString()

if __name__ == '__main__':
    main()


# 
# G. Simple shot work

# $ python tutorial_scripts/add_set_to_s00.py
# $ usdview shots/s00/s00.usd

import os
ASSET_BASE = os.path.join('../../', 'models')

def main():
    sequenceFilePath = 'shots/s00/s00.usda'
    setsLayoutLayerFilePath = 'shots/s00/s00_sets.usda'

    from pxr import Kind, Usd, UsdGeom, Sdf
    stage = Usd.Stage.Open(sequenceFilePath)

    # we use Sdf, a lower level library, to obtain the 'sets' layer.
    workingLayer = Sdf.Layer.FindOrOpen(setsLayoutLayerFilePath)
    assert stage.HasLocalLayer(workingLayer)

    # this makes the workingLayer the target for authoring operations by the
    # stage.
    stage.SetEditTarget(workingLayer)

    # Make sure the model-parents we need are well-specified
    Usd.ModelAPI(UsdGeom.Xform.Define(stage, '/World')).SetKind(Kind.Tokens.group)
    Usd.ModelAPI(UsdGeom.Xform.Define(stage, '/World/sets')).SetKind(Kind.Tokens.group)
    
    # in previous examples, we've been using GetReferences().AddReference(...).  The
    # following uses .SetItems() instead which lets us explicitly set (replace)
    # the references at once instead of adding.
    stage.DefinePrim('/World/sets/Room_set').GetReferences().SetReferences([
        Sdf.Reference(os.path.join(ASSET_BASE, 'Room_set/Room_set.usd'))])

    stage.GetEditTarget().GetLayer().Save()

    print '==='
    print 'usdview %s' % sequenceFilePath
    print 'usdcat %s' % setsLayoutLayerFilePath

if __name__ == '__main__':
    main()


# $ python tutorial_scripts/layout_shot_s00_01.py


import os
ASSET_BASE = os.path.join(os.getcwd(), 'models')
TABLE_HEIGHT = 74.5
BALL_RADIUS = 5.715 * 0.5

def main():
    shotFilePath = 'shots/s00_01/s00_01.usda'
    layoutLayerFilePath = 'shots/s00_01/s00_01_layout.usda'

    from pxr import Usd, Sdf
    stage = Usd.Stage.Open(shotFilePath)

    # set the timeCode range for the shot that other applications can use.
    stage.SetStartTimeCode(1)
    stage.SetEndTimeCode(10)

    # we use Sdf, a lower level library, to obtain the 'layout' layer.
    workingLayer = Sdf.Layer.FindOrOpen(layoutLayerFilePath)
    assert stage.HasLocalLayer(workingLayer)

    # this makes the workingLayer the target for authoring operations by the
    # stage.
    stage.SetEditTarget(workingLayer)

    _SetupBilliards(stage)
    _MoveCamera(stage)

    stage.GetEditTarget().GetLayer().Save()

    print '==='
    print 'usdview %s' % shotFilePath
    print 'usdcat %s' % layoutLayerFilePath

def _SetupBilliards(stage):
    from pxr import Kind, Sdf, Usd, UsdGeom

    # Make sure the model-parents we need are well-specified
    Usd.ModelAPI(UsdGeom.Xform.Define(stage, '/World')).SetKind(Kind.Tokens.group)
    Usd.ModelAPI(UsdGeom.Xform.Define(stage, '/World/anim')).SetKind(Kind.Tokens.group)
    # in previous examples, we've been using GetReferences().AddReference(...).  The
    # following uses .SetItems() instead which lets us explicitly set (replace)
    # the references at once instead of adding.
    cueBall = stage.DefinePrim('/World/anim/CueBall')
    cueBall.GetReferences().SetReferences([
        Sdf.Reference(os.path.join(ASSET_BASE, 'Ball/Ball.usd'))])

    # deactivate everything that isn't 8, 9, 1, 4.  We accumulate the prims we
    # want to deactivate so that we don't delete while iterating.
    roomProps = stage.GetPrimAtPath('/World/sets/Room_set/Props')
    keepers = set(['Ball_%d' % i for i in [1, 9, 8, 4] ])
    toDeactivate = []
    for child in roomProps.GetChildren():
        if child.GetName() not in keepers:
            toDeactivate.append(child)
    for prim in toDeactivate:
        prim.SetActive(False)

    # the offset values are relative to the radius of the ball
    def _MoveBall(ballPrim, offset):
        translation = (offset[0] * BALL_RADIUS,
                       TABLE_HEIGHT + BALL_RADIUS,
                       offset[1] * BALL_RADIUS)

        # Apply the UsdGeom.Xformable schema to the model, and then set the
        # transformation.  Note we can use ordinary python tuples
        from pxr import UsdGeom
        UsdGeom.XformCommonAPI(ballPrim).SetTranslate(translation)

    # all these values are just eye-balled and are relative to Ball_1.
    _MoveBall(cueBall, (1.831,  4.331))
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_2'), (0.000,  0.000))
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_10'), (2.221,  1.119))
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_1'), (3.776,  0.089))
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_4'), (5.453, -0.543))

def _MoveCamera(stage):
    from pxr import UsdGeom, Gf
    cam = UsdGeom.Camera.Get(stage, '/World/main_cam')

    # the camera derives from UsdGeom.Xformable so we can 
    # use the XformCommonAPI on it, too, and see how rotations are handled
    xformAPI = UsdGeom.XformCommonAPI(cam)
    xformAPI.SetTranslate( (8, 120, 8) )
    # -86 degree rotation around X axis.  Can specify rotation order as
    # optional parameter
    xformAPI.SetRotate( (-86, 0, 0 ) )

if __name__ == '__main__':
    main()



# $ python tutorial_scripts/anim_shot_s00_01.py


def main():
    shotFilePath = 'shots/s00_01/s00_01.usda'
    animLayerFilePath = 'shots/s00_01/s00_01_anim.usda'

    from pxr import Usd, Sdf
    stage = Usd.Stage.Open(shotFilePath)

    # set the timeCode range for the shot that other applications can use.
    stage.SetStartTimeCode(1)
    stage.SetEndTimeCode(10)

    stage.GetRootLayer().Save()

    # we use Sdf, a lower level library, to obtain the 'anim' layer.
    workingLayer = Sdf.Layer.FindOrOpen(animLayerFilePath)
    assert stage.HasLocalLayer(workingLayer)

    # this makes the workingLayer the target for authoring operations by the
    # stage.
    stage.SetEditTarget(workingLayer)

    _AnimateBilliards(stage)

    stage.GetEditTarget().GetLayer().Save()

    print '==='
    print 'usdview %s' % shotFilePath
    print 'usdcat %s' % animLayerFilePath

def _AnimateBilliards(stage):
    _MoveBall(stage.GetPrimAtPath('/World/anim/CueBall'), (1, 0), 40)
    #_MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_2'), (0, 0), 0.0)
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_10'), (0, -1), 20)
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_1'), (1, -1), 5)
    _MoveBall(stage.GetPrimAtPath('/World/sets/Room_set/Props/Ball_4'), (1, -0.5), 3.6)

def _MoveBall(ball, direction, speed):

    from pxr import Usd, UsdGeom, Gf
    v = Gf.Vec2d(*direction).GetNormalized() * speed
    xformAPI = UsdGeom.XformCommonAPI(ball)
    # Here we make use of GfVec3d rather than plain tuples so we can
    # add vectors, and demonstrate the API (all Usd API's) will accept either.
    # GetXformVectors() returns a tuple of 
    # (translation, rotation, scale, pivot, rotationOrder), from which we
    # extract the first element, the translation
    start = xformAPI.GetXformVectors(Usd.TimeCode.Default())[0]
    end = start + Gf.Vec3d(v[0], 0, v[1])

    # set keyframe for frame 1 and frame 10.
    xformAPI.SetTranslate(start, 1)
    xformAPI.SetTranslate(end, 10)
    xformAPI.SetRotate(speed * Gf.Vec3f(3.7,  13.9, 91.34))
    
if __name__ == '__main__':
    main()




# ==============================================================================
# 9.  Transformations, Time-sampled Animation, and Layer Offsets

# A. Static Geometry

# B. Moving Objects with Animated Transformations: Spinning the Top


from pxr import Usd, UsdGeom, Gf, Sdf

def MakeInitialStage(path):
    stage = Usd.Stage.CreateNew(path)
    UsdGeom.SetStageUpAxis(stage, UsdGeom.Tokens.z)
    stage.SetStartTimeCode(0)
    stage.SetEndTimeCode(192)
    return stage
def Step1():
    stage = MakeInitialStage('Step1.usda')
    stage.SetMetadata('comment', 'Step 1: Start and end time codes')
    stage.Save()

def AddReferenceToGeometry(stage, path):
    geom = UsdGeom.Xform.Define(stage, path)
    geom.GetPrim().GetReferences().AddReference('./top.geom.usd')
    return geom
def Step2():
    stage = MakeInitialStage('Step2.usda')
    stage.SetMetadata('comment', 'Step 2: Geometry reference')
    top = AddReferenceToGeometry(stage, '/Top')
    stage.Save()

def AddSpin(top):
    spin = top.AddRotateZOp(opSuffix='spin')
    spin.Set(time=0, value=0)
    spin.Set(time=192, value=1440)
def Step3():
    stage = MakeInitialStage('Step3.usda')
    stage.SetMetadata('comment', 'Step 3: Adding spin animation')
    top = AddReferenceToGeometry(stage, '/Top')
    AddSpin(top)
    stage.Save()

def AddTilt(top):
    tilt = top.AddRotateXOp(opSuffix='tilt')
    tilt.Set(value=12)
def Step4():
    stage = MakeInitialStage('Step4.usda')
    stage.SetMetadata('comment', 'Step 4: Adding tilt')
    top = AddReferenceToGeometry(stage, '/Top')
    AddTilt(top)
    AddSpin(top)
    stage.Save()

def AddOffset(top):
    top.AddTranslateOp(opSuffix='offset').Set(value=(0, 0.1, 0))
def AddPrecession(top):
    precess = top.AddRotateZOp(opSuffix='precess')
    precess.Set(time=0, value=0)
    precess.Set(time=192, value=360)
def Step5():
    stage = MakeInitialStage('Step5.usda')
    stage.SetMetadata('comment', 'Step 5: Adding precession and offset')
    top = AddReferenceToGeometry(stage, '/Top')
    AddPrecession(top)
    AddOffset(top)
    AddTilt(top)
    AddSpin(top)
    stage.Save()

def Step6():
    # Use animated layer from Step5
    anim_layer_path = './Step5.usda'

    stage = MakeInitialStage('Step6.usda')
    stage.SetMetadata('comment', 'Step 6: Layer offsets and animation')

    left = UsdGeom.Xform.Define(stage, '/Left')
    left_top = UsdGeom.Xform.Define(stage, '/Left/Top')
    left_top.GetPrim().GetReferences().AddReference(
        assetPath = anim_layer_path,
        primPath = '/Top')

    middle = UsdGeom.Xform.Define(stage, '/Middle')
    middle.AddTranslateOp().Set(value=(2, 0, 0))
    middle_top = UsdGeom.Xform.Define(stage, '/Middle/Top')
    middle_top.GetPrim().GetReferences().AddReference(
        assetPath = anim_layer_path,
        primPath = '/Top',
        layerOffset = Sdf.LayerOffset(offset=96))

    right = UsdGeom.Xform.Define(stage, '/Right')
    right.AddTranslateOp().Set(value=(4, 0, 0))
    right_top = UsdGeom.Xform.Define(stage, '/Right/Top')
    right_top.GetPrim().GetReferences().AddReference(
        assetPath = anim_layer_path,
        primPath = '/Top',
        layerOffset = Sdf.LayerOffset(scale=0.25))

    stage.Save()

if __name__ == '__main__':
    Step1()
    Step2()
    Step3()
    Step4()
    Step5()
    Step6()


# stageTime = layerTime * scale + offset



# ==============================================================================
# 10. 
