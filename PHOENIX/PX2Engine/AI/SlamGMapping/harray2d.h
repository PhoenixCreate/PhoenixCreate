#ifndef HARRAY2D_H
#define HARRAY2D_H
#include <set>
#include "point.h"
//#include <utils/boost::shared_ptr.h>
#include "array2d.h"

#include <boost/shared_ptr.hpp>


namespace GMapping {

/* һ��Ҫ����ΪʲôҪ��˫�� cell �ṹ, ˵ʵ���������Ǻ���������� */
/* Array2D ��һ���򵥵Ķ�ά����, HierarchicalArray2D �Ƿֲ�Ķ�ά���ݽṹ */

template <class Cell>
class HierarchicalArray2D: public Array2D<boost::shared_ptr< Array2D<Cell> > >
{

	public:
	    
		/* ��Ϊ��׼���һ������������ʵ���ڲ�Ԫ�ؽ���������ʹ�������Կ��Զ�һ��Ԫ�ؽ��в������� */
		/* pointcomparator ������������� */
		typedef std::set< point<int>, pointcomparator<int> > PointSet;
		
		HierarchicalArray2D(int xsize, int ysize, int patchMagnitude=5);
		HierarchicalArray2D(const HierarchicalArray2D& hg);
		HierarchicalArray2D& operator=(const HierarchicalArray2D& hg);
		
		virtual ~HierarchicalArray2D(){}
		
		void resize(int ixmin, int iymin, int ixmax, int iymax);
		
		inline int getPatchSize() const {return m_patchMagnitude;}
		
		inline int getPatchMagnitude() const {return m_patchMagnitude;}

		inline const Cell& cell(int x, int y) const;

		inline Cell& cell(int x, int y);
		
		inline bool isAllocated(int x, int y) const;
		
		inline AccessibilityState cellState(int x, int y) const ;
		
		inline IntPoint patchIndexes(int x, int y) const;

		inline const Cell& cell(const IntPoint& p) const 
		{
			return cell(p.x,p.y); 
		}
		
		inline Cell& cell(const IntPoint& p) 
		{
			return cell(p.x,p.y); 
		}
		
		inline bool isAllocated(const IntPoint& p) const 
		{
			return isAllocated(p.x,p.y);
		}
		
		inline AccessibilityState cellState(const IntPoint& p) const 
		{
			return cellState(p.x,p.y); 
		}
		
		inline IntPoint patchIndexes(const IntPoint& p) const 
		{
			return patchIndexes(p.x,p.y);
		}

		inline void setActiveArea(const PointSet&, bool patchCoords=false);
		
		const PointSet& getActiveArea() const 
		{
			return m_activeArea;
		}
		inline void allocActiveArea();
	
