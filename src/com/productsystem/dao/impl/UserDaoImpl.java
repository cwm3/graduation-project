package com.productsystem.dao.impl;

import com.opensymphony.xwork2.ActionContext;
import com.productsystem.dao.UserDao;
import com.productsystem.model.User;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component("userDao")
public class UserDaoImpl
  implements UserDao
{
  private HibernateTemplate hibernateTemplate;

  public void save(User u)
  {
    this.hibernateTemplate.save(u);
  }

  public boolean checkUserExistsWithName(String username, String password) {
    List users = this.hibernateTemplate.find
      ("from User u where u.username = '" + username + 
      "' and u.password ='" + password + "'");

    return ((users != null) && (users.size() > 0));
  }

  public User loadByName(String username)
  {
    List users = this.hibernateTemplate.find
      ("from User u where u.username = '" + username + "'");
    if (users.size() == 1)
      return ((User)users.get(0));

    return null;
  }

  public HibernateTemplate getHibernateTemplate() {
    return this.hibernateTemplate;
  }

  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  public List<User> getUsers() {
    return this.hibernateTemplate.find("from User");
  }

  public User loadById(int id) {
    return ((User)this.hibernateTemplate.load(User.class, 
      Integer.valueOf(id)));
  }

  public void DelUserById(int id) {
    getHibernateTemplate().delete(
      getHibernateTemplate().load(super.getClass(), Integer.valueOf(id)));
  }

  public void DelUserById(User u) {
    this.hibernateTemplate.delete(u);
  }

  public void updateUser(User u) {
    this.hibernateTemplate.update(u);
  }

  public void SaveorUpdate(User u) {
    getHibernateTemplate().saveOrUpdate(u);
  }

  public int countAll(User user) {
    final StringBuffer hql = new StringBuffer();
    ActionContext ctx = ActionContext.getContext();
    String userposition = ctx.getSession().get("userposition").toString();
    hql.append("select count(*) from User as a  where a.yxbz= 'Y'");
    if ((!(user.getUsername().equals("admin"))) || 
      (userposition.equals("departmentmanager")))
      hql.append(" and ( a.username = '" + user.getUsername() + 
        "' or a.lmorgl = '" + user.getUsername() + "')");

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

  public List listAll(User user, int pageNo, int pageSize) {
    final int pNo = pageNo;
    final int pSize = pageSize;
    final StringBuffer hql = new StringBuffer();
    ActionContext ctx = ActionContext.getContext();
    String userposition = ctx.getSession().get("userposition").toString();
    hql.append(" from User as a  where a.yxbz= 'Y'  ");
    if ((!(user.getUsername().equals("admin"))) || 
      (userposition.equals("departmentmanager")))
      hql.append(" and ( a.username = '" + user.getUsername() + 
        "' or a.lmorgl = '" + user.getUsername() + "')");

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
}