package com.productsystem.dao;

import com.productsystem.model.Schedule;
import java.io.Serializable;
import java.util.List;

public abstract interface ScheduleDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void save(Schedule paramSchedule);

  public abstract void updateSchedule(Schedule paramSchedule);

  public abstract int countQuery(String paramString);

  public abstract List listAll(Schedule paramSchedule, int paramInt1, int paramInt2);

  public abstract List listAll(String paramString);

  public abstract int countAll(Schedule paramSchedule);

  public abstract int countLastMonthAll(Schedule paramSchedule);

  public abstract List listLastMonthAll(Schedule paramSchedule, int paramInt1, int paramInt2);

  public abstract int coutVendorSchedule(Schedule paramSchedule);

  public abstract List listVendorSchedule(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract int countVendorscheduleByVendorId(Schedule paramSchedule);

  public abstract List loadvendorscheduleByVendorId(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract int countScheduleByTiaoJian(Schedule paramSchedule);

  public abstract List browseScheduleByTiaoJian(int paramInt1, int paramInt2, Schedule paramSchedule);
}