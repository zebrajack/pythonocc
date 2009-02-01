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
%module SelectBasics

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


%include SelectBasics_dependencies.i


%include SelectBasics_headers.i




%nodefaultctor Handle_SelectBasics_SequenceNodeOfSequenceOfOwner;
class Handle_SelectBasics_SequenceNodeOfSequenceOfOwner : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_SequenceNodeOfSequenceOfOwner();
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfOwner();
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfOwner(const Handle_SelectBasics_SequenceNodeOfSequenceOfOwner &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfOwner(const SelectBasics_SequenceNodeOfSequenceOfOwner *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfOwner const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SequenceNodeOfSequenceOfOwner {
	SelectBasics_SequenceNodeOfSequenceOfOwner* GetObject() {
	return (SelectBasics_SequenceNodeOfSequenceOfOwner*)$self->Access();
	}
};

%nodefaultctor Handle_SelectBasics_SequenceNodeOfSequenceOfAddress;
class Handle_SelectBasics_SequenceNodeOfSequenceOfAddress : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_SequenceNodeOfSequenceOfAddress();
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfAddress();
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfAddress(const Handle_SelectBasics_SequenceNodeOfSequenceOfAddress &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfAddress(const SelectBasics_SequenceNodeOfSequenceOfAddress *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_SequenceNodeOfSequenceOfAddress const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SequenceNodeOfSequenceOfAddress {
	SelectBasics_SequenceNodeOfSequenceOfAddress* GetObject() {
	return (SelectBasics_SequenceNodeOfSequenceOfAddress*)$self->Access();
	}
};

%nodefaultctor Handle_SelectBasics_ListNodeOfListOfBox2d;
class Handle_SelectBasics_ListNodeOfListOfBox2d : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_ListNodeOfListOfBox2d();
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfBox2d();
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfBox2d(const Handle_SelectBasics_ListNodeOfListOfBox2d &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfBox2d(const SelectBasics_ListNodeOfListOfBox2d *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfBox2d const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_ListNodeOfListOfBox2d {
	SelectBasics_ListNodeOfListOfBox2d* GetObject() {
	return (SelectBasics_ListNodeOfListOfBox2d*)$self->Access();
	}
};

%nodefaultctor Handle_SelectBasics_ListNodeOfListOfSensitive;
class Handle_SelectBasics_ListNodeOfListOfSensitive : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_ListNodeOfListOfSensitive();
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfSensitive();
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfSensitive(const Handle_SelectBasics_ListNodeOfListOfSensitive &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfSensitive(const SelectBasics_ListNodeOfListOfSensitive *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_ListNodeOfListOfSensitive const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_ListNodeOfListOfSensitive {
	SelectBasics_ListNodeOfListOfSensitive* GetObject() {
	return (SelectBasics_ListNodeOfListOfSensitive*)$self->Access();
	}
};

%nodefaultctor Handle_SelectBasics_SensitiveEntity;
class Handle_SelectBasics_SensitiveEntity : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_SensitiveEntity();
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity();
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity(const Handle_SelectBasics_SensitiveEntity &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity(const SelectBasics_SensitiveEntity *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SensitiveEntity {
	SelectBasics_SensitiveEntity* GetObject() {
	return (SelectBasics_SensitiveEntity*)$self->Access();
	}
};

%nodefaultctor Handle_SelectBasics_EntityOwner;
class Handle_SelectBasics_EntityOwner : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_SelectBasics_EntityOwner();
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner();
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner(const Handle_SelectBasics_EntityOwner &aHandle);
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner(const SelectBasics_EntityOwner *anItem);
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_EntityOwner {
	SelectBasics_EntityOwner* GetObject() {
	return (SelectBasics_EntityOwner*)$self->Access();
	}
};

%nodefaultctor SelectBasics_SortAlgo;
class SelectBasics_SortAlgo {
	public:
		%feature("autodoc", "1");
		~SelectBasics_SortAlgo();
		%feature("autodoc", "1");
		SelectBasics_SortAlgo();
		%feature("autodoc", "1");
		SelectBasics_SortAlgo(const Bnd_Box2d &ClippingRectangle, const Standard_Real sizeOfSensitiveArea, const Handle_Bnd_HArray1OfBox2d &theRectangles);
		%feature("autodoc", "1");
		void Initialize(const Bnd_Box2d &ClippingRectangle, const Standard_Real sizeOfSensitiveArea, const Handle_Bnd_HArray1OfBox2d &theRectangles);
		%feature("autodoc", "1");
		void InitSelect(const Standard_Real x, const Standard_Real y);
		%feature("autodoc", "1");
		void InitSelect(const Bnd_Box2d &rect);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Standard_Integer Value() const;

};

%nodefaultctor SelectBasics;
class SelectBasics {
	public:
		%feature("autodoc", "1");
		~SelectBasics();
		%feature("autodoc", "1");
		SelectBasics();
		%feature("autodoc", "1");
		Standard_Integer MaxOwnerPriority();
		%feature("autodoc", "1");
		Standard_Integer MinOwnerPriority();

};

%nodefaultctor SelectBasics_ListNodeOfListOfSensitive;
class SelectBasics_ListNodeOfListOfSensitive : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		SelectBasics_ListNodeOfListOfSensitive(const Handle_SelectBasics_SensitiveEntity &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~SelectBasics_ListNodeOfListOfSensitive();

};
%extend SelectBasics_ListNodeOfListOfSensitive {
	Handle_SelectBasics_ListNodeOfListOfSensitive GetHandle() {
	return *(Handle_SelectBasics_ListNodeOfListOfSensitive*) &$self;
	}
};

%nodefaultctor SelectBasics_ListNodeOfListOfBox2d;
class SelectBasics_ListNodeOfListOfBox2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		SelectBasics_ListNodeOfListOfBox2d(const Bnd_Box2d &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Bnd_Box2d & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~SelectBasics_ListNodeOfListOfBox2d();

};
%extend SelectBasics_ListNodeOfListOfBox2d {
	Handle_SelectBasics_ListNodeOfListOfBox2d GetHandle() {
	return *(Handle_SelectBasics_ListNodeOfListOfBox2d*) &$self;
	}
};

%nodefaultctor SelectBasics_SequenceNodeOfSequenceOfAddress;
class SelectBasics_SequenceNodeOfSequenceOfAddress : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		SelectBasics_SequenceNodeOfSequenceOfAddress(const Standard_Address &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Standard_Address & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~SelectBasics_SequenceNodeOfSequenceOfAddress();

};
%extend SelectBasics_SequenceNodeOfSequenceOfAddress {
	Handle_SelectBasics_SequenceNodeOfSequenceOfAddress GetHandle() {
	return *(Handle_SelectBasics_SequenceNodeOfSequenceOfAddress*) &$self;
	}
};

%nodefaultctor SelectBasics_SensitiveEntity;
class SelectBasics_SensitiveEntity : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void Set(const Handle_SelectBasics_EntityOwner &TheOwnerId);
		%feature("autodoc", "1");
		const Handle_SelectBasics_EntityOwner & OwnerId() const;
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aresult);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const TColgp_Array1OfPnt2d &Polyline, const Bnd_Box2d &aBox, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		Standard_Boolean NeedsConversion() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Is3D() const;
		%feature("autodoc", "1");
		virtual		Standard_Real Depth() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer MaxBoxes() const;
		%feature("autodoc", "1");
		void SetSensitivityFactor(const Standard_ShortReal F);
		%feature("autodoc", "1");
		Standard_ShortReal SensitivityFactor() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend SelectBasics_SensitiveEntity {
	Handle_SelectBasics_SensitiveEntity GetHandle() {
	return *(Handle_SelectBasics_SensitiveEntity*) &$self;
	}
};

%nodefaultctor SelectBasics_ListOfBox2d;
class SelectBasics_ListOfBox2d {
	public:
		%feature("autodoc", "1");
		SelectBasics_ListOfBox2d();
		%feature("autodoc", "1");
		void Assign(const SelectBasics_ListOfBox2d &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~SelectBasics_ListOfBox2d();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Bnd_Box2d &I);
		%feature("autodoc", "1");
		void Prepend(const Bnd_Box2d &I, SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "1");
		void Prepend(SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "1");
		void Append(const Bnd_Box2d &I);
		%feature("autodoc", "1");
		void Append(const Bnd_Box2d &I, SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "1");
		void Append(SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "1");
		Bnd_Box2d & First() const;
		%feature("autodoc", "1");
		Bnd_Box2d & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "1");
		void InsertBefore(const Bnd_Box2d &I, SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "1");
		void InsertBefore(SelectBasics_ListOfBox2d & Other, SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "1");
		void InsertAfter(const Bnd_Box2d &I, SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "1");
		void InsertAfter(SelectBasics_ListOfBox2d & Other, SelectBasics_ListIteratorOfListOfBox2d & It);

};

%nodefaultctor SelectBasics_BasicTool;
class SelectBasics_BasicTool {
	public:
		%feature("autodoc", "1");
		~SelectBasics_BasicTool();
		%feature("autodoc", "1");
		SelectBasics_BasicTool();
		%feature("autodoc", "1");
		Standard_Boolean MatchSegments(const gp_Pnt2d &P1, const gp_Pnt2d &P2, const gp_Pnt2d &P3, const gp_Pnt2d &P4);
		%feature("autodoc", "1");
		Standard_Boolean AutoInter(const TColgp_Array1OfPnt2d &aPolyg2d);
		%feature("autodoc", "1");
		Standard_Boolean MatchPolyg2d(const TColgp_Array1OfPnt2d &tabpoint, const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue, Standard_Integer & Rank);

};

%nodefaultctor SelectBasics_SequenceNodeOfSequenceOfOwner;
class SelectBasics_SequenceNodeOfSequenceOfOwner : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		SelectBasics_SequenceNodeOfSequenceOfOwner(const Handle_SelectBasics_EntityOwner &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~SelectBasics_SequenceNodeOfSequenceOfOwner();

};
%extend SelectBasics_SequenceNodeOfSequenceOfOwner {
	Handle_SelectBasics_SequenceNodeOfSequenceOfOwner GetHandle() {
	return *(Handle_SelectBasics_SequenceNodeOfSequenceOfOwner*) &$self;
	}
};

%nodefaultctor SelectBasics_ListIteratorOfListOfBox2d;
class SelectBasics_ListIteratorOfListOfBox2d {
	public:
		%feature("autodoc", "1");
		~SelectBasics_ListIteratorOfListOfBox2d();
		%feature("autodoc", "1");
		SelectBasics_ListIteratorOfListOfBox2d();
		%feature("autodoc", "1");
		SelectBasics_ListIteratorOfListOfBox2d(const SelectBasics_ListOfBox2d &L);
		%feature("autodoc", "1");
		void Initialize(const SelectBasics_ListOfBox2d &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Bnd_Box2d & Value() const;

};

%nodefaultctor SelectBasics_ListIteratorOfListOfSensitive;
class SelectBasics_ListIteratorOfListOfSensitive {
	public:
		%feature("autodoc", "1");
		~SelectBasics_ListIteratorOfListOfSensitive();
		%feature("autodoc", "1");
		SelectBasics_ListIteratorOfListOfSensitive();
		%feature("autodoc", "1");
		SelectBasics_ListIteratorOfListOfSensitive(const SelectBasics_ListOfSensitive &L);
		%feature("autodoc", "1");
		void Initialize(const SelectBasics_ListOfSensitive &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity & Value() const;

};

%nodefaultctor SelectBasics_EntityOwner;
class SelectBasics_EntityOwner : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void Set(const Standard_Integer aPriority);
		%feature("autodoc", "1");
		Standard_Integer Priority() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean HasLocation() const;
		%feature("autodoc", "1");
		virtual		void SetLocation(const TopLoc_Location &aLoc);
		%feature("autodoc", "1");
		virtual		void ResetLocation();
		%feature("autodoc", "1");
		virtual		const TopLoc_Location & Location() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend SelectBasics_EntityOwner {
	Handle_SelectBasics_EntityOwner GetHandle() {
	return *(Handle_SelectBasics_EntityOwner*) &$self;
	}
};

%nodefaultctor SelectBasics_SequenceOfOwner;
class SelectBasics_SequenceOfOwner : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		SelectBasics_SequenceOfOwner();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~SelectBasics_SequenceOfOwner();
		%feature("autodoc", "1");
		const SelectBasics_SequenceOfOwner & Assign(const SelectBasics_SequenceOfOwner &Other);
		%feature("autodoc", "1");
		void Append(const Handle_SelectBasics_EntityOwner &T);
		%feature("autodoc", "1");
		void Append(SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_SelectBasics_EntityOwner &T);
		%feature("autodoc", "1");
		void Prepend(SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_SelectBasics_EntityOwner &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_SelectBasics_EntityOwner &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "1");
		const Handle_SelectBasics_EntityOwner & First() const;
		%feature("autodoc", "1");
		const Handle_SelectBasics_EntityOwner & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "1");
		const Handle_SelectBasics_EntityOwner & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_SelectBasics_EntityOwner & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_SelectBasics_EntityOwner &I);
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_SelectBasics_EntityOwner & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor SelectBasics_SequenceOfAddress;
class SelectBasics_SequenceOfAddress : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		SelectBasics_SequenceOfAddress();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~SelectBasics_SequenceOfAddress();
		%feature("autodoc", "1");
		const SelectBasics_SequenceOfAddress & Assign(const SelectBasics_SequenceOfAddress &Other);
		%feature("autodoc", "1");
		void Append(const Standard_Address &T);
		%feature("autodoc", "1");
		void Append(SelectBasics_SequenceOfAddress & S);
		%feature("autodoc", "1");
		void Prepend(const Standard_Address &T);
		%feature("autodoc", "1");
		void Prepend(SelectBasics_SequenceOfAddress & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Standard_Address &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, SelectBasics_SequenceOfAddress & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Standard_Address &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, SelectBasics_SequenceOfAddress & S);
		%feature("autodoc", "1");
		const Standard_Address & First() const;
		%feature("autodoc", "1");
		const Standard_Address & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, SelectBasics_SequenceOfAddress & S);
		%feature("autodoc", "1");
		const Standard_Address & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Standard_Address & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_Address &I);
		%feature("autodoc", "1");
		Standard_Address & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Standard_Address & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor SelectBasics_ListOfSensitive;
class SelectBasics_ListOfSensitive {
	public:
		%feature("autodoc", "1");
		SelectBasics_ListOfSensitive();
		%feature("autodoc", "1");
		void Assign(const SelectBasics_ListOfSensitive &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~SelectBasics_ListOfSensitive();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Handle_SelectBasics_SensitiveEntity &I);
		%feature("autodoc", "1");
		void Prepend(const Handle_SelectBasics_SensitiveEntity &I, SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "1");
		void Prepend(SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "1");
		void Append(const Handle_SelectBasics_SensitiveEntity &I);
		%feature("autodoc", "1");
		void Append(const Handle_SelectBasics_SensitiveEntity &I, SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "1");
		void Append(SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity & First() const;
		%feature("autodoc", "1");
		Handle_SelectBasics_SensitiveEntity & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "1");
		void InsertBefore(const Handle_SelectBasics_SensitiveEntity &I, SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "1");
		void InsertBefore(SelectBasics_ListOfSensitive & Other, SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "1");
		void InsertAfter(const Handle_SelectBasics_SensitiveEntity &I, SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "1");
		void InsertAfter(SelectBasics_ListOfSensitive & Other, SelectBasics_ListIteratorOfListOfSensitive & It);

};