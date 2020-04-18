package com.productsystem.service.impl;

import com.productsystem.dao.VendorDao;
import com.productsystem.model.Vendor;
import com.productsystem.service.VendorManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("vendorManager")
public class VendorManagerImpl
  implements VendorManager
{
  @Autowired	
  private VendorDao vendorDao;

  public boolean exists(Vendor vendor)
    throws Exception
  {
    return this.vendorDao.checkVendorExistsWithName(vendor.getVendorid(), vendor.getVendorpassword());
  }

  public void add(Vendor vendor) throws Exception {
    this.vendorDao.saveOrUpdate(vendor);
  }

  public void updateVendor(Vendor vendor) {
    this.vendorDao.updateVendor(vendor);
  }

  public int countVendor() {
    return this.vendorDao.countAll("Vendor");
  }

  public List<Vendor> browseVendor(int pageNo, int pageSize) {
    return this.vendorDao.listAll("Vendor", pageNo, pageSize);
  }

  public List<Vendor> browseVendor() {
    return this.vendorDao.listAll("Vendor");
  }

  public List<Vendor> exportVendor(Vendor vendor) {
    return this.vendorDao.listAll(vendor);
  }

  public boolean deleteVendor(Integer id) {
    boolean status = false;
    try {
      this.vendorDao.deleteById(Vendor.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Vendor loadVendor(Integer id) {
    return ((Vendor)this.vendorDao.loadById(Vendor.class, id));
  }

  public boolean saveOrUpdateVendor(Vendor vendor) {
    boolean status = false;
    try {
      this.vendorDao.save(vendor);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public VendorDao getVendorDao() {
    return this.vendorDao;
  }

  @Resource
  public void setVendorDao(VendorDao vendorDao) {
    this.vendorDao = vendorDao;
  }

  public List<Vendor> selectVendor(int pageNo, int pageSize, Vendor vendor) {
    return this.vendorDao.listSelectVendor(pageNo, pageSize, vendor);
  }

  public int countSelectVendor(Vendor vendor) {
    return this.vendorDao.coutSelectVendor(vendor);
  }

  public int countVendorSchedule(Vendor vendor) {
    return this.vendorDao.coutVendorSchedule(vendor);
  }

  public List<Vendor> selectVendorSchedule(int pageNo, int pageSize, Vendor vendor) {
    return this.vendorDao.listVendorSchedule(pageNo, pageSize, vendor);
  }

  public List<Vendor> listVendorByTiaoJian(String vendorid, String vendorname, String chinesename) {
    return this.vendorDao.listVendorByTiaoJian(vendorid, vendorname, 
      chinesename);
  }

  public int countVendorCapacity(Vendor vendor) {
    return this.vendorDao.countVendorCapacity(vendor);
  }

  public List<Vendor> selectVendorCapacity(int pageNo, int pageSize, Vendor vendor) {
    return this.vendorDao.selectVendorCapacity(pageNo, pageSize, vendor);
  }
}