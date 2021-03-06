//============================================================================
//  Copyright (c) Kitware, Inc.
//  All rights reserved.
//  See LICENSE.txt for details.
//  This software is distributed WITHOUT ANY WARRANTY; without even
//  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
//  PURPOSE.  See the above copyright notice for more information.
//
//  Copyright 2014 National Technology & Engineering Solutions of Sandia, LLC (NTESS).
//  Copyright 2014 UT-Battelle, LLC.
//  Copyright 2014 Los Alamos National Security.
//
//  Under the terms of Contract DE-NA0003525 with NTESS,
//  the U.S. Government retains certain rights in this software.
//
//  Under the terms of Contract DE-AC52-06NA25396 with Los Alamos National
//  Laboratory (LANL), the U.S. Government retains certain rights in
//  this software.
//============================================================================

#ifndef vtk_m_filter_Histogram_h
#define vtk_m_filter_Histogram_h

#include <vtkm/filter/FilterField.h>

namespace vtkm
{
namespace filter
{
/// \brief Construct the histogram of a given Field
///
/// Construct a histogram with a default of 10 bins
///
class Histogram : public vtkm::filter::FilterField<Histogram>
{
public:
  //Construct a histogram with a default of 10 bins
  VTKM_CONT
  Histogram();

  VTKM_CONT
  void SetNumberOfBins(vtkm::Id count) { this->NumberOfBins = count; }

  VTKM_CONT
  vtkm::Id GetNumberOfBins() const { return this->NumberOfBins; }

  //Returns the bin delta of the last computed field, be it from DoExecute
  //or from MapField
  VTKM_CONT
  vtkm::Float64 GetBinDelta() const { return this->BinDelta; }

  //Returns the the min and max values for that last computed field
  VTKM_CONT
  vtkm::Range GetDataRange() const { return this->DataRange; }

  template <typename T, typename StorageType, typename DerivedPolicy, typename DeviceAdapter>
  VTKM_CONT vtkm::filter::Result DoExecute(const vtkm::cont::DataSet& input,
                                           const vtkm::cont::ArrayHandle<T, StorageType>& field,
                                           const vtkm::filter::FieldMetadata& fieldMeta,
                                           const vtkm::filter::PolicyBase<DerivedPolicy>& policy,
                                           const DeviceAdapter& tag);

private:
  vtkm::Id NumberOfBins;
  vtkm::Float64 BinDelta;
  vtkm::Range DataRange;
};

template <>
class FilterTraits<Histogram>
{ //currently the Histogram filter only works on scalar data.
  //this mainly has to do with getting the ranges for each bin
  //would require returning a more complex value type
public:
  typedef TypeListTagScalarAll InputFieldTypeList;
};
}
} // namespace vtkm::filter

#include <vtkm/filter/Histogram.hxx>

#endif // vtk_m_filter_Histogram_h
