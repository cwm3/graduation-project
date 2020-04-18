package com.datacollect;

import com.productsystem.model.Qa;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class TestRead
{
  public Qa read(String path, String ftpfilename, String filename)
    throws IOException
  {
    InputStream stream = new FileInputStream(path);
    Workbook wb = null;

    wb = new XSSFWorkbook(stream);

    Qa qa = new Qa();
    Sheet sheet = wb.getSheetAt(0);
    Row row2 = sheet.getRow(2);
    Cell cell = row2.getCell(1);

    String clientname = "";
    if (cell != null)
    {
      row2.getCell(1).setCellType(1);
      clientname = cell.getStringCellValue();
    }
    qa.setClientname(clientname);

    
    cell = row2.getCell(11);
    String sdlbusinessunit = "";
    if (cell != null)
    {
      row2.getCell(11).setCellType(1);
      sdlbusinessunit = cell.getStringCellValue();
    }
    qa.setSdlbusinessunit(sdlbusinessunit);

    
    
    Row row3 = sheet.getRow(3);
    cell = row3.getCell(1);
    String sdlcostcode = "";
    if (cell != null)
    {
      row3.getCell(1).setCellType(1);
      sdlcostcode = cell.getStringCellValue();
    }
    qa.setSdlcostcode(sdlcostcode);

    cell = row3.getCell(11);
    String sdlnetworkoffice="";
    if (cell != null)
    {
      row3.getCell(11).setCellType(1);
      sdlnetworkoffice = cell.getStringCellValue();
    }
    qa.setSdlnetworkoffice(sdlnetworkoffice);
    
    

    Row row4 = sheet.getRow(4);
    cell = row4.getCell(1);
    String sector ="";
    if (cell != null)
    {
      row4.getCell(1).setCellType(1);
      sector = cell.getStringCellValue();
    }    
    qa.setSector(sector);

    cell = row4.getCell(11);
    String translatorname = "";
    if (cell != null)
    {
      row4.getCell(11).setCellType(1);
      translatorname = cell.getStringCellValue();
    }    
    qa.setTranslatorname(translatorname);

    Row row5 = sheet.getRow(5);
    cell = row5.getCell(1);
    String translationtype = "";
    if (cell != null)
    {
      row5.getCell(1).setCellType(1);
      translationtype = cell.getStringCellValue();
    }    
    qa.setTranslationtype(translationtype);

    
    
    cell = row5.getCell(11);
    String reviewername = "";
    if (cell != null)
    {
      row5.getCell(11).setCellType(1);
      reviewername = cell.getStringCellValue();
    }
    reviewername = reviewername.replace("\n", "");
    qa.setReviewername(reviewername);
    

    Row row6 = sheet.getRow(6);
    cell = row6.getCell(1);
    String sectionevaluated = "";
    if (cell != null)
    {
      row6.getCell(1).setCellType(1);
      sectionevaluated = cell.getStringCellValue();
    }
    sectionevaluated = sectionevaluated.replace("\n", "");
    qa.setSectionevaluated(sectionevaluated);
    
    
    String evaluatorname = "";
    cell = row6.getCell(11);
    if (cell != null)
    {
      row6.getCell(11).setCellType(1);
      evaluatorname = cell.getStringCellValue();
    }
    qa.setEvaluatorname(evaluatorname);
    
    
    Row row7 = sheet.getRow(7);
    cell = row7.getCell(1);
    String evaluatedtype = "";
    if (cell != null)
    {
      row7.getCell(1).setCellType(1);
      evaluatedtype = cell.getStringCellValue();
    }
    qa.setEvaluatedtype(evaluatedtype);
    
    
    String evaluationmethod = "";
    cell = row7.getCell(11);
    if (cell != null)
    {
      row7.getCell(11).setCellType(1);
      evaluationmethod = cell.getStringCellValue();
    }
    qa.setEvaluationmethod(evaluationmethod);
    
    
    String qadate = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Row row8 = sheet.getRow(8);
    cell = row8.getCell(1);
    if(cell != null){
      if (cell.getCellType() == 1) {
        qadate = cell.getStringCellValue();
      }else if (cell.getCellType()==2){
        qadate = sdf.format(HSSFDateUtil.getJavaDate(row8.getCell(1).getNumericCellValue()));
      }
    }
      qa.setQadate(qadate);

    cell = row8.getCell(11);
    String componenttype = "";
    if (cell != null)
    {
      row8.getCell(11).setCellType(1);
      componenttype = cell.getStringCellValue();
    }
    qa.setComponenttype(componenttype);

    Row row9 = sheet.getRow(9);
    cell = row9.getCell(1);
    String sourcelanguage = "";
    if (cell != null){
        row9.getCell(1).setCellType(1);
        sourcelanguage = cell.getStringCellValue();
      }
    
    qa.setSourcelanguage(sourcelanguage);
    
    

    cell = row9.getCell(11);
    String wordcount = "";
    if (cell != null){
      row9.getCell(11).setCellType(1);
      wordcount = cell.getStringCellValue();
    }
    qa.setWordcount(wordcount);

    
    Row row10 = sheet.getRow(10);
    cell = row10.getCell(1);
    String targetlanguage ="";
    if (cell != null){
        row10.getCell(1).setCellType(1);
        targetlanguage = cell.getStringCellValue();
      }
    
    qa.setTargetlanguage(targetlanguage);

    cell = row10.getCell(11);
    String adequacylevel = "";
    if (cell != null){
        row10.getCell(11).setCellType(1);
        adequacylevel = cell.getStringCellValue();
      }
    qa.setAdequacylevel(adequacylevel);
    
    
    

    
    
    String wrongminor = "";

    Row row13 = sheet.getRow(13);
    cell = row13.getCell(3);
    if (cell != null)
    {
      row13.getCell(3).setCellType(1);
      wrongminor = cell.getStringCellValue();
    }
    qa.setWrongminor(wrongminor);

    String wrongweighted = "";
    cell = row13.getCell(5);
    if (cell != null)
    {
      row13.getCell(5).setCellType(1);
      wrongweighted = cell.getStringCellValue();
    }
    qa.setWrongweighted(wrongweighted);

    String wrongserious = "";
    cell = row13.getCell(7);
    if (cell != null)
    {
      row13.getCell(7).setCellType(1);
      wrongserious = cell.getStringCellValue();
    }
    qa.setWrongserious(wrongserious);

    String wrongpoints = "";
    cell = row13.getCell(9);
    if (cell != null)
    {
      row13.getCell(9).setCellType(1);
      wrongpoints = cell.getStringCellValue();
    }
    qa.setWrongpoints(wrongpoints);
    
    
    String  wrongcritical="";
    cell = row13.getCell(11);
    if (cell != null)
    {
      row13.getCell(11).setCellType(1);
      wrongcritical = cell.getStringCellValue();
    }
    qa.setWrongcritical(wrongcritical);
    

    String wrongcategory = "";
    cell = row13.getCell(15);
    if (cell != null){
      row13.getCell(15).setCellType(1);
      wrongcategory = cell.getStringCellValue();
    }
    qa.setWrongcategory(wrongcategory);
    

    String meaningminor = "";
    Row row14 = sheet.getRow(14);
    cell = row14.getCell(3);
    if (cell != null)
    {
      row14.getCell(3).setCellType(1);
      meaningminor = cell.getStringCellValue();
    }
    qa.setMeaningminor(meaningminor);

    String meaningweighted = "";
    cell = row14.getCell(5);
    if (cell != null)
    {
      row14.getCell(5).setCellType(1);
      meaningweighted = cell.getStringCellValue();
    }
    qa.setMeaningweighted(meaningweighted);

    String meaningserious = "";
    cell = row14.getCell(7);
    if (cell != null)
    {
      row14.getCell(7).setCellType(1);
      meaningserious = cell.getStringCellValue();
    }
    qa.setMeaningserious(meaningserious);

    String meaningpoints = "";
    cell = row14.getCell(9);
    if (cell != null)
    {
      row14.getCell(9).setCellType(1);
      meaningpoints = cell.getStringCellValue();
    }
    qa.setMeaningpoints(meaningpoints);
    
    String meaningcritical = "";
    cell = row14.getCell(11);
    if (cell != null)
    {
      row14.getCell(11).setCellType(1);
      meaningcritical = cell.getStringCellValue();
    }
    qa.setMeaningcritical(meaningcritical);
    
    

    String meaningcategory = "";
    cell = row14.getCell(15);
    if (cell != null)
    {
      row14.getCell(15).setCellType(1);
      meaningcategory = cell.getStringCellValue();
    }
    qa.setMeaningcategory(meaningcategory);
    
    

    String omissionminor = "";
    Row row15 = sheet.getRow(15);
    cell = row15.getCell(3);
    if (cell != null)
    {
      row15.getCell(3).setCellType(1);
      omissionminor = cell.getStringCellValue();
    }
    qa.setOmissionminor(omissionminor);

    String omissionweighted = "";
    cell = row15.getCell(5);
    if (cell != null)
    {
      row15.getCell(5).setCellType(1);
      omissionweighted = cell.getStringCellValue();
    }
    qa.setOmissionweighted(omissionweighted);

    String omissionserious = "";
    cell = row15.getCell(7);
    if (cell != null)
    {
      row15.getCell(7).setCellType(1);
      omissionserious = cell.getStringCellValue();
    }
    qa.setOmissionserious(omissionserious);

    String omissionpoints = "";
    cell = row15.getCell(9);
    if (cell != null)
    {
      row15.getCell(9).setCellType(1);
      omissionpoints = cell.getStringCellValue();
    }
    qa.setOmissionpoints(omissionpoints);
    
    
    String omissioncritical = "";
    cell = row15.getCell(11);
    if (cell != null)
    {
      row15.getCell(11).setCellType(1);
      omissioncritical = cell.getStringCellValue();
    }
    qa.setOmissioncritical(omissioncritical);
    
    
    

    String omissioncategory = "";
    cell = row15.getCell(15);
    if (cell != null)
    {
      row15.getCell(15).setCellType(1);
      omissioncategory = cell.getStringCellValue();
    }
    qa.setOmissioncategory(omissioncategory);

    
    String structuralnminor = "";
    Row row16 = sheet.getRow(16);
    cell = row16.getCell(3);
    if (cell != null)
    {
      row16.getCell(3).setCellType(1);
      structuralnminor = cell.getStringCellValue();
    }
    qa.setStructuralnminor(structuralnminor);

    String structuralweighted = "";
    cell = row16.getCell(5);
    if (cell != null)
    {
      row16.getCell(5).setCellType(1);
      structuralweighted = cell.getStringCellValue();
    }
    qa.setStructuralweighted(structuralweighted);

    String structuralserious = "";
    cell = row16.getCell(7);
    if (cell != null)
    {
      row16.getCell(7).setCellType(1);
      structuralserious = cell.getStringCellValue();
    }
    qa.setStructuralserious(structuralserious);

    String structuralpoints = "";
    cell = row16.getCell(9);
    if (cell != null)
    {
      row16.getCell(9).setCellType(1);
      structuralpoints = cell.getStringCellValue();
    }
    qa.setStructuralpoints(structuralpoints);

    
    String structuralcritical = "";
    cell = row16.getCell(11);
    if (cell != null)
    {
      row16.getCell(11).setCellType(1);
      structuralcritical = cell.getStringCellValue();
    }
    qa.setStructuralcritical(structuralcritical);
    
    
    
    
    String structuralcategory = "";
    cell = row16.getCell(15);
    if (cell != null)
    {
      row16.getCell(15).setCellType(1);
      structuralcategory = cell.getStringCellValue();
    }
    qa.setStructuralcategory(structuralcategory);
    
    

    String misspellingminor = "";
    Row row17 = sheet.getRow(17);
    cell = row17.getCell(3);
    if (cell != null)
    {
      row17.getCell(3).setCellType(1);
      misspellingminor = cell.getStringCellValue();
    }
    qa.setMisspellingminor(misspellingminor);

    String misspellingweighted = "";
    cell = row17.getCell(5);
    if (cell != null)
    {
      row17.getCell(5).setCellType(1);
      misspellingweighted = cell.getStringCellValue();
    }
    qa.setMisspellingweighted(misspellingweighted);

    String misspellingserious = "";
    cell = row17.getCell(7);
    if (cell != null)
    {
      row17.getCell(7).setCellType(1);
      misspellingserious = cell.getStringCellValue();
    }
    qa.setMisspellingserious(misspellingserious);

    String misspellingpoints = "";
    cell = row17.getCell(9);
    if (cell != null)
    {
      row17.getCell(9).setCellType(1);
      misspellingpoints = cell.getStringCellValue();
    }
    qa.setMisspellingpoints(misspellingpoints);
    
    
    String misspellingcritical = "";
    cell = row17.getCell(11);
    if (cell != null)
    {
      row17.getCell(11).setCellType(1);
      misspellingcritical = cell.getStringCellValue();
    }
    qa.setMisspellingcritical(misspellingcritical);
    
    

    String misspellingcategory = "";
    cell = row17.getCell(15);
    if (cell != null)
    {
      row17.getCell(15).setCellType(1);
      misspellingcategory = cell.getStringCellValue();
    }
    qa.setMisspellingcategory(misspellingcategory);

    String punctuationminor = "";
    Row row18 = sheet.getRow(17);
    cell = row18.getCell(3);
    if (cell != null)
    {
      row18.getCell(3).setCellType(1);
      punctuationminor = cell.getStringCellValue();
    }
    qa.setPunctuationminor(punctuationminor);

    String punctuationweighted = "";
    cell = row18.getCell(5);
    if (cell != null)
    {
      row18.getCell(5).setCellType(1);
      punctuationweighted = cell.getStringCellValue();
    }
    qa.setPunctuationweighted(punctuationweighted);

    String punctuationserious = "";
    cell = row18.getCell(7);
    if (cell != null)
    {
      row18.getCell(7).setCellType(1);
      punctuationserious = cell.getStringCellValue();
    }
    qa.setPunctuationserious(punctuationserious);

    String punctuationpoints = "";
    cell = row18.getCell(9);
    if (cell != null)
    {
      row18.getCell(9).setCellType(1);
      punctuationpoints = cell.getStringCellValue();
    }
    qa.setPunctuationpoints(punctuationpoints);
    
    
    String punctuationcritical = "";
    cell = row18.getCell(11);
    if (cell != null)
    {
      row18.getCell(11).setCellType(1);
      punctuationcritical = cell.getStringCellValue();
    }
    qa.setPunctuationcritical(punctuationcritical);
    
    
    

    String punctuationcategory = "";
    cell = row18.getCell(15);
    if (cell != null)
    {
      row18.getCell(15).setCellType(1);
      punctuationcategory = cell.getStringCellValue();
    }
    qa.setPunctuationcategory(punctuationcategory);

    String styleminor = "";
    Row row19 = sheet.getRow(19);
    cell = row19.getCell(3);
    if (cell != null)
    {
      row19.getCell(3).setCellType(1);
      styleminor = cell.getStringCellValue();
    }
    qa.setStyleminor(styleminor);

    String styleweighted = "";
    cell = row19.getCell(5);
    if (cell != null)
    {
      row19.getCell(5).setCellType(1);
      styleweighted = cell.getStringCellValue();
    }
    qa.setStyleweighted(styleweighted);

    String styleserious = "";
    cell = row19.getCell(7);
    if (cell != null)
    {
      row19.getCell(7).setCellType(1);
      styleserious = cell.getStringCellValue();
    }
    qa.setStyleserious(styleserious);

    String stylepoints = "";
    cell = row19.getCell(9);
    if (cell != null)
    {
      row19.getCell(9).setCellType(1);
      stylepoints = cell.getStringCellValue();
    }
    qa.setStylepoints(stylepoints);
    
    
    String stylecritical = "";
    cell = row19.getCell(11);
    if (cell != null)
    {
      row19.getCell(11).setCellType(1);
      stylecritical = cell.getStringCellValue();
    }
    qa.setStylecritical(stylecritical);
    

    String stylecategory = "";
    cell = row19.getCell(15);
    if (cell != null)
    {
      row19.getCell(15).setCellType(1);
      stylecategory = cell.getStringCellValue();
    }
    qa.setStylecategory(stylecategory);

    String miscellaneousminor = "";
    Row row20 = sheet.getRow(20);
    cell = row20.getCell(3);
    if (cell != null)
    {
      row20.getCell(3).setCellType(1);
      miscellaneousminor = cell.getStringCellValue();
    }
    qa.setMiscellaneousminor(miscellaneousminor);

    String miscellaneousweighted = "";
    cell = row20.getCell(5);
    if (cell != null)
    {
      row20.getCell(5).setCellType(1);
      miscellaneousweighted = cell.getStringCellValue();
    }
    qa.setMiscellaneousweighted(miscellaneousweighted);

    String miscellaneousserious = "";
    cell = row20.getCell(7);
    if (cell != null)
    {
      row20.getCell(7).setCellType(1);
      miscellaneousserious = cell.getStringCellValue();
    }
    qa.setMiscellaneousserious(miscellaneousserious);

    String miscellaneouspoints = "";
    cell = row20.getCell(9);
    if (cell != null)
    {
      row20.getCell(9).setCellType(1);
      miscellaneouspoints = cell.getStringCellValue();
    }
    qa.setMiscellaneouspoints(miscellaneouspoints);
    
    
    
    String miscellaneouscritical = "";
    cell = row20.getCell(11);
    if (cell != null)
    {
      row20.getCell(11).setCellType(1);
      miscellaneouscritical = cell.getStringCellValue();
    }
    qa.setMiscellaneouscritical(miscellaneouscritical);
    
    

    String miscellaneouscategory = "";
    cell = row20.getCell(15);
    if (cell != null)
    {
      row20.getCell(15).setCellType(1);
      miscellaneouscategory = cell.getStringCellValue();
    }
    qa.setMiscellaneouscategory(miscellaneouscategory);
    
    
    

    String legacydataerrors = "";
    Row row22 = sheet.getRow(22);
    cell = row22.getCell(5);
    if (cell != null) {
      row22.getCell(5).setCellType(1);
      legacydataerrors = cell.getStringCellValue();
    }
    qa.setLegacydataerrors(legacydataerrors);

    String sourcetexterrors = "";
    Row row22_22 = sheet.getRow(22);

    cell = row22_22.getCell(12);
    if (cell != null)
    {
    	row22_22.getCell(12).setCellType(1);
      sourcetexterrors = cell.getStringCellValue();
    }
    qa.setSourcetexterrors(sourcetexterrors);
    
    
    
    String errorpointsallowed = "";
    Row row28 = sheet.getRow(28);
    cell = row28.getCell(1);
    if (cell != null)
    {
      row28.getCell(1).setCellType(1);
      errorpointsallowed = cell.getStringCellValue();
    }
    qa.setErrorpointsallowed(errorpointsallowed);

    String totalcategoryerrorpoints = "";
    cell = row28.getCell(4);
    if (cell != null)
    {
      row28.getCell(4).setCellType(1);
      totalcategoryerrorpoints = cell.getStringCellValue();
    }
    qa.setTotalcategoryerrorpoints(totalcategoryerrorpoints);

    cell = row28.getCell(8);
    String qualityindicator = "";
    if (cell != null)
    {
      row28.getCell(8).setCellType(1);
      qualityindicator = cell.getStringCellValue();
    }
    qa.setQualityindicator(qualityindicator);
    
    

    String sdlqualityindicator = "";

    Row row30 = sheet.getRow(30);
    cell = row30.getCell(8);
    if (cell != null)
    {
      row30.getCell(8).setCellType(1);
      sdlqualityindicator = cell.getStringCellValue();
    }
    DecimalFormat df = new DecimalFormat("0.0");
    if (sdlqualityindicator.equals(""))
      sdlqualityindicator = "0.0";

    double x = Double.valueOf(sdlqualityindicator).doubleValue();
    String result = df.format(x);
    qa.setSdlqualityindicator(result);
    
    String sdlqualityinfor = "";

    Row row33 = sheet.getRow(33);
    cell = row33.getCell(8);
    if (cell != null){
      row33.getCell(8).setCellType(1);
      sdlqualityinfor =sdlqualityinfor+cell.getStringCellValue();
    }
    
    cell = row33.getCell(9);
    if (cell != null){
      row33.getCell(9).setCellType(1);
      sdlqualityinfor =sdlqualityinfor+cell.getStringCellValue();
    }
    
    
    Row row34 = sheet.getRow(34);
    cell = row34.getCell(8);
    if (cell != null){
      row34.getCell(8).setCellType(1);
      sdlqualityinfor = sdlqualityinfor+"  "+cell.getStringCellValue();
    }
    qa.setSdlqualityinfor(sdlqualityinfor);
    
  
   
    Row row40 = sheet.getRow(40);
    cell = row40.getCell(13);
    String qastatus = "";
    if (cell != null) {
      row40.getCell(13).setCellType(1);
      qastatus = cell.getStringCellValue();
    }
    qa.setQastatus(qastatus);

    String comment = "";

    Row row41 = sheet.getRow(41);
    cell = row41.getCell(0);
    if (cell != null) {
      row41.getCell(0).setCellType(1);
      comment = cell.getStringCellValue();
    }
    comment = comment.replace("\n", "");
    comment = comment.replace("\"", "");
    qa.setComment(comment);
    qa.setFilefilename(filename);
    qa.setFtpfilename(ftpfilename);
    return qa;
  }
}