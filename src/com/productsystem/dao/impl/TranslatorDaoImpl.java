package com.productsystem.dao.impl;

import com.productsystem.dao.TranslatorDao;
import com.productsystem.model.Translator;
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

@Component("translatorDao")
public class TranslatorDaoImpl
  implements TranslatorDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(Translator translator)
  {
    this.hibernateTemplate.save(translator);
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Translator> getTranslators() {
    return this.hibernateTemplate.find("from Translator");
  }

  public Translator loadById(int id) {
    return ((Translator)this.hibernateTemplate.load(Translator.class, 
      Integer.valueOf(id)));
  }

  public void DelTranslatorById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelTranslatorById(Translator translator) {
    this.hibernateTemplate.delete(translator);
  }

  public void updateTranslator(Translator translator) {
    this.hibernateTemplate.update(translator);
  }

  public void SaveorUpdate(Translator translator) {
    getHibernateTemplate().saveOrUpdate(translator);
  }

  public int countAll(Translator translator) {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(*) from   Translator  as a where 1 = 1  ");

    if ((((translator.getTranslatorname() != null) ? 1 : 0) & ((translator.getTranslatorname().equals("")) ? 0 : 1)) != 0) {
      hql.append(" and  a.translatorname like  '%" + translator.getTranslatorname() + "%'");
    }

    if ((((translator.getOffice() != null) ? 1 : 0) & ((translator.getOffice().equals("")) ? 0 : 1)) != 0) {
      hql.append(" and  a.office like  '%" + translator.getOffice() + "%'");
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

  public int countAll() {
    final StringBuffer hql = new StringBuffer();
    hql.append("select count(*) from   Translator  as a where a.yxbz= 'Y' ");

    hql.append(" order by a.translatorid desc ");

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
    hql.append("from Translator as a  where a.yxbz= 'Y' ");

    hql.append("order by a.translatorid  ");
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

  public int countQuery(final String hql) {
    String counthql = hql;
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

  public List listAll(final int pageNo, final int pageSize, Translator translator) {
    int pNo = pageNo;
    int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from Translator as a  where a.yxbz= 'Y' ");
    if ((((translator.getTranslatorname() != null) ? 1 : 0) & ((translator.getTranslatorname().equals("")) ? 0 : 1)) != 0) {
      hql.append(" and  a.translatorname like  '%" + translator.getTranslatorname() + "%'");
    }

    if ((((translator.getOffice() != null) ? 1 : 0) & ((translator.getOffice().equals("")) ? 0 : 1)) != 0)
      hql.append(" and  a.office like  '%" + translator.getOffice() + "%'");

    hql.append("order by a.translatorname  ");
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
    return this.hibernateTemplate.find("from " + clazz + " as a order by a.translatorid desc");
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

  public List listVendorTranslator(final int pageNo, final int pageSize, Translator translator) {
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

  public int countVendortranslatorByVendorId(Translator translator) {
    final String hql = "select count(*) from  Translator as a ";
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

  public List<Translator> listTranslatorByTiaoJian(Translator translator) {
    StringBuffer hql = new StringBuffer();
    hql.append("from Translator  as a where a.translatorid > 0 ");

    hql.append(" order by a.translatorid desc ");

    return this.hibernateTemplate.find(hql.toString());
  }
}