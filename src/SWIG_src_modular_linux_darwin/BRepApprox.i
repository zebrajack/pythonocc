/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module BRepApprox

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include BRepApprox_dependencies.i


%include BRepApprox_headers.i




%nodefaultctor Handle_BRepApprox_ApproxLine;
class Handle_BRepApprox_ApproxLine : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_BRepApprox_ApproxLine();
		%feature("autodoc", "1");
		Handle_BRepApprox_ApproxLine();
		%feature("autodoc", "1");
		Handle_BRepApprox_ApproxLine(const Handle_BRepApprox_ApproxLine &aHandle);
		%feature("autodoc", "1");
		Handle_BRepApprox_ApproxLine(const BRepApprox_ApproxLine *anItem);
		%feature("autodoc", "1");
		Handle_BRepApprox_ApproxLine const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepApprox_ApproxLine {
	BRepApprox_ApproxLine* GetObject() {
	return (BRepApprox_ApproxLine*)$self->Access();
	}
};

%nodefaultctor BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const Standard_Integer Deg);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox();

};

%nodefaultctor BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_MyGradientbisOfTheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_MyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox();

};

%nodefaultctor BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &Constraints, const math_Matrix &Bern, const math_Matrix &DerivativeBern, const Standard_Real Tolerance=1.0000000000000000364321973154977415791655470656e-10);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		const math_Matrix & ConstraintMatrix() const;
		%feature("autodoc", "1");
		const math_Vector & Duale() const;
		%feature("autodoc", "1");
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox &SSP, const math_Vector &Parameters, const Standard_Integer Deg, const math_Matrix &DA);
		%feature("autodoc", "1");
		const math_Matrix & InverseMatrix() const;

};

%nodefaultctor BRepApprox_ApproxLine;
class BRepApprox_ApproxLine : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		BRepApprox_ApproxLine(const Handle_Geom_BSplineCurve &CurveXYZ, const Handle_Geom2d_BSplineCurve &CurveUV1, const Handle_Geom2d_BSplineCurve &CurveUV2);
		%feature("autodoc", "1");
		BRepApprox_ApproxLine(const Handle_IntSurf_LineOn2S &lin, const Standard_Boolean Tang);
		%feature("autodoc", "1");
		Standard_Integer NbPnts() const;
		%feature("autodoc", "1");
		IntSurf_PntOn2S Point(const Standard_Integer Index);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_ApproxLine();

};
%extend BRepApprox_ApproxLine {
	Handle_BRepApprox_ApproxLine GetHandle() {
	return *(Handle_BRepApprox_ApproxLine*) &$self;
	}
};

%nodefaultctor BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_MyGradientOfTheComputeLineBezierOfApprox();
		%feature("autodoc", "1");
		BRepApprox_MyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const Standard_Integer Deg);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox();

};

%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};

%nodefaultctor BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};

