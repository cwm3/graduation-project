package com.productsystem.service.impl;

import com.productsystem.dao.QaDao;
import com.productsystem.model.Qa;
import com.productsystem.service.QaManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("qaManager")
public class QaManagerImpl
  implements QaManager
{
  @Autowired	  
  private QaDao qaDao;

  public void add(Qa qa)
    throws Exception
  {
    this.qaDao.saveOrUpdate(qa);
  }

  public void updateQa(Qa qa) {
    this.qaDao.updateQa(qa);
  }

  public int countQa(Qa qa) {
    return this.qaDao.countAll(qa);
  }

  public List<Qa> browseQa(int pageNo, int pageSize, Qa qa) {
    return this.qaDao.listAll(qa, pageNo, pageSize);
  }

  public List<Qa> browseQa() {
    return this.qaDao.listAll("Qa");
  }

  public boolean deleteQa(Integer id) {
    boolean status = false;
    try {
      this.qaDao.deleteById(Qa.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Qa loadQa(Integer id) {
    return ((Qa)this.qaDao.loadById(Qa.class, id));
  }

  public boolean saveOrUpdateQa(Qa qa) {
    boolean status = false;
    try {
      this.qaDao.saveOrUpdate(qa);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public QaDao getQaDao() {
    return this.qaDao;
  }

  @Resource
  public void setQaDao(QaDao qaDao) {
    this.qaDao = qaDao;
  }

  public void save(Qa qa) {
    this.qaDao.save(qa);
  }

  public int countVendorQa(Qa qa) {
    return this.qaDao.coutVendorQa(qa);
  }

  public List<Qa> selectVendorQa(int pageNo, int pageSize, Qa qa) {
    return this.qaDao.listVendorQa(pageNo, pageSize, qa);
  }

  public int countVendorqaByVendorId(Qa qa) {
    return this.qaDao.countVendorqaByVendorId(qa);
  }

  public List<Qa> loadvendorqaByVendorId(int pageNo, int pageSize, Qa qa) {
    return this.qaDao.loadvendorqaByVendorId(pageNo, pageSize, qa);
  }

  public int countQaByTiaojian(Qa qa) {
    return this.qaDao.countQaByTiaojian(qa);
  }

  public List<Qa> loadQaByTiaojian(int pageNo, int pageSize, Qa qa) {
    return this.qaDao.loadQaByTiaojian(pageNo, pageSize, qa);
  }
}