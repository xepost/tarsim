package require vtk

# this script tests vtkImageReslice with various axes permutations,
# in order to cover a nasty set of "if" statements that check
# the intersections of the raster lines with the input bounding box.

# Image pipeline
vtkImageReader reader
reader ReleaseDataFlagOff
reader SetDataByteOrderToLittleEndian
reader SetDataExtent 0 63 0 63 1 93
reader SetDataSpacing 3.2 3.2 1.5
reader SetFilePrefix "$VTK_DATA_ROOT/Data/headsq/quarter"
reader SetDataMask 0x7fff

vtkTransform transform
# rotate about the center of the image
transform Translate +100.8 +100.8 +69.0
transform RotateWXYZ 10 1 1 0
transform Translate -100.8 -100.8 -69.0

vtkImageReslice reslice1
reslice1 SetInputConnection [reader GetOutputPort]
reslice1 SetResliceAxesDirectionCosines 1 0 0  0 1 0  0 0 1
reslice1 SetResliceTransform transform
reslice1 SetOutputSpacing 3.2 3.2 3.2
reslice1 SetOutputExtent 0 74 0 74 0 0

vtkImageReslice reslice2
reslice2 SetInputConnection [reader GetOutputPort]
reslice2 SetResliceAxesDirectionCosines 0 1 0  0 0 1  1 0 0
reslice2 SetResliceTransform transform
reslice2 SetOutputSpacing 3.2 3.2 3.2
reslice2 SetOutputExtent 0 74 0 74 0 0

vtkImageReslice reslice3
reslice3 SetInputConnection [reader GetOutputPort]
reslice3 SetResliceAxesDirectionCosines 0 0 1  1 0 0  0 1 0
reslice3 SetResliceTransform transform
reslice3 SetOutputSpacing 3.2 3.2 3.2
reslice3 SetOutputExtent 0 74 0 74 0 0

vtkImageReslice reslice4
reslice4 SetInputConnection [reader GetOutputPort]
reslice4 SetResliceAxesDirectionCosines -1 0 0  0 -1 0  0 0 -1
reslice4 SetResliceTransform transform
reslice4 SetOutputSpacing 3.2 3.2 3.2
reslice4 SetOutputExtent 0 74 0 74 0 0

vtkImageReslice reslice5
reslice5 SetInputConnection [reader GetOutputPort]
reslice5 SetResliceAxesDirectionCosines 0 -1 0  0 0 -1  -1 0 0
reslice5 SetResliceTransform transform
reslice5 SetOutputSpacing 3.2 3.2 3.2
reslice5 SetOutputExtent 0 74 0 74 0 0

vtkImageReslice reslice6
reslice6 SetInputConnection [reader GetOutputPort]
reslice6 SetResliceAxesDirectionCosines 0 0 -1  -1 0 0  0 -1 0
reslice6 SetResliceTransform transform
reslice6 SetOutputSpacing 3.2 3.2 3.2
reslice6 SetOutputExtent 0 74 0 74 0 0

vtkImageMapper mapper1
  mapper1 SetInputConnection [reslice1 GetOutputPort]
  mapper1 SetColorWindow 2000
  mapper1 SetColorLevel 1000
  mapper1 SetZSlice 0

vtkImageMapper mapper2
  mapper2 SetInputConnection [reslice2 GetOutputPort]
  mapper2 SetColorWindow 2000
  mapper2 SetColorLevel 1000
  mapper2 SetZSlice 0

vtkImageMapper mapper3
  mapper3 SetInputConnection [reslice3 GetOutputPort]
  mapper3 SetColorWindow 2000
  mapper3 SetColorLevel 1000
  mapper3 SetZSlice 0

vtkImageMapper mapper4
  mapper4 SetInputConnection [reslice4 GetOutputPort]
  mapper4 SetColorWindow 2000
  mapper4 SetColorLevel 1000
  mapper4 SetZSlice 0

vtkImageMapper mapper5
  mapper5 SetInputConnection [reslice5 GetOutputPort]
  mapper5 SetColorWindow 2000
  mapper5 SetColorLevel 1000
  mapper5 SetZSlice 0

vtkImageMapper mapper6
  mapper6 SetInputConnection [reslice6 GetOutputPort]
  mapper6 SetColorWindow 2000
  mapper6 SetColorLevel 1000
  mapper6 SetZSlice 0

vtkActor2D actor1
  actor1 SetMapper mapper1

vtkActor2D actor2
  actor2 SetMapper mapper2

vtkActor2D actor3
  actor3 SetMapper mapper3

vtkActor2D actor4
  actor4 SetMapper mapper4

vtkActor2D actor5
  actor5 SetMapper mapper5

vtkActor2D actor6
  actor6 SetMapper mapper6

vtkRenderer imager1
  imager1 AddActor2D actor1
  imager1 SetViewport 0.0 0.0 0.3333 0.5

vtkRenderer imager2
  imager2 AddActor2D actor2
  imager2 SetViewport 0.0 0.5 0.3333 1.0

vtkRenderer imager3
  imager3 AddActor2D actor3
  imager3 SetViewport 0.3333 0.0 0.6667 0.5

vtkRenderer imager4
  imager4 AddActor2D actor4
  imager4 SetViewport 0.3333 0.5 0.6667 1.0

vtkRenderer imager5
  imager5 AddActor2D actor5
  imager5 SetViewport 0.6667 0.0 1.0 0.5

vtkRenderer imager6
  imager6 AddActor2D actor6
  imager6 SetViewport 0.6667 0.5 1.0 1.0

vtkRenderWindow imgWin
  imgWin AddRenderer imager1
  imgWin AddRenderer imager2
  imgWin AddRenderer imager3
  imgWin AddRenderer imager4
  imgWin AddRenderer imager5
  imgWin AddRenderer imager6
  imgWin SetSize 224 150

imgWin Render



