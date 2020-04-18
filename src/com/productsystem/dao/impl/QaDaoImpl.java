package com.productsystem.dao.impl;

import com.productsystem.dao.QaDao;
import com.productsystem.model.Qa;
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

@Component("qaDao")
public class QaDaoImpl
  implements QaDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(Qa qa)
  {
    this.hibernateTemplate.save(qa);
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Qa> getQas() {
    return this.hibernateTemplate.find("from Qa");
  }

  public Qa loadById(int id) {
    return ((Qa)this.hibernateTemplate.load(Qa.class, Integer.valueOf(id)));
  }

  public void DelQaById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelQaById(Qa qa) {
    this.hibernateTemplate.delete(qa);
  }

  public void updateQa(Qa qa) {
    this.hibernateTemplate.update(qa);
  }

  public void SaveorUpdate(Qa qa) {
    getHibernateTemplate().saveOrUpdate(qa);
  }

  public int countAll(Qa qa) {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(*) from Qa as a where 2 = 2 ");
    if (!(qa.getClientname().equals("admin"))) {
      hql.append("and ( a.lmorgl= '" + qa.getClientname() + "' or a.lead= '" + 
        qa.getClientname() + "'  or a.lead in (select username from User as  c where c.lmorgl = '" + qa.getClientname() + "')");
      hql.append("or  a.lmorgl  in  (select c.username from User as c where c.lmorgl = '" + qa.getClientname() + "' ) ");
      hql.append("or  a.lead in  (select c.username from User as c where c.lmorgl in  (select a.username from User as a where a.lmorgl = '" + 
        qa.getClientname() + "'))");
      hql.append("or  a.lmorgl  in  (select c.username from User as c where c.lmorgl in  (select a.username from User as a where a.lmorgl = '" + 
        qa.getClientname() + "' )))");
    }
    if (!(qa.getSdlcostcode().equals(""))) {
          hql.append(" and a.sdlcostcode like '%" + qa.getSdlcostcode().trim() + "%'");
    }

    if (!(qa.getVendorname().equals(""))) {
        hql.append(" and  a.vendorname like '%" + qa.getVendorname().trim() + "%'");
    }
    if (!(qa.getQadate().equals(""))) {
        hql.append(" and a.qadate >= '" + qa.getQadate() + "'");
    }
      
      if (!(qa.getYxbz().equals(""))){
          hql.append(" and a.qadate <= '" + qa.getYxbz() + "'");
      } 

    hql.append(" order by a.qadate desc ");

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

  public List listAll(Qa qa, final int pageNo, final int pageSize) {
    int pNo = pageNo;
    int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from Qa as a where  2 = 2 ");
    if (!(qa.getClientname().equals("admin"))) {
      hql.append("and ( a.lmorgl= '" + 
        qa.getClientname() + 
        "' or a.lead= '" + 
        qa.getClientname() + 
        "'  or a.lead in (select username from User as  c where c.lmorgl = '" + 
        qa.getClientname() + "')");
      hql.append("or  a.lmorgl  in  (select c.username from User as c where c.lmorgl = '" + 
        qa.getClientname() + "' ) ");
      hql.append("or  a.lead in  (select c.username from User as c where c.lmorgl in  (select a.username from User as a where a.lmorgl = '" + 
        qa.getClientname() + "')) ");
      hql.append("or  a.lmorgl  in  (select c.username from User as c where c.lmorgl in  (select a.username from User as a where a.lmorgl = '" + 
        qa.getClientname() + "' )))");
    }
    if (!(qa.getSdlcostcode().equals("")))
      hql.append(" and a.sdlcostcode  like '%" +  qa.getSdlcostcode().trim() + "%'");

    if (!(qa.getVendorname().equals("")))
      hql.append(" and a.vendorname like '%" + qa.getVendorname().trim() +  "%'");

    
    if (!(qa.getQadate().equals("")))
      hql.append(" and a.qadate >= '" + qa.getQadate() + "'");
    
    
    if (!(qa.getYxbz().equals("")))
        hql.append(" and a.qadate <= '" + qa.getYxbz() + "'");
      
      

    hql.append(" order by a.qadate desc desc");

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

  public int coutVendorQa(Qa qa) {
    final StringBuffer hql = new StringBuffer();
    hql.append(" select count(*)  from Qa as a where a.id > 0 ");
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

  public List listVendorQa(final int pageNo, final int pageSize, Qa qa) {
    int pNo = pageNo;
    int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
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

  public int countVendorqaByVendorId(Qa qa) {
    final String hql = "select count(*) from  Qa as a where a.vendorid = '" + 
      qa.getId() + "'";
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

  public List loadvendorqaByVendorId(final int pageNo, final int pageSize, Qa qa) {
    int pNo = pageNo;
    int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from Qa as a where a.vendorid = '" + qa.getId() + "'");
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

  public int countQaByTiaojian(Qa qa) {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(a.id) from  Qa as a where 1 = 1 ");
    if ((qa.getVendorname() != null) && (!(qa.getVendorname().equals(""))))
      hql.append(" and a.vendorname like '%" + qa.getVendorname().trim() + 
        "%'");

    if ((qa.getClientname() != null) && (!(qa.getClientname().equals(""))))
      hql.append(" and a.clientname like  '%" + qa.getClientname() + "%'");

    if ((qa.getSdlcostcode() != null) && (!(qa.getSdlcostcode().equals(""))))
      hql.append(" and a.sdlcostcode like  '%" + qa.getSdlcostcode() + 
        "%'");

    if ((qa.getLmorgl() != null) && (!(qa.getLmorgl().equals(""))))
      hql.append(" and a.lmorgl like  '%" + qa.getLmorgl() + "%'");

    if ((qa.getLead() != null) && (!(qa.getLead().equals(""))))
      hql.append(" and a.lead like  '%" + qa.getLead() + "%'");

    if ((qa.getEvaluatorname() != null) && 
      (!(qa.getEvaluatorname().equals(""))))
      hql.append(" and a.evaluatorname like '%" + qa.getEvaluatorname() + 
        "%'");

    if ((qa.getStartdate() != null) && (!(qa.getStartdate().equals(""))))
      hql.append(" and a.qadate>='" + qa.getStartdate() + "'");

    if ((qa.getEnddate() != null) && (!(qa.getEnddate().equals(""))))
      hql.append(" and a.qadate <='" + qa.getEnddate() + "'");

    if ((qa.getSector() != null) && (!(qa.getSector().equals(""))))
      hql.append(" and a.sector  like  '%" + qa.getSector() + "%'");

    if ((qa.getTranslationtype() != null) && 
      (!(qa.getTranslationtype().equals(""))))
      hql.append(" and a.translationtype ='" + qa.getTranslationtype() + 
        "'");

    if ((qa.getTargetlanguage() != null) && 
      (!(qa.getTargetlanguage().equals(""))))
      hql.append(" and a.targetlanguage = '" + qa.getTargetlanguage() + 
        "'");

    if ((qa.getSourcelanguage() != null) && 
      (!(qa.getSourcelanguage().equals(""))))
      hql.append(" and a.sourcelanguage  =  '" + qa.getSourcelanguage() + 
        "'");

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


  public List loadQaByTiaojian(int pageNo, int pageSize, Qa qa) {
    final int pNo = pageNo;
    final int pSize = pageSize;

    final StringBuffer hql = new StringBuffer();

    hql.append("from Qa as a where  1 = 1 ");
    if ((qa.getVendorname() != null) && (!(qa.getVendorname().equals(""))))
      hql.append(" and a.vendorname like '%" + qa.getVendorname().trim() + 
        "%'");

    if ((qa.getClientname() != null) && (!(qa.getClientname().equals(""))))
      hql.append(" and a.clientname like  '%" + qa.getClientname() + "%'");

    if ((qa.getSdlcostcode() != null) && (!(qa.getSdlcostcode().equals(""))))
      hql.append(" and a.sdlcostcode like  '%" + qa.getSdlcostcode() + 
        "%'");

    if ((qa.getLmorgl() != null) && (!(qa.getLmorgl().equals(""))))
      hql.append(" and a.lmorgl like  '%" + qa.getLmorgl() + "%'");

    if ((qa.getLead() != null) && (!(qa.getLead().equals(""))))
      hql.append(" and a.lead like  '%" + qa.getLead() + "%'");

    if ((qa.getEvaluatorname() != null) && 
      (!(qa.getEvaluatorname().equals(""))))
      hql.append(" and a.evaluatorname like '%" + qa.getEvaluatorname() + 
        "%'");

    if ((qa.getStartdate() != null) && (!(qa.getStartdate().equals(""))))
      hql.append(" and a.qadate>='" + qa.getStartdate() + "'");

    if ((qa.getEnddate() != null) && (!(qa.getEnddate().equals(""))))
      hql.append(" and a.qadate <='" + qa.getEnddate() + "'");

    if ((qa.getSector() != null) && (!(qa.getSector().equals(""))))
      hql.append(" and a.sector  like  '%" + qa.getSector() + "%'");

    if ((qa.getTranslationtype() != null) && 
      (!(qa.getTranslationtype().equals(""))))
      hql.append(" and a.translationtype ='" + qa.getTranslationtype() + 
        "'");

    if ((qa.getTargetlanguage() != null) && 
      (!(qa.getTargetlanguage().equals(""))))
      hql.append(" and a.targetlanguage = '" + qa.getTargetlanguage() + 
        "'");

    if ((qa.getSourcelanguage() != null) && 
      (!(qa.getSourcelanguage().equals(""))))
      hql.append(" and a.sourcelanguage  =  '" + qa.getSourcelanguage() + 
        "'");

    hql.append(" order by a.qadate desc ");

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