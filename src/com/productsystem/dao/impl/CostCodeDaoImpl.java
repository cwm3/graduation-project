package com.productsystem.dao.impl;

import com.productsystem.dao.CostCodeDao;
import com.productsystem.model.CostCode;
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

@Component("costcodeDao")
public class CostCodeDaoImpl
  implements CostCodeDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(CostCode costcode)
  {
    this.hibernateTemplate.save(costcode);
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<CostCode> getCostCodes() {
    return this.hibernateTemplate.find("from CostCode");
  }

  public CostCode loadById(int id) {
    return ((CostCode)this.hibernateTemplate.load(CostCode.class, 
      Integer.valueOf(id)));
  }

  public void DelCostCodeById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelCostCodeById(CostCode costcode) {
    this.hibernateTemplate.delete(costcode);
  }

  public void updateCostCode(CostCode costcode) {
    this.hibernateTemplate.update(costcode);
  }

  public void SaveorUpdate(CostCode costcode) {
    getHibernateTemplate().saveOrUpdate(costcode);
  }

  public int countAll(CostCode costcode) {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(*) from   CostCode  as a where a.yxbz= 'Y' ");
    if ((!costcode.getLead().equals("admin")) &&  (!costcode.getLead().equals(""))) {
    	
        hql.append(" and  a.lead =  '" + costcode.getLead() + "' ");
    }

    if (!costcode.getClientname().equals("")) {
    	
       hql.append(" and  a.clientname like  '%" +costcode.getClientname() + "%' ");
    }
    if(!costcode.getCostcode().equals("")){
        hql.append(" and ( substring(a.costcode, 1, 3)  = '" +costcode.getCostcode()+ "' or a.costcode='" +costcode.getCostcode()+ "')");
      }

    if (!costcode.getDatedate().equals("")) {
      hql.append(" and  a.datedate =  '" + costcode.getDatedate() + "' ");
    }
    String fg = "";
    if (!(costcode.getVendor_field().equals(""))) {
      String[] str = costcode.getVendor_field().split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " a.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append(" order by a.id desc ");

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

  public int countAll() {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(*) from   CostCode  as a where a.yxbz= 'Y' ");

    hql.append(" order by a.id desc ");

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


  public List listAll(final int pageNo, final int pageSize) {
    int pNo = pageNo;
    int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from CostCode as a  where a.yxbz= 'Y' ");

    hql.append("order by a.costcode  ");
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

  public List listAll(int pageNo, int pageSize, CostCode costcode) {
    final int pNo = pageNo;
    final int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from CostCode as a  where a.yxbz= 'Y' ");
    if ((!(costcode.getLead().equals("admin"))) && 
      (!(costcode.getLead().equals(""))))
      hql.append(" and  a.lead =  '" + costcode.getLead() + "' ");

    if (!(costcode.getClientname().equals("")))
      hql.append(" and  a.clientname like   '%" + 
        costcode.getClientname() + "%' ");

    if (!costcode.getCostcode().equals("")){
        hql.append(" and ( substring(a.costcode, 1, 3)  = '" +costcode.getCostcode()+ "' or a.costcode='" +costcode.getCostcode()+ "')");
    }
    if (!(costcode.getDatedate().equals("")))
      hql.append(" and  a.datedate =  '" + costcode.getDatedate() + "' ");

    String fg = "";
    if (!(costcode.getVendor_field().equals(""))) {
      String[] str = costcode.getVendor_field().split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i) {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " a.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append("order by a.costcode  ");
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

  public List listVendorCostCode(int pageNo, int pageSize, CostCode costcode) {
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

  public int countVendorcostcodeByVendorId(CostCode costcode) {
    String hql = "select count(*) from  CostCode as a ";
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



  public List<CostCode> listCostCodeByTiaoJian(CostCode costcode) {
    StringBuffer hql = new StringBuffer();
    hql.append("from CostCode  as a where a.id > 0 ");
    if ((!(costcode.getLead().equals("admin"))) && 
      (!(costcode.getLead().equals(""))))
      hql.append(" and  a.lead =  '" + costcode.getLead() + "' ");

    hql.append(" order by a.id desc ");

    return this.hibernateTemplate.find(hql.toString());
  }
}