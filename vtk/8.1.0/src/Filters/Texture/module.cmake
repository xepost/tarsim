vtk_module(vtkFiltersTexture
  GROUPS
    StandAlone
  TEST_DEPENDS
    vtkRendering${VTK_RENDERING_BACKEND}
  KIT
    vtkFilters
  DEPENDS
    vtkCommonExecutionModel
  PRIVATE_DEPENDS
    vtkCommonCore
    vtkCommonDataModel
    vtkCommonTransforms
    vtkFiltersGeneral
  )