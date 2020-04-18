package com.productsystem.dao.impl;

import com.productsystem.dao.ProjectDao;
import com.productsystem.model.Project;
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

@Component("projectDao")
public class ProjectDaoImpl implements ProjectDao {
  private HibernateTemplate hibernateTemplate;

  public void save(Project project)
  {
    this.hibernateTemplate.save(project);
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<Project> getProjects() {
    return this.hibernateTemplate.find("from Project");
  }

  public Project loadById(int id) {
    return ((Project)this.hibernateTemplate.load(Project.class, 
      Integer.valueOf(id)));
  }

  public void DelProjectById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelProjectById(Project project) {
    this.hibernateTemplate.delete(project);
  }

  public void updateProject(Project project) {
    this.hibernateTemplate.update(project);
  }

  public void SaveorUpdate(Project project) {
    getHibernateTemplate().saveOrUpdate(project);
  }

  public int countAll(Project project) {
    final StringBuffer hql = new StringBuffer();

    hql.append("select count(*) from   Project  as a where a.yxbz= 'Y' ");
    
    if (!project.getRemark2().equals("")) {
        hql.append(" and a.lead = '" + project.getRemark2() + "'");
        if(project.getUserposition().equals("lm/gl") & !project.getRemark2().equals(project.getLead())){
            hql.append(" and a.lmorgl = '" + project.getLead() + "'");
        }    	
    }else if(project.getUserposition().equals("lm/gl")){
    	
        hql.append(" and  a.lead = '" + project.getLead() + "'");
        
    }else if (!(project.getLead().equals("admin")) & (!project.getUserposition().equals("departmentmanager"))) {
    	
    	  hql.append(" and  a.lead = '" + project.getLead() + "'");
    }
      

    if (!(project.getCostcode().equals("")))
      hql.append(" and a.costcode like  '%" + project.getCostcode() + "%'");

    if (!(project.getDropdate().equals("")))
      hql.append(" and a.dropdate='" + project.getDropdate() + "'");

    if (!(project.getDeadline().equals("")))
      hql.append(" and a.deadline='" + project.getDeadline() + "'");

    if (!(project.getClient().equals(""))) {
      hql.append(" and a.client like '%" + project.getClient() + "%'");
    }

    if (!(project.getStatus().equals(""))) {
      hql.append(" and a.status  in   ('" + project.getStatus().replace(",", "','") + "')");
    }

    if (project.getYxbz().equals("N"))
      hql.append(" and ( a.receivedpovalue is null  or  a.receivedpovalue ='' )");
    else if (project.getYxbz().equals("Y")) {
      hql.append(" and a.receivedpovalue is not null  and a.receivedpovalue != '' ");
    }

    if (!(project.getPotype().equals(""))) {
      hql.append(" and a.potype = '" + project.getPotype() + "'");
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

  public List listAll(Project project, int pageNo, int pageSize) {
    final int pNo = pageNo;
    final int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    hql.append("from Project as a  where a.yxbz= 'Y' ");

    if (!project.getRemark2().equals("")) {
        hql.append(" and a.lead = '" + project.getRemark2() + "'");
        if(project.getUserposition().equals("lm/gl") & !project.getRemark2().equals(project.getLead())){
            hql.append(" and a.lmorgl = '" + project.getLead() + "'");
        }    	
    }else if(project.getUserposition().equals("lm/gl")){
        hql.append(" and a.lead = '" + project.getLead() + "'");
    }else if (!(project.getLead().equals("admin")) & (!project.getUserposition().equals("departmentmanager"))) {
    	
    	  hql.append(" and  a.lead = '" + project.getLead() + "'");
    }
      

    if (!(project.getCostcode().equals("")))
      hql.append(" and a.costcode like '%" + project.getCostcode().trim() + "%'");

    if (!(project.getDropdate().equals("")))
      hql.append(" and a.dropdate='" + project.getDropdate() + "'");

    if (!(project.getDeadline().equals("")))
      hql.append(" and a.deadline='" + project.getDeadline() + "'");

    if (!(project.getClient().equals(""))) {
      hql.append(" and a.client like '%" + project.getClient().trim() + "%'");
    }

    if (!(project.getStatus().equals(""))) {
      hql.append(" and a.status  in   ('" + project.getStatus().replace(",", "','") + "')");
    }

    if (project.getYxbz().equals("N"))
      hql.append(" and ( a.receivedpovalue is null  or  a.receivedpovalue ='' )");
    else if (project.getYxbz().equals("Y")) {
      hql.append(" and a.receivedpovalue is not null  and a.receivedpovalue != '' ");
    }

    if (!(project.getPotype().equals(""))) {
      hql.append(" and a.potype = '" + project.getPotype() + "'");
    }

    hql.append("order by a.deadline desc ,a.costcode desc ");

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
    return this.hibernateTemplate.find("from " + clazz + " as a order by a.id desc");
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

  public List listVendorProject(final int pageNo, final int pageSize, Project project) {
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

  public int countVendorprojectByVendorId(Project project) {
    final String hql = "select count(*) from  Project as a ";
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

  public List<Project> listProjectByTiaoJian(Project project) {
    StringBuffer hql = new StringBuffer();
    hql.append("from Project  as a where a.status !='close' ");

    if ((project.getSystemcode().equals("") & project.getSystemcode().equals("-1")))
      hql.append(" and  a.systemcode =  '" + project.getSystemcode() + "' ");

    if (!(project.getDropdate().equals("")))
      hql.append(" and  a.dropdate =  '" + project.getDropdate() + "' ");

    if ((((project.getStatus().equals("")) ? 0 : 1) & 
      ((project.getStatus().equals
      ("allstatus")) ? 0 : 1)) != 0)
      hql.append(" and  a.status =  '" + project.getStatus() + "' ");

    if ((((project.getLead().equals("admin")) ? 0 : 1) & ((project.getLead().equals("")) ? 0 : 1)) != 0)
      hql.append(" and a.lead = '" + project.getLead() + "'");

    hql.append(" order by a.id desc ");
    return this.hibernateTemplate.find(hql.toString());
  }
}