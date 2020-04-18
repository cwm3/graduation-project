package com.productsystem.service.impl;

import com.productsystem.dao.UserDao;
import com.productsystem.model.User;
import com.productsystem.service.UserManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("userManager")
public class UserManagerImpl
  implements UserManager
{
  @Autowired	 
  private UserDao userDao;

  public boolean exists(User u)
    throws Exception
  {
    return this.userDao.checkUserExistsWithName(u.getUsername(), 
      u.getPassword());
  }

  public void add(User u) throws Exception {
    this.userDao.saveOrUpdate(u);
  }

  public void updateUser(User u) {
    this.userDao.updateUser(u);
  }

  public List<User> browseUser() {
    return this.userDao.listAll("User");
  }

  public boolean deleteUser(Integer id) {
    boolean status = false;
    try {
      this.userDao.deleteById(User.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public User loadUser(Integer id) {
    return ((User)this.userDao.loadById(User.class, id));
  }

  public boolean saveOrUpdateUser(User user) {
    boolean status = false;
    try {
      this.userDao.saveOrUpdate(user);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public UserDao getUserDao() {
    return this.userDao;
  }

  @Resource
  public void setUserDao(UserDao userDao) {
    this.userDao = userDao;
  }

  public User loadUserByName(String username) {
    return this.userDao.loadByName(username);
  }

  public int countUser(User user) {
    return this.userDao.countAll(user);
  }

  public List<User> browseUser(int pageNo, int pageSize, User user) {
    return this.userDao.listAll(user, pageNo, pageSize);
  }
}