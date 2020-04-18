package com.productsystem.dao.impl;

import com.productsystem.dao.ScheduleDao;
import com.productsystem.model.Schedule;
import java.io.PrintStream;
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

@Component("scheduleDao")
public class ScheduleDaoImpl
  implements ScheduleDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(Schedule schedule)
  {
    this.hibernateTemplate.save(schedule);
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Schedule> getSchedules() {
    return this.hibernateTemplate.find("from Schedule");
  }

  public Schedule loadById(int id) {
    return ((Schedule)this.hibernateTemplate.load(Schedule.class, 
      Integer.valueOf(id)));
  }

  public void DelScheduleById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelScheduleById(Schedule schedule) {
    this.hibernateTemplate.delete(schedule);
  }

  public void updateSchedule(Schedule schedule) {
    this.hibernateTemplate.update(schedule);
  }

  public void SaveorUpdate(Schedule schedule) {
    getHibernateTemplate().saveOrUpdate(schedule);
  }

  public int countAll(Schedule schedule) {
    final String hql = "select count(*) from   Schedule  as a where a.vendordate >= CURDATE()  and a.capacity >= 0 and  a.yxbz= 'Y' and a.vendorid = '" + 
      schedule.getVendorid() + "'";
    System.out.println(hql);
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

  public List listAll(Schedule schedule, int pageNo, int pageSize) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final String hql = "from Schedule as a where a.vendorid = '" + 
      schedule.getVendorid() + 
      "' and a.vendordate >= CURDATE() and a.capacity >=0 and a.yxbz= 'Y' order by a.vendordate ";

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

  public List listAll(String clazz) {
    return this.hibernateTemplate.find("from " + clazz + 
      " as a order by a.id desc");
  }

  public void saveOrUpdate(Object obj) {
    this.hibernateTemplate.saveOrUpdate(obj);
  }

  public void deleteById(Class clazz, Serializable id) {
    this.hibernateTemplate.delete(this.hibernateTemplate.load(clazz, id));
  }

  public Object loadById(Class clazz, Serializable id) {
    return this.hibernateTemplate.get(clazz, id);
  }

  public int coutVendorSchedule(Schedule schedule) {
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(*)  from Vendor as a where a.id > 0 ");
    if (!(schedule.getVendorid().equals("")))
      hql.append(" and  a.vendorid = '" + schedule.getVendorid() + "'");

    if (!(schedule.getCapacity().equals("")))
      hql.append(" and a.capacity = '" + schedule.getCapacity() + "'");

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

  public List listVendorSchedule(int pageNo, int pageSize, Schedule schedule) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();

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

  public int countVendorscheduleByVendorId(Schedule schedule) {
    final String hql = "select count(*) from  Schedule as a where a.vendorid = '" + 
      schedule.getVendorid() + "'";
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

  public List loadvendorscheduleByVendorId(int pageNo, int pageSize, Schedule schedule)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();

    hql.append("from Schedule as a where a.vendorid = '" + 
      schedule.getVendorid() + "'");

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

  public int countLastMonthAll(Schedule schedule) {
    final String hql = "select count(*) from   schedule  a where  a.yxbz= 'Y' and a.vendorid = '" + 
      schedule.getVendorid() + "'  and a.vendordate < CURDATE()  ";
    System.out.println(hql);
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

  public List listLastMonthAll(Schedule schedule, int pageNo, int pageSize) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final String hql = "from schedule as a where a.vendorid = '" + 
      schedule.getVendorid() + 
      "'  and a.yxbz= 'Y'  and a.vendordate < CURDATE()  order by a.vendordate ";

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

  public int countScheduleByTiaoJian(Schedule schedule) {
    String startdate = schedule.getStartdate();
    String enddate = schedule.getEnddate();
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(* ) from  Vendor  b  where  exists (select 1  from  Schedule   sc where   sc.vendordate >='" + 
      startdate + 
      "' and sc.vendordate <= '" + 
      enddate + 
      "'  and sc.sparecapacity > 0 and b.vendorid = sc.vendorid) ");
    if (!(schedule.getVendorid().equals("")))
      hql.append(" and b.vendorid = '" + schedule.getVendorid() + "'");

    String[] vendorall = schedule.getVendorname().split(",");
    String vend_name = "";
    if (vendorall.length == 1)
      vend_name = "'" + vendorall[0] + "'";
    else
      for (int i = 0; i < vendorall.length; ++i) {
        if (i == 0)
          vend_name = "'" + vendorall[0] + "'";

        vend_name = vend_name + ",'" + vendorall[i] + "'";
      }

    if ((((vend_name.equals("")) ? 0 : 1) & ((vend_name.equals("''")) ? 0 : 1)) != 0)
      hql.append(" and b.vendor_name in (" + vend_name + ")");

    String languagebegin = schedule.getRemark1();
    if (!(languagebegin.equals("")))
      hql.append(" and b.Languagebegin like '%" + languagebegin + "%'");

    String Languageend = schedule.getRemark2();
    if (!(Languageend.equals("")))
      hql.append(" and b.Languageend like '%" + Languageend + "%'");

    String sdlqualityindicator = schedule.getDailycapacity();
    if (!(sdlqualityindicator.equals("")))
      hql.append(" and b.vendorid in ( select vendorid from (SELECT a.vendorid,AVG(a.sdlqualityindicator) sdlqualityindicator FROM Qa a group by a.vendorid) e  where e.sdlqualityindicator > " + 
        schedule.getBookedcapacity() + ")");

    String rate = schedule.getYf();
    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    String field = schedule.getNd();
    if (!(field.equals(""))) {
      String[] str = field.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    fg = "";

    String cat = schedule.getRz();
    if (!(cat.equals(""))) {
      String[] str = cat.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
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

  public List browseScheduleByTiaoJian(int pageNo, int pageSize, Schedule schedule)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    String startdate = schedule.getStartdate();
    String enddate = schedule.getEnddate();
    final StringBuffer hql = new StringBuffer();
    hql.append("from  Schedule a  where  a.yxbz='Y' and a.vendordate >= '" + 
      startdate + 
      "' and a.vendordate <= '" + 
      enddate + 
      "'  and exists (select 1 from  Vendor b  where a.vendorid =  b.vendorid ");
    if (!(schedule.getVendorid().equals("")))
      hql.append(" and b.vendorid = '" + schedule.getVendorid() + "'");

    String[] vendorall = schedule.getVendorname().split(",");
    String vend_name = "";
    if (vendorall.length == 1)
      vend_name = "'" + vendorall[0] + "'";
    else
      for (int i = 0; i < vendorall.length; ++i) {
        if (i == 0)
          vend_name = "'" + vendorall[0] + "'";

        vend_name = vend_name + ",'" + vendorall[i] + "'";
      }

    if ((((vend_name.equals("")) ? 0 : 1) & ((vend_name.equals("''")) ? 0 : 1)) != 0)
      hql.append(" and b.vendor_name in (" + vend_name + ")");

    String languagebegin = schedule.getRemark1();
    if (!(languagebegin.equals("")))
      hql.append(" and b.Languagebegin like '%" + languagebegin + "%'");

    String Languageend = schedule.getRemark2();
    if (!(Languageend.equals("")))
      hql.append(" and b.Languageend like '%" + Languageend + "%'");

    String sdlqualityindicator = schedule.getDailycapacity();
    if (!(sdlqualityindicator.equals("")))
      hql.append(" and b.vendorid in ( select vendorid from (SELECT a.vendorid,AVG(a.sdlqualityindicator) sdlqualityindicator FROM Qa a group by a.vendorid) e  where e.sdlqualityindicator > " + 
        sdlqualityindicator + ")");

    String rate = schedule.getYf();
    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    String field = schedule.getNd();
    if (!(field.equals(""))) {
      String[] str = field.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    fg = "";

    String cat = schedule.getRz();
    if (!(cat.equals(""))) {
      String[] str = cat.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_cat  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append(" ) ");

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
}