package com.datacollect;

import com.productsystem.model.ProjectExcle;
import com.productsystem.model.Qa;
import com.productsystem.model.VendorSchedule;
import java.io.OutputStream;
import java.io.PrintStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class DataCapacityExp
{
  public void createXls(OutputStream os, String Languagebegin, String Languageend, String vendorid, String vendorname, String chinesename, String averagescore, String grade, String rate, String startdate, String enddate, String vendor_field, String vendor_cat)
    throws ParseException
  {
    VendorScheduleDao vendorscheduleDao = new VendorScheduleDao();
    List vendorschedules = vendorscheduleDao.FindByTiaojJian(Languagebegin, Languageend, vendorid, vendorname, averagescore, rate, startdate, enddate, vendor_field, vendor_cat);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date dBegin = sdf.parse(startdate);
    Date dEnd = sdf.parse(enddate);
    List listDate = getDatesBetweenTwoDate(dBegin, dEnd);

    String[] title = new String[200];
    title[0] = "Vendor Id";
    title[1] = "Vendor Name";
    title[2] = "Average score";
    String[] title_day = new String[200];
    for (int aa = 0; aa < listDate.size(); ++aa)
      title[(3 + aa)] = sdf.format((Date)listDate.get(aa));

    for (int j = 0; j < listDate.size(); ++j)
      title_day[j] = ((Date)listDate.get(j)).toString().substring(0, 3);

    try
    {
      Label label;
      long start = System.currentTimeMillis();

      WritableWorkbook wwb = Workbook.createWorkbook(os);

      WritableSheet sheet = wwb.createSheet("Capactiy List", 0);

      List labels = null;
      for (int j = 0; j < listDate.size(); ++j)
      {
        label = new Label(3 + j, 1, title_day[j]);

        sheet.addCell(label);
      }
      for (int i = 0; i < title.length; ++i)
      {
        label = new Label(i, 0, title[i]);

        sheet.addCell(label);
      }
      sheet.mergeCells(0, 0, 0, 1);
      sheet.mergeCells(1, 0, 1, 1);
      sheet.mergeCells(2, 0, 2, 1);
      for (int j = 0; j < vendorschedules.size(); ++j)
      {
        Label label0 = new Label(0, j + 2, ((VendorSchedule)vendorschedules.get(j)).getVendorid());
        sheet.addCell(label0);

        Label label1 = new Label(1, j + 2, ((VendorSchedule)vendorschedules.get(j)).getVendorname());
        sheet.addCell(label1);

        Label label2 = new Label(2, j + 2, ((VendorSchedule)vendorschedules.get(j)).getAveragescores());
        sheet.addCell(label2);

        String sparecapacity1 = ((VendorSchedule)vendorschedules.get(j)).getSparecapacity();
        String[] aa = sparecapacity1.split(",");
        for (int c = 0; c < aa.length; ++c)
          sheet.addCell(new Label(3 + c, j + 2, aa[c]));
      }

      wwb.write();

      wwb.close();
      long end = System.currentTimeMillis();
      System.out.println("----闁诲海鎳撻張顒勫垂濮樿鲸瀚氶柕澶涢檮閹瑥霉閿濆棛鐭婇柛娆欑節閹粙濡歌閻ｉ亶鏌￠崘銊у煟婵☆偄娼″浼存晸閿燂拷" + ((end - start) / 1000L));
    }
    catch (Exception e)
    {
      System.out.println("---闂佸憡鍨煎▍锝夌嵁閸パ屽殨闁稿本姘ㄩ崺锟�-");
      e.printStackTrace();
    }
  }

  public void createprojectXls(OutputStream os, String client, String costcode, String dropdate, String deadline, String lead, String remark2, String status, String yxbz, String potype, String userposition) throws ParseException
  {
    VendorScheduleDao vendorscheduleDao = new VendorScheduleDao();
    List projectexcles = vendorscheduleDao.loadProjectExcel(client, costcode, dropdate, deadline, lead, remark2, status, yxbz, potype, userposition);

    String[] title = new String[200];

    title[0] = "Lead";
    title[1] = "LM/Gl";
    title[2] = "Client";
    title[3] = "CostCode";
    title[4] = "Drop Name";
    title[5] = "System Code";
    title[6] = "Drop Date";
    title[7] = "Deadline";
    title[8] = "Hourlywork";
    title[9] = "NEW Words";
    title[10] = "Post-editing";
    title[11] = "75%-84% Fuzzy";
    title[12] = "85%-99% Fuzzy";
    title[13] = "75%-99% Fuzzy";
    title[14] = "100% Fuzzy";
    title[15] = "Tota Words";
    title[16] = "Received PO Value(RMB)";
    title[17] = "iMT Champion";
    title[18] = "iMT Quality";
    title[19] = "Comments";
    title[20] = "Status";

    title[21] = "Translator/Reviewer Name";
    title[22] = "WorkType";
    title[23] = "Hourly";
    title[24] = "New Words";
    title[25] = "75%-84% Fuzzy";
    title[26] = "85%-99% Fuzzy";
    title[27] = "75%-99% Fuzzy";
    title[28] = "100% Fuzzy";
    title[29] = "Toal Words";
    title[30] = "Cooresponding words";
    title[31] = "Outsourced Value(RMB)";
    title[32] = "Outsourced PO Number";
    title[33] = "Start Date";
    title[34] = "End Date";
    title[35] = "Lead";
    title[36] = "Status";
    try
    {
      long start = System.currentTimeMillis();

      WritableWorkbook wwb = Workbook.createWorkbook(os);

      WritableSheet sheet = wwb.createSheet("Porject List", 0);

      List labels = null;
      for (int i = 0; i < title.length; ++i)
      {
        Label label = new Label(i, 0, title[i]);

        sheet.addCell(label);
      }
      for (int j = 0; j < projectexcles.size(); ++j)
      {
        Label label0 = new Label(0, j + 1, ((ProjectExcle)projectexcles.get(j)).getLead_project());
        sheet.addCell(label0);

        Label label1 = new Label(1, j + 1, ((ProjectExcle)projectexcles.get(j)).getLmorgl_project());
        sheet.addCell(label1);

        Label label2 = new Label(2, j + 1, ((ProjectExcle)projectexcles.get(j)).getClient_project());
        sheet.addCell(label2);

        Label label3 = new Label(3, j + 1, ((ProjectExcle)projectexcles.get(j)).getCostcode_project());
        sheet.addCell(label3);

        Label label4 = new Label(4, j + 1, ((ProjectExcle)projectexcles.get(j)).getDropname_project());
        sheet.addCell(label4);

        Label label5 = new Label(5, j + 1, ((ProjectExcle)projectexcles.get(j)).getSystemcode_project());
        sheet.addCell(label5);

        Label label6 = new Label(6, j + 1, ((ProjectExcle)projectexcles.get(j)).getDropdate_project());
        sheet.addCell(label6);

        Label label7 = new Label(7, j + 1, ((ProjectExcle)projectexcles.get(j)).getDeadline_project());
        sheet.addCell(label7);

        Label label8 = new Label(8, j + 1, ((ProjectExcle)projectexcles.get(j)).getHourlywork_project());
        sheet.addCell(label8);

        Label label9 = new Label(9, j + 1, ((ProjectExcle)projectexcles.get(j)).getnewwords_project());
        sheet.addCell(label9);

        Label label10 = new Label(10, j + 1, ((ProjectExcle)projectexcles.get(j)).getPostediting_project());
        sheet.addCell(label10);

        Label label11 = new Label(11, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate1_project());
        sheet.addCell(label11);

        Label label12 = new Label(12, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate2_project());
        sheet.addCell(label12);

        Label label13 = new Label(13, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate3_project());
        sheet.addCell(label13);

        Label label14 = new Label(14, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate4_project());
        sheet.addCell(label14);

        Label label15 = new Label(15, j + 1, ((ProjectExcle)projectexcles.get(j)).getTotalwords_project());
        sheet.addCell(label15);

        Label label16 = new Label(16, j + 1, ((ProjectExcle)projectexcles.get(j)).getReceivedpovalue_project());
        sheet.addCell(label16);

        Label label17 = new Label(17, j + 1, ((ProjectExcle)projectexcles.get(j)).getImtchampion_project());
        sheet.addCell(label17);

        Label label18 = new Label(18, j + 1, ((ProjectExcle)projectexcles.get(j)).getImtquality_project());
        sheet.addCell(label18);

        Label label19 = new Label(19, j + 1, ((ProjectExcle)projectexcles.get(j)).getComment_project());
        sheet.addCell(label19);

        Label label20 = new Label(20, j + 1, ((ProjectExcle)projectexcles.get(j)).getStatus_project());
        sheet.addCell(label20);

        Label label21 = new Label(21, j + 1, ((ProjectExcle)projectexcles.get(j)).getVendorname());
        sheet.addCell(label21);

        Label label22 = new Label(22, j + 1, ((ProjectExcle)projectexcles.get(j)).getWorktype());
        sheet.addCell(label22);

        Label label23 = new Label(23, j + 1, ((ProjectExcle)projectexcles.get(j)).getHourlywork());
        sheet.addCell(label23);

        Label label24 = new Label(24, j + 1, ((ProjectExcle)projectexcles.get(j)).getNewnew());
        sheet.addCell(label24);

        Label label25 = new Label(25, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate1());
        sheet.addCell(label25);

        Label label26 = new Label(26, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate2());
        sheet.addCell(label26);

        Label label27 = new Label(27, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate3());
        sheet.addCell(label27);

        Label label28 = new Label(28, j + 1, ((ProjectExcle)projectexcles.get(j)).getRate4());
        sheet.addCell(label28);

        Label label29 = new Label(29, j + 1, ((ProjectExcle)projectexcles.get(j)).getTotalwords());
        sheet.addCell(label29);

        Label label30 = new Label(30, j + 1, ((ProjectExcle)projectexcles.get(j)).getCoorespondingwords());
        sheet.addCell(label30);

        Label label31 = new Label(31, j + 1, ((ProjectExcle)projectexcles.get(j)).getOutsourcedponumber());
        sheet.addCell(label31);

        Label label32 = new Label(32, j + 1, ((ProjectExcle)projectexcles.get(j)).getProjectvalue());
        sheet.addCell(label32);

        Label label33 = new Label(33, j + 1, ((ProjectExcle)projectexcles.get(j)).getStartdate());
        sheet.addCell(label33);

        Label label34 = new Label(34, j + 1, ((ProjectExcle)projectexcles.get(j)).getEnddate());
        sheet.addCell(label34);

        Label label35 = new Label(35, j + 1, ((ProjectExcle)projectexcles.get(j)).getLead());
        sheet.addCell(label35);

        Label label36 = new Label(36, j + 1, ((ProjectExcle)projectexcles.get(j)).getStatus());
        sheet.addCell(label36);
      }
      wwb.write();

      wwb.close();
      long end = System.currentTimeMillis();
      System.out.println("----闁诲海鎳撻張顒勫垂濮樿鲸瀚氶柕澶涢檮閹瑥霉閿濆棛鐭婇柛娆欑節閹粙濡歌閻ｉ亶鏌￠崘銊у煟婵☆偄娼″浼存晸閿燂拷" + ((end - start) / 1000L));
    }
    catch (Exception e)
    {
      System.out.println("---闂佸憡鍨煎▍锝夌嵁閸パ屽殨闁稿本姘ㄩ崺锟�-");
      e.printStackTrace();
    }
  }

  public void createpqaXls(OutputStream os, String vendorname, String lead, String deadline, String sector, String evaluatorname, String translationtype, String sourcelanguage, String targetlanguage, String clientname, String startdate, String enddate, String lmorgl)
    throws ParseException
  {
    VendorScheduleDao vendorscheduleDao = new VendorScheduleDao();
    List qas = vendorscheduleDao.loadQaExcel(vendorname, lead, deadline, sector, evaluatorname, translationtype, sourcelanguage, targetlanguage, clientname, startdate, enddate, lmorgl);

    String[] title = new String[200];
    title[0] = "SDL Network Office";
    title[1] = "Vendor Name";
    title[2] = "Lead";
    title[3] = "LM";
    title[4] = "Date";
    title[5] = "Client Name";
    title[6] = "SDL Cost Code";
    title[7] = "Sector";
    title[8] = "Translation Type";
    title[9] = "Translator Name";
    title[10] = "Reviewer Name";
    title[11] = "Evaluator Name";
    title[12] = "Word Count";
    title[13] = "NWO Passes/Fails";
    title[14] = "QA Score";
    title[15] = "Source Language";
    title[16] = "Target Language";
    title[17] = "FileName";
    title[18] = "Year";
    title[19] = "Month";

    
    try
    {
      long start = System.currentTimeMillis();

      WritableWorkbook wwb = Workbook.createWorkbook(os);

      WritableSheet sheet = wwb.createSheet("QA List", 0);

      List labels = null;
      for (int i = 0; i < title.length; ++i) {
        Label label = new Label(i, 0, title[i]);

        sheet.addCell(label);
      }
      for (int j = 0; j < qas.size(); ++j) {
        Label label0 = new Label(0, j + 1, ((Qa)qas.get(j)).getSdlnetworkoffice());
        sheet.addCell(label0);

        Label label1 = new Label(1, j + 1, ((Qa)qas.get(j)).getVendorname());
        sheet.addCell(label1);

        Label label2 = new Label(2, j + 1, ((Qa)qas.get(j)).getLead());
        sheet.addCell(label2);

        Label label3 = new Label(3, j + 1, ((Qa)qas.get(j)).getLmorgl());
        sheet.addCell(label3);
        
        String qadate =((Qa)qas.get(j)).getQadate();
        String year ="";
        String month="";
        if(qadate != null & !qadate.equals("")){
        	year=qadate.substring(0, 4);
        	month=qadate.substring(5, 7);
        	qadate=qadate.replace("-", "/");
        } 
        Label label4 = new Label(4, j + 1, qadate);
        sheet.addCell(label4);

        Label label5 = new Label(5, j + 1, ((Qa)qas.get(j)).getClientname());
        sheet.addCell(label5);

        Label label6 = new Label(6, j + 1, ((Qa)qas.get(j)).getSdlcostcode());
        sheet.addCell(label6);

        Label label7 = new Label(7, j + 1, ((Qa)qas.get(j)).getSector());
        sheet.addCell(label7);

        Label label8 = new Label(8, j + 1, ((Qa)qas.get(j)).getTranslationtype());
        sheet.addCell(label8);

        Label label9 = new Label(9, j + 1, ((Qa)qas.get(j)).getTranslatorname());
        sheet.addCell(label9);

        Label label10 = new Label(10, j + 1, ((Qa)qas.get(j)).getReviewername());
        sheet.addCell(label10);

        Label label11 = new Label(11, j + 1, ((Qa)qas.get(j)).getEvaluatorname());
        sheet.addCell(label11);

        Label label12 = new Label(12, j + 1, ((Qa)qas.get(j)).getWordcount());
        sheet.addCell(label12);

        Label label13 = new Label(13, j + 1, ((Qa)qas.get(j)).getSdlqualityindicator_show());
        sheet.addCell(label13);

        Label label14 = new Label(14, j + 1, ((Qa)qas.get(j)).getSdlqualityindicator());
        sheet.addCell(label14);

        Label label15 = new Label(15, j + 1, ((Qa)qas.get(j)).getSourcelanguage());
        sheet.addCell(label15);

        Label label16 = new Label(16, j + 1, ((Qa)qas.get(j)).getTargetlanguage());
        sheet.addCell(label16);

        Label label17 = new Label(17, j + 1, ((Qa)qas.get(j)).getFilefilename());
        sheet.addCell(label17);
        
        Label label18 = new Label(18, j + 1, year);
        sheet.addCell(label18);
        
        Label label19 = new Label(19, j + 1, month);
        sheet.addCell(label19);
        
        
      }
      wwb.write();

      wwb.close();
      long end = System.currentTimeMillis();
      System.out.println("----闁诲海鎳撻張顒勫垂濮樿鲸瀚氶柕澶涢檮閹瑥霉閿濆棛鐭婇柛娆欑節閹粙濡歌閻ｉ亶鏌￠崘銊у煟婵☆偄娼″浼存晸閿燂拷"+ ((end - start) / 1000L));
    }
    catch (Exception e)
    {
      System.out.println("---闂佸憡鍨煎▍锝夌嵁閸パ屽殨闁稿本姘ㄩ崺锟�-");
      e.printStackTrace();
    }
  }

  public void createQaMonthXls(OutputStream os, String vendorname, String clientname, String evaluator, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String field)
    throws ParseException
  {
    QaInfoDao qadao = new QaInfoDao();
    List qas = qadao.loadqaByMonth(vendorname, clientname, evaluator, lead, costcode, translationtype, targetlanguage, sourcelanguage, startyear, startmonth, endyear, endmonth, lmorgl,field);

    String[] title = new String[200];
    title[0] = "Vendor Id";
    title[1] = "Vendor Name";
    int hh = 0;
    List listmonth = new ArrayList();
    int endendmonth = endmonth + 1;
    Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear + "-" + startmonth);
    Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear + "-" + endendmonth);
    Calendar dd = Calendar.getInstance();
    dd.setTime(d1);
    while (dd.getTime().before(d2))
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
      String str = sdf.format(dd.getTime());
      listmonth.add(str);
      title[(hh + 2)] = str;
      ++hh;
      dd.add(2, 1);
    }
    try
    {
      long start = System.currentTimeMillis();

      WritableWorkbook wwb = Workbook.createWorkbook(os);

      WritableSheet sheet = wwb.createSheet("QaMonth List", 0);

      List labels = null;
      for (int i = 0; i < title.length; ++i)
      {
        Label label = new Label(i, 0, title[i]);

        sheet.addCell(label);
      }
      for (int j = 0; j < qas.size(); ++j)
      {
        Label label0 = new Label(0, j + 1, ((Qa)qas.get(j)).getVendorid());
        sheet.addCell(label0);

        Label label1 = new Label(1, j + 1, ((Qa)qas.get(j)).getVendorname());
        sheet.addCell(label1);

        String score = ((Qa)qas.get(j)).getScore();

        String[] aa = score.split(",");
        for (int d = 0; d < listmonth.size(); ++d)
          sheet.addCell(new Label(2 + d, j + 1, aa[d]));
      }

      wwb.write();

      wwb.close();
      long end = System.currentTimeMillis();
      System.out.println("----闁诲海鎳撻張顒勫垂濮樿鲸瀚氶柕澶涢檮閹瑥霉閿濆棛鐭婇柛娆欑節閹粙濡歌閻ｉ亶鏌￠崘銊у煟婵☆偄娼″浼存晸閿燂拷 "+ ((end - start) / 1000L));
    }
    catch (Exception e)
    {
      System.out.println("---闂佸憡鍨煎▍锝夌嵁閸パ屽殨闁稿本姘ㄩ崺锟�-");
      e.printStackTrace();
    }
  }

  public static List<Date> getDatesBetweenTwoDate(Date beginDate, Date endDate)
  {
    List lDate = new ArrayList();
    lDate.add(beginDate);
    Calendar cal = Calendar.getInstance();

    cal.setTime(beginDate);
    boolean bContinue = true;
    while (bContinue)
    {
      cal.add(5, 1);
      if (!(endDate.after(cal.getTime())))
        break;

      lDate.add(cal.getTime());
    }
    lDate.add(endDate);
    return lDate;
  }
}