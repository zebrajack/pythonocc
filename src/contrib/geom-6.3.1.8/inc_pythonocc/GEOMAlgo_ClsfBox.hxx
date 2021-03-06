//  Copyright (C) 2007-2008  CEA/DEN, EDF R&D, OPEN CASCADE
//
//  Copyright (C) 2003-2007  OPEN CASCADE, EADS/CCR, LIP6, CEA/DEN,
//  CEDRAT, EDF R&D, LEG, PRINCIPIA R&D, BUREAU VERITAS
//
//  This library is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License.
//
//  This library is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with this library; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
//
//  See http://www.salome-platform.org/ or email : webmaster.salome@opencascade.com
//
#ifndef _GEOMAlgo_ClsfBox_HeaderFile
#define _GEOMAlgo_ClsfBox_HeaderFile

#ifndef _Standard_HeaderFile
#include <Standard.hxx>
#endif
#ifndef _Handle_GEOMAlgo_ClsfBox_HeaderFile
#include <Handle_GEOMAlgo_ClsfBox.hxx>
#endif

#ifndef _TopoDS_Shape_HeaderFile
#include <TopoDS_Shape.hxx>
#endif
#ifndef _GeomAdaptor_Surface_HeaderFile
#include <GeomAdaptor_Surface.hxx>
#endif
#ifndef _GEOMAlgo_Clsf_HeaderFile
#include <GEOMAlgo_Clsf.hxx>
#endif
#ifndef _Standard_Boolean_HeaderFile
#include <Standard_Boolean.hxx>
#endif
#ifndef _Handle_Geom_Curve_HeaderFile
#include <Handle_Geom_Curve.hxx>
#endif
#ifndef _Handle_Geom_Surface_HeaderFile
#include <Handle_Geom_Surface.hxx>
#endif
class TopoDS_Shape;
class Geom_Curve;
class Geom_Surface;



class GEOMAlgo_ClsfBox : public GEOMAlgo_Clsf {

public:
 // Methods PUBLIC
 // 


Standard_EXPORT GEOMAlgo_ClsfBox();
Standard_EXPORT virtual ~GEOMAlgo_ClsfBox();


Standard_EXPORT   void SetBox(const TopoDS_Shape& aS) ;


Standard_EXPORT  const TopoDS_Shape& Box() const;


Standard_EXPORT virtual  void Perform() ;


Standard_EXPORT virtual  void CheckData() ;


Standard_EXPORT virtual  Standard_Boolean CanBeON(const Handle(Geom_Curve)& aC) const;


Standard_EXPORT virtual  Standard_Boolean CanBeON(const Handle(Geom_Surface)& aST) const;
//Standard_EXPORT ~GEOMAlgo_ClsfBox();




 // Type management
 //
 Standard_EXPORT const Handle(Standard_Type)& DynamicType() const;
 //Standard_EXPORT Standard_Boolean	       IsKind(const Handle(Standard_Type)&) const;

protected:

 // Methods PROTECTED
 // 


 // Fields PROTECTED
 //
TopoDS_Shape myBox;
GeomAdaptor_Surface myGAS[6];


private: 

 // Methods PRIVATE
 // 


 // Fields PRIVATE
 //


};





// other Inline functions and methods (like "C++: function call" methods)
//


#endif
