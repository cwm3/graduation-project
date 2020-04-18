package com.productsystem.service.impl;

import com.productsystem.dao.ScheduleDao;
import com.productsystem.model.Schedule;
import com.productsystem.service.ScheduleManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("scheduleManager")
public class ScheduleManagerImpl
  implements ScheduleManager
{
  @Autowired	
  private ScheduleDao scheduleDao;

  public void add(Schedule schedule)
    throws Exception
  {
    this.scheduleDao.saveOrUpdate(schedule);
  }

  public void updateSchedule(Schedule schedule) {
    this.scheduleDao.updateSchedule(schedule);
  }

  public int countSchedule(Schedule schedule) {
    return this.scheduleDao.countAll(schedule);
  }

  public int countLastMonthSchedule(Schedule schedule) {
    return this.scheduleDao.countLastMonthAll(schedule);
  }

  public List<Schedule> browseSchedule(int pageNo, int pageSize, Schedule schedule)
  {
    return this.scheduleDao.listAll(schedule, pageNo, pageSize);
  }

  public List<Schedule> browseLastMonthSchedule(int pageNo, int pageSize, Schedule schedule)
  {
    return this.scheduleDao.listLastMonthAll(schedule, pageNo, pageSize);
  }

  public List<Schedule> browseSchedule() {
    return this.scheduleDao.listAll("Schedule");
  }

  public boolean deleteSchedule(Integer id) {
    boolean status = false;
    try {
      this.scheduleDao.deleteById(Schedule.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Schedule loadSchedule(Integer id) {
    return ((Schedule)this.scheduleDao.loadById(Schedule.class, id));
  }

  public boolean saveOrUpdateSchedule(Schedule schedule) {
    boolean status = false;
    try {
      this.scheduleDao.saveOrUpdate(schedule);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public ScheduleDao getScheduleDao() {
    return this.scheduleDao;
  }

  @Resource
  public void setScheduleDao(ScheduleDao scheduleDao) {
    this.scheduleDao = scheduleDao;
  }

  public void save(Schedule schedule) {
    this.scheduleDao.save(schedule);
  }

  public int countVendorSchedule(Schedule schedule) {
    return this.scheduleDao.coutVendorSchedule(schedule);
  }

  public List<Schedule> selectVendorSchedule(int pageNo, int pageSize, Schedule schedule)
  {
    return this.scheduleDao.listVendorSchedule(pageNo, pageSize, schedule);
  }

  public int countVendorscheduleByVendorId(Schedule schedule) {
    return this.scheduleDao.countVendorscheduleByVendorId(schedule);
  }

  public List<Schedule> loadvendorscheduleByVendorId(int pageNo, int pageSize, Schedule schedule)
  {
    return this.scheduleDao.loadvendorscheduleByVendorId(pageNo, pageSize, 
      schedule);
  }

  public int countScheduleByTiaoJian(Schedule schedule) {
    return this.scheduleDao.countScheduleByTiaoJian(schedule);
  }

  public List<Schedule> browseScheduleByTiaoJian(int pageNo, int pageSize, Schedule schedule)
  {
    return this.scheduleDao.browseScheduleByTiaoJian(pageNo, pageSize, 
      schedule);
  }
}