%nodefaultctor BRepApprox_SurfaceTool;
class BRepApprox_SurfaceTool {
	public:
		%feature("autodoc", "1");
		~BRepApprox_SurfaceTool();
		%feature("autodoc", "1");
		BRepApprox_SurfaceTool();
		%feature("autodoc", "1");
		Standard_Real FirstUParameter(const BRepAdaptor_Surface &Surf);
		%feature("autodoc", "1");
		Standard_Real FirstVParameter(const BRepAdaptor_Surface &Surf);
		%feature("autodoc", "1");
		Standard_Real LastUParameter(const BRepAdaptor_Surface &Surf);
		%feature("autodoc", "1");
		Standard_Real LastVParameter(const BRepAdaptor_Surface &Surf);
		%feature("autodoc", "1");
		Standard_Integer NbUIntervals(const BRepAdaptor_Surface &Surf, const GeomAbs_Shape S);
		%feature("autodoc", "1");
		Standard_Integer NbVIntervals(const BRepAdaptor_Surface &Surf, const GeomAbs_Shape S);
		%feature("autodoc", "1");
		void UIntervals(const BRepAdaptor_Surface &Surf, TColStd_Array1OfReal & Tab, const GeomAbs_Shape S);
		%feature("autodoc", "1");
		void VIntervals(const BRepAdaptor_Surface &Surf, TColStd_Array1OfReal & Tab, const GeomAbs_Shape S);
		%feature("autodoc", "1");
		Handle_Adaptor3d_HSurface UTrim(const BRepAdaptor_Surface &Surf, const Standard_Real F, const Standard_Real L, const Standard_Real Tol);
		%feature("autodoc", "1");
		Handle_Adaptor3d_HSurface VTrim(const BRepAdaptor_Surface &Surf, const Standard_Real F, const Standard_Real L, const Standard_Real Tol);
		%feature("autodoc", "1");
		Standard_Boolean IsUClosed(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Boolean IsVClosed(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Boolean IsUPeriodic(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Real UPeriod(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Boolean IsVPeriodic(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Real VPeriod(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Pnt Value(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V);
		%feature("autodoc", "1");
		void D0(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V, gp_Pnt & P);
		%feature("autodoc", "1");
		void D1(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);
		%feature("autodoc", "1");
		void D2(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);
		%feature("autodoc", "1");
		void D3(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);
		%feature("autodoc", "1");
		gp_Vec DN(const BRepAdaptor_Surface &S, const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);
		%feature("autodoc", "1");
		Standard_Real UResolution(const BRepAdaptor_Surface &S, const Standard_Real R3d);
		%feature("autodoc", "1");
		Standard_Real VResolution(const BRepAdaptor_Surface &S, const Standard_Real R3d);
		%feature("autodoc", "1");
		GeomAbs_SurfaceType GetType(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Pln Plane(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Cylinder Cylinder(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Cone Cone(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Torus Torus(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Sphere Sphere(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Handle_Geom_BezierSurface Bezier(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Handle_Geom_BSplineSurface BSpline(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Ax1 AxeOfRevolution(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		gp_Dir Direction(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Handle_Adaptor3d_HCurve BasisCurve(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Integer NbSamplesU(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Integer NbSamplesV(const BRepAdaptor_Surface &S);
		%feature("autodoc", "1");
		Standard_Integer NbSamplesU(const BRepAdaptor_Surface &S, const Standard_Real u1, const Standard_Real u2);
		%feature("autodoc", "1");
		Standard_Integer NbSamplesV(const BRepAdaptor_Surface &S, const Standard_Real v1, const Standard_Real v2);

};

%nodefaultctor BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox();
		%feature("autodoc", "1");
		BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, AppParCurves_MultiCurve & SCurv, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &Constraints, const math_Matrix &Bern, const math_Matrix &DerivativeBern, const Standard_Real Tolerance=1.0000000000000000364321973154977415791655470656e-10);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		const math_Matrix & ConstraintMatrix() const;
		%feature("autodoc", "1");
		const math_Vector & Duale() const;
		%feature("autodoc", "1");
		const math_Matrix & ConstraintDerivative(const BRepApprox_TheMultiLineOfApprox &SSP, const math_Vector &Parameters, const Standard_Integer Deg, const math_Matrix &DA);
		%feature("autodoc", "1");
		const math_Matrix & InverseMatrix() const;

};

%nodefaultctor BRepApprox_TheComputeLineBezierOfApprox;
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_TheComputeLineBezierOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &Line, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &Line, const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineBezierOfApprox(const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineBezierOfApprox(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Init(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Perform(const BRepApprox_TheMultiLineOfApprox &Line);
		%feature("autodoc", "1");
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);
		%feature("autodoc", "1");
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);
		%feature("autodoc", "1");
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);
		%feature("autodoc", "1");
		Standard_Boolean IsAllApproximated() const;
		%feature("autodoc", "1");
		Standard_Boolean IsToleranceReached() const;
		%feature("autodoc", "1");
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Standard_Integer NbMultiCurves() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & Value(const Standard_Integer Index=1) const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve & ChangeValue(const Standard_Integer Index=1);
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & SplineValue();
		%feature("autodoc", "1");
		void Parametrization(Approx_ParametrizationType & partype) const;
		%feature("autodoc", "1");
		const TColStd_Array1OfReal & Parameters(const Standard_Integer Index=1) const;

};

%nodefaultctor BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		const math_IntegerVector & Index() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		void SetFirstLambda(const Standard_Real l1);
		%feature("autodoc", "1");
		void SetLastLambda(const Standard_Real l2);
		%feature("autodoc", "1");
		virtual		~BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox();

};

%nodefaultctor BRepApprox_Approx;
class BRepApprox_Approx {
	public:
		%feature("autodoc", "1");
		~BRepApprox_Approx();
		%feature("autodoc", "1");
		BRepApprox_Approx();
		%feature("autodoc", "1");
		void SetParameters(const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer DegMin, const Standard_Integer DegMax, const Standard_Integer NbIterMax, const Standard_Boolean ApproxWithTangency=1, const Approx_ParametrizationType Parametrization=Approx_ChordLength);
		%feature("autodoc", "1");
		void SetParameters(const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Boolean RelativeTol, const Standard_Integer DegMin, const Standard_Integer DegMax, const Standard_Integer NbIterMax, const Standard_Integer NbPntMax, const Standard_Boolean ApproxWithTangency=1, const Approx_ParametrizationType Parametrization=Approx_ChordLength);
		%feature("autodoc", "1");
		Standard_Real TolReached3d() const;
		%feature("autodoc", "1");
		Standard_Real TolReached2d() const;
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbMultiCurves() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & Value(const Standard_Integer Index) const;

};

%nodefaultctor BRepApprox_ThePrmPrmSvSurfacesOfApprox;
class BRepApprox_ThePrmPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "1");
		BRepApprox_ThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface &Surf1, const BRepAdaptor_Surface &Surf2);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);
		%feature("autodoc", "1");
		virtual		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		~BRepApprox_ThePrmPrmSvSurfacesOfApprox();

};

%nodefaultctor BRepApprox_TheComputeLineOfApprox;
class BRepApprox_TheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_TheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &Line, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &Line, const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineOfApprox(const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		BRepApprox_TheComputeLineOfApprox(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Interpol(const BRepApprox_TheMultiLineOfApprox &Line);
		%feature("autodoc", "1");
		void Init(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Perform(const BRepApprox_TheMultiLineOfApprox &Line);
		%feature("autodoc", "1");
		void SetParameters(const math_Vector &ThePar);
		%feature("autodoc", "1");
		void SetKnots(const TColStd_Array1OfReal &Knots);
		%feature("autodoc", "1");
		void SetKnotsAndMultiplicities(const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults);
		%feature("autodoc", "1");
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);
		%feature("autodoc", "1");
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);
		%feature("autodoc", "1");
		void SetContinuity(const Standard_Integer C);
		%feature("autodoc", "1");
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);
		%feature("autodoc", "1");
		Standard_Boolean IsAllApproximated() const;
		%feature("autodoc", "1");
		Standard_Boolean IsToleranceReached() const;
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & Value() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve & ChangeValue();
		%feature("autodoc", "1");
		const TColStd_Array1OfReal & Parameters() const;

};

%nodefaultctor BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const TColStd_Array1OfReal &Param, const BRepAdaptor_Surface &S1, const BRepAdaptor_Surface &S2, const Standard_Real TolTangency);
		%feature("autodoc", "1");
		BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface &S1, const BRepAdaptor_Surface &S2, const Standard_Real TolTangency);
		%feature("autodoc", "1");
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal &Param, math_FunctionSetRoot & Rsnld);
		%feature("autodoc", "1");
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal &Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		const IntSurf_PntOn2S & Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent() const;
		%feature("autodoc", "1");
		const gp_Dir & Direction() const;
		%feature("autodoc", "1");
		const gp_Dir2d & DirectionOnS1() const;
		%feature("autodoc", "1");
		const gp_Dir2d & DirectionOnS2() const;
		%feature("autodoc", "1");
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function();

};

%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox();

};

%nodefaultctor BRepApprox_TheMultiLineOfApprox;
class BRepApprox_TheMultiLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_TheMultiLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheMultiLineOfApprox(const Handle_BRepApprox_ApproxLine &line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Real xo, const Standard_Real ax, const Standard_Real yo, const Standard_Real ay, const Standard_Real zo, const Standard_Real az, const Standard_Real u1o, const Standard_Real a1u, const Standard_Real v1o, const Standard_Real a1v, const Standard_Real u2o, const Standard_Real a2u, const Standard_Real v2o, const Standard_Real a2v, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin=0, const Standard_Integer IndMax=0);
		%feature("autodoc", "1");
		BRepApprox_TheMultiLineOfApprox(const Handle_BRepApprox_ApproxLine &line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Real xo, const Standard_Real ax, const Standard_Real yo, const Standard_Real ay, const Standard_Real zo, const Standard_Real az, const Standard_Real u1o, const Standard_Real a1u, const Standard_Real v1o, const Standard_Real a1v, const Standard_Real u2o, const Standard_Real a2u, const Standard_Real v2o, const Standard_Real a2v, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin=0, const Standard_Integer IndMax=0);
		%feature("autodoc", "1");
		Standard_Integer FirstPoint() const;
		%feature("autodoc", "1");
		Standard_Integer LastPoint() const;
		%feature("autodoc", "1");
		Standard_Integer NbP2d() const;
		%feature("autodoc", "1");
		Standard_Integer NbP3d() const;
		%feature("autodoc", "1");
		Approx_Status WhatStatus() const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt) const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d) const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d) const;
		%feature("autodoc", "1");
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert) const;

};

