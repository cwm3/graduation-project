package com.productsystem.dao.impl;

import com.productsystem.dao.VendorDao;
import com.productsystem.model.Vendor;
import java.io.Serializable;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component("vendorDao")
public class VendorDaoImpl
  implements VendorDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(Vendor vendor)
  {
    this.hibernateTemplate.save(vendor);
  }

  public boolean checkVendorExistsWithName(String vendorid, String vendorpassword)
  {
    List vendors = this.hibernateTemplate.find("from Vendor  as a where a.vendorid = '" + vendorid + "' and a.vendorpassword = '" + vendorpassword + "'");

    return ((vendors != null) && (vendors.size() > 0));
  }

  public HibernateTemplate getHibernateTemplate()
  {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate)
  {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Vendor> getVendors()
  {
    return this.hibernateTemplate.find("from Vendor");
  }

  public Vendor loadById(int id)
  {
    return ((Vendor)this.hibernateTemplate.load(Vendor.class, Integer.valueOf(id)));
  }

  public void DelVendorById(int id)
  {
    getHibernateTemplate().delete(getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelVendorById(Vendor u)
  {
    this.hibernateTemplate.delete(u);
  }

  public void updateVendor(Vendor u)
  {
    this.hibernateTemplate.update(u);
  }

  public int countAll(String clazz)
  {
    final String hql = "select count(*) from " + clazz + " as a";
	Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			return query.uniqueResult();
		}
	});
	return count.intValue();
  }

	/** 统计指定类的查询结果 */
	public int countQuery(String hql) {
		final String counthql = hql;
		System.out.print(hql);
		Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(counthql);
				query.setMaxResults(1);
				return query.uniqueResult();
			}
		});
		return count.intValue();
	}
  public List listAll(String clazz, int pageNo, int pageSize)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final String hql = "from " + clazz + "  order by vendor_name";
    List list = hibernateTemplate.executeFind(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(pSize);
			query.setFirstResult((pNo - 1) * pSize);
			List result = query.list();
			if (!Hibernate.isInitialized(result))
				Hibernate.initialize(result);
			return result;
		}
	});
	return list;
    
  }

  public List listAll(String clazz)
  {
    return this.hibernateTemplate.find("from " + clazz + " as a order by  a.vendorname ");
  }

  public List listAll(Vendor vendor)
  {
    StringBuffer hql = new StringBuffer();
    hql.append(" from Vendor as a where a.id > 0  ");
    if (!(vendor.getVendorid().equals("")))
      hql.append(" and  a.vendorid like '%" + vendor.getVendorid() + "%' ");

    if (!(vendor.getVendor_name().equals("")))
      hql.append(" and a.vendorname like '%" + vendor.getVendor_name() + "%' ");

    if (!(vendor.getChinese_name().equals("")))
      hql.append(" and a.chinesename like '%" + vendor.getChinese_name() + "%' ");

    hql.append(" order by a.vendor_name ");

    return this.hibernateTemplate.find(hql.toString());
  }

  public void saveOrUpdate(Vendor vendor)
  {
    this.hibernateTemplate.saveOrUpdate(vendor);
  }

  public void deleteById(Class clazz, Serializable id)
  {
    this.hibernateTemplate.delete(this.hibernateTemplate.load(clazz, id));
  }

  public Object loadById(Class clazz, Serializable id)
  {
    return this.hibernateTemplate.get(clazz, id);
  }

  public List listSelectVendor(int pageNo, int pageSize, Vendor vendor)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();
    hql.append(" from Vendor as a where a.id > 0  ");

    String vendor_id = vendor.getVendorid();
    if ((vendor_id != null) && 
      (!(vendor_id.equals(""))))
      hql.append(" and  a.vendorid like '%" + vendor_id + "%' ");

    String vendor_name = vendor.getVendor_name();
    if ((vendor_name != null) && 
      (!(vendor.getVendor_name().equals(""))))
      hql.append(" and a.vendor_name like '%" + vendor_name + "%' ");

    String chinese_name = vendor.getChinese_name();
    if ((chinese_name != null) && 
      (!(chinese_name.equals(""))))
      hql.append(" and a.chinese_name like '%" + chinese_name + "%' ");

    hql.append(" order by a.vendor_name ");

    List list = hibernateTemplate.executeFind(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(pSize);
			query.setFirstResult((pNo - 1) * pSize);
			List result = query.list();
			if (!Hibernate.isInitialized(result))
				Hibernate.initialize(result);
			return result;
		}
	});
	return list;
    
  }

  public int coutSelectVendor(Vendor vendor)
  {
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(*)  from Vendor as a where 1=1 ");

    String vendor_id = vendor.getVendorid();
    if ((vendor_id != null) && 
      (!(vendor_id.equals(""))))
      hql.append(" and  a.vendorid like '%" + vendor_id + "%' ");

    String vendor_name = vendor.getVendor_name();
    if ((vendor_name != null) && 
      (!(vendor.getVendor_name().equals(""))))
      hql.append(" and a.vendor_name like '%" + vendor_name + "%' ");

    String chinese_name = vendor.getChinese_name();
    if ((chinese_name != null) && 
      (!(chinese_name.equals(""))))
      hql.append(" and a.chinese_name like '%" + chinese_name + "%' ");

    hql.append(" order by a.vendor_name ");
    Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(1);
			return query.uniqueResult();
		}
	});
	return count.intValue();
  }

  public int coutVendorSchedule(Vendor vendor)
  {
    final StringBuffer hql = new StringBuffer();

    hql.append(" select count(*)  from Vendor as a where a.id > 0 ");
    if (!(vendor.getVendor_field().equals("")))
      hql.append(" and  a.field like '%" + vendor.getVendor_field() + "%'");

    if (!(vendor.getVendor_cat().equals("")))
      hql.append(" and a.cat like '%" + vendor.getVendor_cat() + "%'");

    if (!(vendor.getAveragescore().equals("")))
      hql.append(" and a.averagescore like '%" + vendor.getAveragescore() + "%'");

    hql.append(" and a.vendorid = any(select distinct vendorid from Schedule where vendordate between '" + vendor.getRemark() + "' and '" + vendor.getRemark() + "' )");

    Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(1);
			return query.uniqueResult();
		}
	});
	return count.intValue();
  }

  public List listVendorSchedule(int pageNo, int pageSize, Vendor vendor)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();
    hql.append("from Vendor as a where a.id > 0  ");
    if (!(vendor.getVendor_field().equals("")))
      hql.append(" and  a.field like '%" + vendor.getVendor_field() + "%'");

    if (!(vendor.getVendor_cat().equals("")))
      hql.append(" and a.cat like '%" + vendor.getVendor_cat() + "%'");

    if (!(vendor.getAveragescore().equals("")))
      hql.append(" and a.averagescore like '%" + vendor.getAveragescore() + "%'");

    hql.append(" and a.vendorid = any(SELECT distinct vendorid from Schedule where vendordate between '" + vendor.getRemark() + "'  and '" + vendor.getRemark() + "')");

    hql.append(" order by a.vendor_name ");

    List list = hibernateTemplate.executeFind(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(pSize);
			query.setFirstResult((pNo - 1) * pSize);
			List result = query.list();
			if (!Hibernate.isInitialized(result))
				Hibernate.initialize(result);
			return result;
		}
	});
	return list;
    
  }

  public List<Vendor> listVendorByTiaoJian(String vendorid, String vendorname, String chinesename)
  {
    StringBuffer hql = new StringBuffer();
    hql.append("from Vendor  as a where a.id > 0 ");
    if (!(vendorid.equals("")))
      hql.append(" and  a.vendorid like '%" + vendorid + "%' ");

    if (!(vendorname.equals("")))
      hql.append(" and a.vendor_name like '%" + vendorname + "%' ");

    if (!(chinesename.equals("")))
      hql.append(" and a.chinesename like '%" + chinesename + "%' ");

    hql.append(" order by a.vendor_name ");
    return this.hibernateTemplate.find(hql.toString());
  }

  public List selectVendorCapacity(int pageNo, int pageSize, Vendor vendor)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    String startdate = vendor.getRemark1();
    String enddate = vendor.getRemark2();
    final StringBuffer hql = new StringBuffer();
    hql.append("from  Vendor  b  where  exists (select 1  from  Schedule   sc where   sc.vendordate >='" + startdate + "' and sc.vendordate <= '" + enddate + "'  and sc.sparecapacity > 0 and b.vendorid = sc.vendorid) ");
    if (!(vendor.getVendorid().equals("")))
      hql.append(" and b.vendorid = '" + vendor.getVendorid() + "'");

    String[] vendorall = vendor.getVendor_name().split(",");
    String vend_name = "";
    if (vendorall.length == 1)
      vend_name = "'" + vendorall[0] + "'";
    else
      for (int i = 0; i < vendorall.length; ++i)
      {
        if (i == 0)
          vend_name = "'" + vendorall[0] + "'";

        vend_name = vend_name + ",'" + vendorall[i] + "'";
      }

    if ((((vend_name.equals("")) ? 0 : 1) & ((vend_name.equals("''")) ? 0 : 1)) != 0)
      hql.append(" and b.vendor_name in (" + vend_name + ")");

    String languagebegin = vendor.getLanguagebegin();
    if (!(languagebegin.equals("")))
      hql.append(" and b.languagebegin like '%" + languagebegin + "%'");

    String Languageend = vendor.getLanguageend();
    if (!(Languageend.equals("")))
      hql.append(" and b.languageend like '%" + Languageend + "%'");

    String sdlqualityindicator = vendor.getAveragescore();
    if (!(sdlqualityindicator.equals("")))
      hql.append(" and b.vendorid in ( select e.vendorid from (select a.vendorid,a.sdlqualityindicator from Qa a ) e  where e.sdlqualityindicator >" + sdlqualityindicator + " )");

    String rate = vendor.getRate();
    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    String field = vendor.getVendor_field();
    if (!(field.equals("")))
    {
      String[] str = field.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    fg = "";

    String cat = vendor.getVendor_cat();
    if (!(cat.equals("")))
    {
      String[] str = cat.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_cat  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append(" order by b.vendor_name ");

    List list = hibernateTemplate.executeFind(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(pSize);
			query.setFirstResult((pNo - 1) * pSize);
			List result = query.list();
			if (!Hibernate.isInitialized(result))
				Hibernate.initialize(result);
			return result;
		}
	});
	return list;
    
  }

  public int countVendorCapacity(Vendor vendor)
  {
    String startdate = vendor.getRemark1();
    String enddate = vendor.getRemark2();
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(* ) from  Vendor  b  where  exists (select 1  from  Schedule   sc where   sc.vendordate >='" + startdate + "' and sc.vendordate <= '" + enddate + "'  and sc.sparecapacity > 0 and b.vendorid = sc.vendorid) ");
    if (!(vendor.getVendorid().equals("")))
      hql.append(" and b.vendorid = '" + vendor.getVendorid() + "'");

    String[] vendorall = vendor.getVendor_name().split(",");
    String vend_name = "";
    if (vendorall.length == 1)
      vend_name = "'" + vendorall[0] + "'";
    else
      for (int i = 0; i < vendorall.length; ++i)
      {
        if (i == 0)
          vend_name = "'" + vendorall[0] + "'";

        vend_name = vend_name + ",'" + vendorall[i] + "'";
      }

    if ((((vend_name.equals("")) ? 0 : 1) & ((vend_name.equals("''")) ? 0 : 1)) != 0)
      hql.append(" and b.vendor_name in (" + vend_name + ")");

    String languagebegin = vendor.getLanguagebegin();
    if (!(languagebegin.equals("")))
      hql.append(" and b.languagebegin like '%" + languagebegin + "%'");

    String Languageend = vendor.getLanguageend();
    if (!(Languageend.equals("")))
      hql.append(" and b.languageend like '%" + Languageend + "%'");

    String sdlqualityindicator = vendor.getAveragescore();
    if (!(sdlqualityindicator.equals("")))
      hql.append(" and b.vendorid in ( select e.vendorid from (select a.vendorid,a.sdlqualityindicator from Qa a ) e  where e.sdlqualityindicator > '" + sdlqualityindicator + "' )");

    String rate = vendor.getRate();
    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    String field = vendor.getVendor_field();
    if (!(field.equals("")))
    {
      String[] str = field.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    fg = "";

    String cat = vendor.getVendor_cat();
    if (!(cat.equals("")))
    {
      String[] str = cat.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_cat  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
		public Object doInHibernate(Session session)
				throws HibernateException {
			Query query = session.createQuery(hql.toString());
			query.setMaxResults(1);
			return query.uniqueResult();
		}
	});
	return count.intValue();
  }
}