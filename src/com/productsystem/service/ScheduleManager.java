package com.productsystem.service;

import com.productsystem.model.Schedule;
import java.util.List;

public abstract interface ScheduleManager
{
  public abstract void add(Schedule paramSchedule)
    throws Exception;

  public abstract void updateSchedule(Schedule paramSchedule);

  public abstract Schedule loadSchedule(Integer paramInteger);

  public abstract boolean deleteSchedule(Integer paramInteger);

  public abstract boolean saveOrUpdateSchedule(Schedule paramSchedule);

  public abstract void save(Schedule paramSchedule);

  public abstract int countSchedule(Schedule paramSchedule);

  public abstract int countLastMonthSchedule(Schedule paramSchedule);

  public abstract int countVendorSchedule(Schedule paramSchedule);

  public abstract List<Schedule> selectVendorSchedule(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract List<Schedule> browseSchedule(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract List<Schedule> browseLastMonthSchedule(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract List<Schedule> browseSchedule();

  public abstract int countVendorscheduleByVendorId(Schedule paramSchedule);

  public abstract List<Schedule> loadvendorscheduleByVendorId(int paramInt1, int paramInt2, Schedule paramSchedule);

  public abstract int countScheduleByTiaoJian(Schedule paramSchedule);

  public abstract List<Schedule> browseScheduleByTiaoJian(int paramInt1, int paramInt2, Schedule paramSchedule);
}