%nodefaultctor BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "1");
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface &S1, const BRepAdaptor_Surface &S2);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbEquations() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, math_Vector & F);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Derivatives(const math_Vector &X, math_Matrix & D);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, math_Vector & F, math_Matrix & D);
		%feature("autodoc", "1");
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal &Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);
		%feature("autodoc", "1");
		Standard_Real Root() const;
		%feature("autodoc", "1");
		gp_Pnt Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent(const math_Vector &UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);
		%feature("autodoc", "1");
		gp_Dir Direction() const;
		%feature("autodoc", "1");
		gp_Dir2d DirectionOnS1() const;
		%feature("autodoc", "1");
		gp_Dir2d DirectionOnS2() const;
		%feature("autodoc", "1");
		const BRepAdaptor_Surface & AuxillarSurface1() const;
		%feature("autodoc", "1");
		const BRepAdaptor_Surface & AuxillarSurface2() const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox();

};

%nodefaultctor BRepApprox_TheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheImpPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "1");
		BRepApprox_TheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface &Surf1, const IntSurf_Quadric &Surf2);
		%feature("autodoc", "1");
		BRepApprox_TheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric &Surf1, const BRepAdaptor_Surface &Surf2);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);
		%feature("autodoc", "1");
		virtual		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		~BRepApprox_TheImpPrmSvSurfacesOfApprox();

};

