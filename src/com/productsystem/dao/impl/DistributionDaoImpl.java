package com.productsystem.dao.impl;

import com.productsystem.dao.DistributionDao;
import com.productsystem.model.Distribution;
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

@Component("distributionDao")
public class DistributionDaoImpl
  implements DistributionDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(Distribution distribution)
  {
    this.hibernateTemplate.save(distribution);
  }

  public boolean checkDistributionExistsWithName(String distributionid, String distribution_name)
  {
    List distributions = this.hibernateTemplate.find("from Distribution  as a where a.distributionid = '" + 
      distributionid + "'  and  a.yxbz='Y'   and a.distribution_name = '" + distribution_name + "'");

    return ((distributions != null) && (distributions.size() > 0));
  }

  public HibernateTemplate getHibernateTemplate()
  {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Distribution> getDistributions() {
    return this.hibernateTemplate.find("from Distribution");
  }

  public Distribution loadById(int id) {
    return ((Distribution)this.hibernateTemplate.load(Distribution.class, 
      Integer.valueOf(id)));
  }

  public void DelDistributionById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelDistributionById(Distribution u) {
    this.hibernateTemplate.delete(u);
  }

  public void updateDistribution(Distribution u) {
    this.hibernateTemplate.update(u);
  }

  public int countAll(String clazz) {
    final String hql = "select count(*) from " + clazz + " as a  where a.yxbz='Y'  ";
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
  public List listAll(String clazz, final int pageNo, final int pageSize) {
    int pNo = pageNo;
    int pSize = pageSize;
    final String hql = "from " + clazz + " as a where a.yxbz='Y'  order by a.id desc";
    List list = hibernateTemplate.executeFind(new HibernateCallback() {
  		public Object doInHibernate(Session session)
  				throws HibernateException {
  			Query query = session.createQuery(hql.toString());
  			query.setMaxResults(pageSize);
  			query.setFirstResult((pageNo - 1) * pageSize);
  			List result = query.list();
  			if (!Hibernate.isInitialized(result))
  				Hibernate.initialize(result);
  			return result;
  		}
  	});
  	return list;
  }
  public List listAll(String clazz) {
    return this.hibernateTemplate.find("from " + clazz + " as a where a.yxbz='Y' order by a.id desc");
  }

  public List listAll(Distribution distribution) {
    StringBuffer hql = new StringBuffer();
    hql.append(" from Distribution as a where a.yxbz='Y'  ");
    hql.append(" order by a.distributionid desc ");
    return this.hibernateTemplate.find(hql.toString());
  }

  public void saveOrUpdate(Distribution distribution) {
    this.hibernateTemplate.saveOrUpdate(distribution);
  }

  public void deleteById(Class clazz, Serializable id) {
    this.hibernateTemplate.delete(this.hibernateTemplate.load(clazz, id));
  }

  public Object loadById(Class clazz, Serializable id) {
    return this.hibernateTemplate.get(clazz, id);
  }

  public List listSelectDistribution(int pageNo, int pageSize, Distribution distribution) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();
    hql.append(" from Distribution as a where a.yxbz='Y'   ");
    if (!(distribution.getSystemcode().equals("")))
      hql.append(" and  a.systemcode in (" + distribution.getSystemcode() + 
        ")");

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

  public int coutSelectDistribution(Distribution distribution) {
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(*)  from Distribution as a where a.yxbz='Y' ");
    if (!(distribution.getSystemcode().equals("")))
      hql.append(" and  a.systemcode in (" + distribution.getSystemcode() + 
        ")");

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

  public int coutDistributionSchedule(Distribution distribution) {
    final StringBuffer hql = new StringBuffer();

    hql.append(" select count(*)  from Distribution as a  where a.yxbz='Y'  ");

    if ((distribution.getRemark3() != null) & distribution.getRemark3().equals("lm/gl"))
    {
      hql.append(" and  a.lead = '" + distribution.getRemark4() + "'");
    }

    if (!(distribution.getResource().equals(""))) {
      hql.append(" and  a.resource = '" + distribution.getResource() + "'");
    }

    if (distribution.getOutsourcedponumber().equals("N"))
      hql.append(" and ( a.outsourcedponumber is null or a.outsourcedponumber='')");
    else if (distribution.getOutsourcedponumber().equals("Y")) {
      hql.append(" and ( a.outsourcedponumber is not null and  a.outsourcedponumber !='')");
    }

    if (!(distribution.getHo().equals(""))) {
      hql.append(" and  a.ho = '" + distribution.getHo() + "'");
    }

    if (!(distribution.getComments().equals(""))) {
      hql.append(" and a.systemcode in (select c.systemcode from  Project c  where c.client like '%" + distribution.getComments() + "%' )");
    }

    if (!(distribution.getSystemcode().equals(""))) {
      hql.append(" and a.systemcode in (select c.systemcode from  Project c  where c.costcode like '%" + distribution.getSystemcode() + "%' )");
    }

    if (!(distribution.getVendorname().equals(""))) {
      hql.append(" and  a.vendorname like '%" + distribution.getVendorname() + "%'");
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

  public List listDistributionSchedule(int pageNo, int pageSize, Distribution distribution)
  {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();
    hql.append("from Distribution as a  where a.yxbz='Y' ");
    if ((distribution.getRemark3() != null) & distribution.getRemark3().equals("lm/gl"))
    {
      hql.append(" and  a.lead = '" + distribution.getRemark4() + "'");
    }

    if (!(distribution.getResource().equals(""))) {
      hql.append(" and  a.resource = '" + distribution.getResource() + "'");
    }

    if (distribution.getOutsourcedponumber().equals("N"))
      hql.append(" and ( a.outsourcedponumber is null or a.outsourcedponumber='')");
    else if (distribution.getOutsourcedponumber().equals("Y")) {
      hql.append(" and ( a.outsourcedponumber is not null and  a.outsourcedponumber !='')");
    }

    if (!(distribution.getHo().equals(""))) {
      hql.append(" and  a.ho = '" + distribution.getHo() + "'");
    }

    if (!(distribution.getComments().equals(""))) {
      hql.append(" and a.systemcode in (select c.systemcode from  Project c  where c.client like '%" + distribution.getComments() + "%' )");
    }

    if (!(distribution.getSystemcode().equals(""))) {
      hql.append(" and a.systemcode in (select c.systemcode from  Project c  where c.costcode like '%" + distribution.getSystemcode() + "%' )");
    }

    if (!(distribution.getVendorname().equals(""))) {
      hql.append(" and  a.vendorname like '%" + distribution.getVendorname() + "%'");
    }

    hql.append(" order by a.enddate desc,a.systemcode ");

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

  public List<Distribution> listDistributionByTiaoJian(String distributionid, String distributionname, String chinesename)
  {
    StringBuffer hql = new StringBuffer();
    hql.append("from Distribution  as a  where a.yxbz='Y' ");
    if (!(distributionid.equals("")))
      hql.append(" and  a.distributionid like '%" + distributionid + "%' ");

    if (!(distributionname.equals("")))
      hql.append(" and a.distribution_name like '%" + distributionname + "%' ");

    if (!(chinesename.equals("")))
      hql.append(" and a.chinesename like '%" + chinesename + "%' ");

    hql.append(" order by a.startdate desc,systemcode ");

    return this.hibernateTemplate.find(hql.toString());
  }

  public int countSelectDistributionbysystemcode(Distribution distribution) {
    StringBuffer hql = new StringBuffer();

    hql.append(" select count(*)  from Distribution as a  where a.yxbz='Y'  ");
    if (!(distribution.getSystemcode().equals("")))
      hql.append(" and  a.systemcode = '" + distribution.getSystemcode() + "'");

    Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
  		public Object doInHibernate(Session session)
  				throws HibernateException {
  			Query query = session.createQuery("select count(*) from  CostCode as a ");
  			query.setMaxResults(1);
  			return query.uniqueResult();
  		}
  	});
  	return count.intValue();
  }

  public List ListDistributionbysystemcode(int pageNo, int pageSize, Distribution distribution) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();
    hql.append("from Distribution as a  where a.yxbz='Y'  ");
    if (!(distribution.getSystemcode().equals("")))
      hql.append(" and  a.systemcode = '" + distribution.getSystemcode() + "'");

    hql.append(" order by a.id desc ");

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