package com.productsystem.dao;

import com.productsystem.model.Project;
import java.io.Serializable;
import java.util.List;

public abstract interface ProjectDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void save(Project paramProject);

  public abstract void updateProject(Project paramProject);

  public abstract int countQuery(String paramString);

  public abstract List listAll(Project paramProject, int paramInt1, int paramInt2);

  public abstract List listAll(String paramString);

  public abstract int countAll(Project paramProject);

  public abstract List<Project> listProjectByTiaoJian(Project paramProject);
}