%nodefaultctor BRepApprox_TheMultiLineToolOfApprox;
class BRepApprox_TheMultiLineToolOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_TheMultiLineToolOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheMultiLineToolOfApprox();
		%feature("autodoc", "1");
		Standard_Integer FirstPoint(const BRepApprox_TheMultiLineOfApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer LastPoint(const BRepApprox_TheMultiLineOfApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer NbP2d(const BRepApprox_TheMultiLineOfApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer NbP3d(const BRepApprox_TheMultiLineOfApprox &ML);
		%feature("autodoc", "1");
		void Value(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt & TabPnt);
		%feature("autodoc", "1");
		void Value(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt2d & TabPnt2d);
		%feature("autodoc", "1");
		void Value(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt & TabPnt, TColgp_Array1OfPnt2d & TabPnt2d);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec & TabVec);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec2d & TabVec2d);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec & TabVec, TColgp_Array1OfVec2d & TabVec2d);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec & arg2);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec2d & arg2);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const BRepApprox_TheMultiLineOfApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec & arg2, TColgp_Array1OfVec2d & arg3);
		%feature("autodoc", "1");
		BRepApprox_TheMultiLineOfApprox MakeMLBetween(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);
		%feature("autodoc", "1");
		Approx_Status WhatStatus(const BRepApprox_TheMultiLineOfApprox &ML, const Standard_Integer arg1, const Standard_Integer arg2);

};

%nodefaultctor BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_MyBSplGradientOfTheComputeLineOfApprox();
		%feature("autodoc", "1");
		BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=1);
		%feature("autodoc", "1");
		BRepApprox_MyBSplGradientOfTheComputeLineOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox();

};

%nodefaultctor BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "1");
		BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox();
		%feature("autodoc", "1");
		BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const BRepAdaptor_Surface &PS, const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox(const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		void Set(const BRepAdaptor_Surface &PS);
		%feature("autodoc", "1");
		void SetImplicitSurface(const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		void Set(const Standard_Real Tol);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbEquations() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, math_Vector & F);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Derivatives(const math_Vector &X, math_Matrix & D);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, math_Vector & F, math_Matrix & D);
		%feature("autodoc", "1");
		Standard_Real Root() const;
		%feature("autodoc", "1");
		Standard_Real Tolerance() const;
		%feature("autodoc", "1");
		const gp_Pnt & Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent();
		%feature("autodoc", "1");
		const gp_Vec & Direction3d();
		%feature("autodoc", "1");
		const gp_Dir2d & Direction2d();
		%feature("autodoc", "1");
		const BRepAdaptor_Surface & PSurface() const;
		%feature("autodoc", "1");
		const IntSurf_Quadric & ISurface() const;
		%feature("autodoc", "1");
		virtual		~BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox();

};

%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("autodoc", "1");
		~BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox();
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox(const BRepApprox_TheMultiLineOfApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};