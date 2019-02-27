vtk_module(vtkFiltersSources
  GROUPS
    StandAlone
  TEST_DEPENDS
    vtkTestingCore
    vtkTestingRendering
    vtkInteractionStyle
    vtkRendering${VTK_RENDERING_BACKEND}
    vtkFiltersModeling
    vtkFiltersVerdict
    vtkIOXML
    vtkIOParallel
  KIT
    vtkFilters
  DEPENDS
    vtkCommonDataModel
    vtkCommonExecutionModel
  PRIVATE_DEPENDS
    vtkCommonComputationalGeometry
    vtkCommonCore
    vtkCommonTransforms
    vtkFiltersCore
    vtkFiltersGeneral
  )