package com.productsystem.service;

import com.productsystem.model.User;
import java.util.List;

public abstract interface UserManager
{
  public abstract boolean exists(User paramUser)
    throws Exception;

  public abstract void add(User paramUser)
    throws Exception;

  public abstract void updateUser(User paramUser);

  public abstract User loadUser(Integer paramInteger);

  public abstract User loadUserByName(String paramString);

  public abstract boolean deleteUser(Integer paramInteger);

  public abstract boolean saveOrUpdateUser(User paramUser);

  public abstract int countUser(User paramUser);

  public abstract List<User> browseUser(int paramInt1, int paramInt2, User paramUser);

  public abstract List<User> browseUser();
}