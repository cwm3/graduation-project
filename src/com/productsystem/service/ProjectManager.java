package com.productsystem.service;

import com.productsystem.model.Project;
import java.util.List;

public abstract interface ProjectManager
{
  public abstract void add(Project paramProject)
    throws Exception;

  public abstract void updateProject(Project paramProject);

  public abstract Project loadProject(Integer paramInteger);

  public abstract boolean deleteProject(Integer paramInteger);

  public abstract boolean saveOrUpdateProject(Project paramProject);

  public abstract void save(Project paramProject);

  public abstract int countProject(Project paramProject);

  public abstract List<Project> browseProject(int paramInt1, int paramInt2, Project paramProject);

  public abstract List<Project> browseProject();

  public abstract List<Project> listProjectByTiaoJian(Project paramProject);
}