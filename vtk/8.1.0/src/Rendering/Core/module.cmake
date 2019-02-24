vtk_module(vtkRenderingCore
  GROUPS
    Rendering
  TEST_DEPENDS
    vtkIOExodus
    vtkIOLegacy
    vtkIOParallel
    vtkIOXML
    vtkTestingCore
    vtkTestingRendering
    vtkRendering${VTK_RENDERING_BACKEND}
    vtkRenderingFreeType
    vtkRenderingAnnotation
    vtkInteractionStyle
    vtkImagingSources
    vtkFiltersSources
    vtkFiltersProgrammable
  KIT
    vtkRendering
  DEPENDS
    vtkCommonCore
    vtkCommonDataModel
    vtkCommonExecutionModel
    vtkCommonMath
    vtkFiltersCore
  PRIVATE_DEPENDS
    vtkCommonColor
    vtkCommonComputationalGeometry
    vtkCommonSystem
    vtkCommonTransforms
    vtkFiltersGeneral
    vtkFiltersGeometry
    vtkFiltersSources
    vtksys
  )
