package com.productsystem.service.impl;

import com.productsystem.dao.CostCodeDao;
import com.productsystem.model.CostCode;
import com.productsystem.service.CostCodeManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("costcodeManager")
public class CostCodeManagerImpl
  implements CostCodeManager
{
  @Autowired	
  private CostCodeDao costcodeDao;

  public void add(CostCode costcode)
    throws Exception
  {
    this.costcodeDao.saveOrUpdate(costcode);
  }

  public void updateCostCode(CostCode costcode) {
    this.costcodeDao.updateCostCode(costcode);
  }

  public int countCostCode(CostCode costcode) {
    return this.costcodeDao.countAll(costcode);
  }

  public int countCostCode() {
    return this.costcodeDao.countAll();
  }

  public List<CostCode> browse(int pageNo, int pageSize) {
    return this.costcodeDao.listAll(pageNo, pageSize);
  }

  public List<CostCode> browseCostCode() {
    return this.costcodeDao.listAll("CostCode");
  }

  public boolean deleteCostCode(Integer id) {
    boolean status = false;
    try {
      this.costcodeDao.deleteById(CostCode.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public CostCode loadCostCode(Integer id) {
    return ((CostCode)this.costcodeDao.loadById(CostCode.class, id));
  }

  public boolean saveOrUpdateCostCode(CostCode costcode) {
    boolean status = false;
    try {
      this.costcodeDao.saveOrUpdate(costcode);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public CostCodeDao getCostCodeDao() {
    return this.costcodeDao;
  }

  @Resource
  public void setCostCodeDao(CostCodeDao costcodeDao) {
    this.costcodeDao = costcodeDao;
  }

  public void save(CostCode costcode) {
    this.costcodeDao.save(costcode);
  }

  public List<CostCode> listCostCodeByTiaoJian(CostCode costcode) {
    return this.costcodeDao.listCostCodeByTiaoJian(costcode);
  }

  public List<CostCode> browse(int pageNo, int pageSize, CostCode CostCode) {
    return this.costcodeDao.listAll(pageNo, pageSize, CostCode);
  }
}