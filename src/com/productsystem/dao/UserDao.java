package com.productsystem.dao;

import com.productsystem.model.User;
import java.io.Serializable;
import java.util.List;

public abstract interface UserDao
{
  public abstract boolean checkUserExistsWithName(String paramString1, String paramString2);

  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract User loadByName(String paramString);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void updateUser(User paramUser);

  public abstract int countQuery(String paramString);

  public abstract List listAll(User paramUser, int paramInt1, int paramInt2);

  public abstract List listAll(String paramString);

  public abstract int countAll(User paramUser);
}