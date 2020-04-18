package com.productsystem.service.impl;

import com.productsystem.dao.DistributionDao;
import com.productsystem.model.Distribution;
import com.productsystem.service.DistributionManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("distributionManager")
public class DistributionManagerImpl
  implements DistributionManager
{
	
  @Autowired	
  private DistributionDao distributionDao;

  public void add(Distribution distribution)
    throws Exception
  {
    this.distributionDao.saveOrUpdate(distribution);
  }

  public void updateDistribution(Distribution distribution) {
    this.distributionDao.updateDistribution(distribution);
  }

  public int countDistribution() {
    return this.distributionDao.countAll("Distribution");
  }

  public List<Distribution> browseDistribution(int pageNo, int pageSize) {
    return this.distributionDao.listAll("Distribution", pageNo, pageSize);
  }

  public List<Distribution> browseDistribution() {
    return this.distributionDao.listAll("Distribution");
  }

  public List<Distribution> exportDistribution(Distribution distribution) {
    return this.distributionDao.listAll(distribution);
  }

  public boolean deleteDistribution(Integer id) {
    boolean status = false;
    try {
      this.distributionDao.deleteById(Distribution.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Distribution loadDistribution(Integer id) {
    return ((Distribution)this.distributionDao.loadById(Distribution.class, 
      id));
  }

  public boolean saveOrUpdateDistribution(Distribution distribution) {
    boolean status = false;
    try {
      this.distributionDao.save(distribution);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public DistributionDao getDistributionDao() {
    return this.distributionDao;
  }

  @Resource
  public void setDistributionDao(DistributionDao distributionDao) {
    this.distributionDao = distributionDao;
  }

  public List<Distribution> selectDistribution(int pageNo, int pageSize, Distribution distribution)
  {
    return this.distributionDao.listSelectDistribution(pageNo, pageSize, 
      distribution);
  }

  public int countSelectDistribution(Distribution distribution) {
    return this.distributionDao.coutSelectDistribution(distribution);
  }

  public int countDistributionSchedule(Distribution distribution) {
    return this.distributionDao.coutDistributionSchedule(distribution);
  }

  public List<Distribution> selectDistributionSchedule(int pageNo, int pageSize, Distribution distribution)
  {
    return this.distributionDao.listDistributionSchedule(pageNo, pageSize, 
      distribution);
  }

  public List<Distribution> listDistributionByTiaoJian(String distributionid, String distributionname, String chinesename)
  {
    return this.distributionDao.listDistributionByTiaoJian(distributionid, 
      distributionname, chinesename);
  }

  public int countSelectDistributionbysystemcode(Distribution distribution) {
    return this.distributionDao.countSelectDistributionbysystemcode
      (distribution);
  }

  public List<Distribution> ListDistributionbysystemcode(int pageNo, int pageSize, Distribution distribution)
  {
    return this.distributionDao.ListDistributionbysystemcode(pageNo, 
      pageSize, distribution);
  }
}