	protected:
		virtual Array2D<Cell> * createPatch(const IntPoint& p) const;
		PointSet m_activeArea;
		int m_patchMagnitude;
		int m_patchSize;
};

/* �ֲ�� cell ��ʾ�� patchMagnitude ��ʾ�ڶ��� cell �Ĵ�С�� int xsize, int ysize ��ʾͼ��Ĵ�С */
/* ע���������Ƕ�׹�ϵ */
template <class Cell>
HierarchicalArray2D<Cell>::HierarchicalArray2D(int xsize, int ysize, int patchMagnitude) 
  :Array2D<boost::shared_ptr< Array2D<Cell> > >::Array2D((xsize>>patchMagnitude), (ysize>>patchMagnitude))
{
	m_patchMagnitude = patchMagnitude;
	m_patchSize      = 1<< m_patchMagnitude;
}


/* �൱�ڸ�����һ�� HierarchicalArray2D ���飬���˾��������� BUG */
template <class Cell>
HierarchicalArray2D<Cell>::HierarchicalArray2D(const HierarchicalArray2D& hg)
  :Array2D<boost::shared_ptr< Array2D<Cell> > >::Array2D((hg.m_xsize>>hg.m_patchMagnitude), (hg.m_ysize>>hg.m_patchMagnitude))  // added by cyrill: if you have a resize error, check this again
{
	this->m_xsize = hg.m_xsize;
	this->m_ysize = hg.m_ysize;
    this->m_cells = new boost::shared_ptr< Array2D<Cell> >*[this->m_xsize];

	for (int x=0; x<this->m_xsize; x++)
	{
        this->m_cells[x]=new boost::shared_ptr< Array2D<Cell> >[this->m_ysize];
		for (int y=0; y<this->m_ysize; y++)
			this->m_cells[x][y]=hg.m_cells[x][y];
	}
	
	this->m_patchMagnitude=hg.m_patchMagnitude;
	this->m_patchSize=hg.m_patchSize; /* m_patchSize = 2^m_patchMagnitude  */
}

/* �ض��������С */
template <class Cell>
void HierarchicalArray2D<Cell>::resize(int xmin, int ymin, int xmax, int ymax)
{
	int xsize = xmax-xmin;
	int ysize = ymax-ymin;

    boost::shared_ptr< Array2D<Cell> > ** newcells=new boost::shared_ptr< Array2D<Cell> > *[xsize];

	/* ���ٻ����� */
	for (int x=0; x<xsize; x++)
	{
        newcells[x]=new boost::shared_ptr< Array2D<Cell> >[ysize];
		for (int y=0; y<ysize; y++)
		{
            newcells[x][y]=boost::shared_ptr< Array2D<Cell> >();
		}
	}
	
	/* �������� */
	int dx= xmin < 0 ? 0 : xmin;
	int dy= ymin < 0 ? 0 : ymin;
	int Dx=xmax<this->m_xsize?xmax:this->m_xsize;
	int Dy=ymax<this->m_ysize?ymax:this->m_ysize;
	
	for (int x=dx; x<Dx; x++){
		for (int y=dy; y<Dy; y++){
			newcells[x-xmin][y-ymin]=this->m_cells[x][y];
		}
		delete [] this->m_cells[x];
	}
	delete [] this->m_cells;
	
	this->m_cells=newcells;
	this->m_xsize=xsize;
	this->m_ysize=ysize; 
}

/* ��ֵ���� */
template <class Cell>
HierarchicalArray2D<Cell>& HierarchicalArray2D<Cell>::operator=(const HierarchicalArray2D& hg)
{
//	Array2D<boost::shared_ptr< Array2D<Cell> > >::operator=(hg);
	
	/* �������ȣ���Ҫ���·��仺���� */
	if (this->m_xsize!=hg.m_xsize || this->m_ysize!=hg.m_ysize)
	{
		for (int i=0; i<this->m_xsize; i++)
			delete [] this->m_cells[i];
		
		delete [] this->m_cells;
		
		this->m_xsize=hg.m_xsize;
		this->m_ysize=hg.m_ysize;
        
		this->m_cells=new boost::shared_ptr< Array2D<Cell> >*[this->m_xsize];
		
		for (int i=0; i<this->m_xsize; i++)
            this->m_cells[i]=new boost::shared_ptr< Array2D<Cell> > [this->m_ysize];
	}
	
	/* ���ݵĿ������� */
	for (int x=0; x<this->m_xsize; x++)
		for (int y=0; y<this->m_ysize; y++)
			this->m_cells[x][y]=hg.m_cells[x][y];
	
	m_activeArea.clear();
	m_patchMagnitude=hg.m_patchMagnitude;
	m_patchSize=hg.m_patchSize;
	return *this;
}

/* ���û����, �ر�ע�����������λ�ù�ϵ */
template <class Cell>
void HierarchicalArray2D<Cell>::setActiveArea(const typename HierarchicalArray2D<Cell>::PointSet& aa, bool patchCoords)
{
	m_activeArea.clear();
	
	for (PointSet::const_iterator it= aa.begin(); it!=aa.end(); it++)
	{
		IntPoint p;
		if (patchCoords)
			p=*it;
		else
			p=patchIndexes(*it);  /* IntPoint(x>>m_patchMagnitude, y>>m_patchMagnitude) */
		
		m_activeArea.insert(p); /* ���������������Ĺ��� */
	}
}

/* ��ͼ���е�ÿ���㴴��һ�� patch��patch �Ĵ�СΪ m_patchMagnitude */
template <class Cell>
Array2D<Cell>* HierarchicalArray2D<Cell>::createPatch(const IntPoint& ) const
{
	return new Array2D<Cell>(1<<m_patchMagnitude, 1<<m_patchMagnitude);
}


template <class Cell>
AccessibilityState  HierarchicalArray2D<Cell>::cellState(int x, int y) const 
{
	if (this->isInside(patchIndexes(x,y)))
    {
		/* enum AccessibilityState{Outside=0x0, Inside=0x1, Allocated=0x2}; */
		if(isAllocated(x,y))
			return (AccessibilityState)((int)Inside|(int)Allocated);
		else
			return Inside;
    }
	
	return Outside;
}


/* ���������, �� setActiveArea ������λ�ù�ϵ�Ƕ�Ӧ��, ���� m_activeArea �е����궼�� patch index ���� */
template <class Cell>
void HierarchicalArray2D<Cell>::allocActiveArea()
{
	for (PointSet::const_iterator it= m_activeArea.begin(); it!=m_activeArea.end(); it++)
	{
        const boost::shared_ptr< Array2D<Cell> >& ptr=this->m_cells[it->x][it->y];
		
		Array2D<Cell>* patch=0;
		
		if (!ptr)
		{
			patch=createPatch(*it);
		} 
		else{	
			patch=new Array2D<Cell>(*ptr);
		}
		
        this->m_cells[it->x][it->y]=boost::shared_ptr< Array2D<Cell> >(patch);
	}
}

/* �ж��루x,y����Ӧ�� patch �Ƿ���� cell */
template <class Cell>
bool HierarchicalArray2D<Cell>::isAllocated(int x, int y) const
{
	IntPoint c = patchIndexes(x,y);
    boost::shared_ptr< Array2D<Cell> >& ptr=this->m_cells[c.x][c.y];
	return (ptr != 0);
}


/* ���� x �� y ������� patch ������ֵ */
template <class Cell>
IntPoint HierarchicalArray2D<Cell>::patchIndexes(int x, int y) const
{
	if (x>=0 && y>=0)
		return IntPoint(x>>m_patchMagnitude, y>>m_patchMagnitude);

	return IntPoint(-1, -1);
}

/* ȡ��һ�� cell ��Ԫ */
template <class Cell>
Cell& HierarchicalArray2D<Cell>::cell(int x, int y)
{
	IntPoint c=patchIndexes(x,y);
	
	assert(this->isInside(c.x, c.y));
	
	if (!this->m_cells[c.x][c.y])
	{
		Array2D<Cell>* patch=createPatch(IntPoint(x,y));
        this->m_cells[c.x][c.y]=boost::shared_ptr< Array2D<Cell> >(patch);
		
		//cerr << "!!! FATAL: your dick is going to fall down" << endl;
	}
    boost::shared_ptr< Array2D<Cell> >& ptr=this->m_cells[c.x][c.y];

	/* ע��������ļ��ɣ��൱��һ��ȡ������ */
	return (*ptr).cell(IntPoint(x-(c.x<<m_patchMagnitude),y-(c.y<<m_patchMagnitude)));
}

/* ȡ��һ�� cell ��Ԫ */
template <class Cell>
const Cell& HierarchicalArray2D<Cell>::cell(int x, int y) const
{
	assert(isAllocated(x,y));
	
	IntPoint c=patchIndexes(x,y);
    
	const boost::shared_ptr< Array2D<Cell> >& ptr=this->m_cells[c.x][c.y];
	
	/* ����һ�� cell ��ָ�� */
	/* ע��������ļ��ɣ��൱��һ��ȡ������ */
	return (*ptr).cell(IntPoint(x-(c.x<<m_patchMagnitude),y-(c.y<<m_patchMagnitude)));
}

}


#endif
