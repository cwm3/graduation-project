package com.productsystem.service.impl;

import com.productsystem.dao.ProjectDao;
import com.productsystem.model.Project;
import com.productsystem.service.ProjectManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("projectManager")
public class ProjectManagerImpl
  implements ProjectManager
{
  @Autowired	
  private ProjectDao projectDao;

  public void add(Project project)
    throws Exception
  {
    this.projectDao.saveOrUpdate(project);
  }

  public void updateProject(Project project) {
    this.projectDao.updateProject(project);
  }

  public int countProject(Project project) {
    return this.projectDao.countAll(project);
  }

  public List<Project> browseProject(int pageNo, int pageSize, Project project) {
    return this.projectDao.listAll(project, pageNo, pageSize);
  }

  public List<Project> browseProject() {
    return this.projectDao.listAll("Project");
  }

  public boolean deleteProject(Integer id) {
    boolean status = false;
    try {
      this.projectDao.deleteById(Project.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Project loadProject(Integer id) {
    return ((Project)this.projectDao.loadById(Project.class, id));
  }

  public boolean saveOrUpdateProject(Project project) {
    boolean status = false;
    try {
      this.projectDao.saveOrUpdate(project);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public ProjectDao getProjectDao() {
    return this.projectDao;
  }

  @Resource
  public void setProjectDao(ProjectDao projectDao) {
    this.projectDao = projectDao;
  }

  public void save(Project project) {
    this.projectDao.save(project);
  }

  public List<Project> listProjectByTiaoJian(Project project) {
    return this.projectDao.listProjectByTiaoJian(project);
  }
}