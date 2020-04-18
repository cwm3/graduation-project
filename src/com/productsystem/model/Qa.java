package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Qa {
	private int id;
	private String clientname;
	private String sdlbusinessunit;
	private String sdlcostcode;
	private String sdlnetworkoffice;
	private String sector;
	private String translatorname;
	private String reviewername;
	private String sectionevaluated;
	private String evaluatorname;
	private String evaluatedtype;
	private String evaluationmethod;
	private String qadate;
	private String sourcelanguage;
	private String wordcount;
	private String adequacylevel;
	private String targetlanguage;
	private String translationtype;

	private String meaningminor;
	private String meaningweighted;
	private String meaningserious;
	private String meaningpoints;
	private String meaningcategory;
	private String meaningcritical;
	private String miscellaneousminor;
	private String miscellaneousweighted;
	private String miscellaneousserious;
	private String miscellaneouspoints;
	private String miscellaneouscategory;
	private String miscellaneouscritical;

	private String legacydataerrors;
	private String sourcetexterrors;
	private String errorpointsallowed;
	private String totalcategoryerrorpoints;
	private String qualityindicator;
	private String comment;
	private String yxbz;
	private String vendorname;
	private String vendorid;
	private String lead;
	private String ifscwj;
	private String lmorgl;
	private String word;
	private String startdate;
	private String enddate;
	private String overallreadability;
	private String score;
	private String sdlqualityindicator;
	private String sdlqualityindicator_show;
	private String sdlqualityinfor;
	private String qastatus;

	private String componenttype;
	private String matches;
	private String omissionminor;
	private String omissionweighted;
	private String omissionserious;
	private String omissionpoints;
	private String omissioncategory;

	private String omissioncritical;

	private String lrr;
	private String remark1;
	private String remark2;
	private String remark3;
	private String remark4;
	private String ftpfilename;
	private String filefilename;
	private String filecontenttype;
	
	private String stylecategory;
	private String stylecritical;

	@Id
	@GeneratedValue
	public int getId() {
		return this.id;
	}

	public String getWrongcritical() {
		return wrongcritical;
	}

	public void setMeaningcritical(String meaningcritical) {
		this.meaningcritical = meaningcritical;
	}

	public void setWrongcritical(String wrongcritical) {
		this.wrongcritical = wrongcritical;
	}

	public String getStructuralcritical() {
		return structuralcritical;
	}

	public void setStructuralcritical(String structuralcritical) {
		this.structuralcritical = structuralcritical;
	}

	public String getMisspellingcritical() {
		return misspellingcritical;
	}

	public void setMisspellingcritical(String misspellingcritical) {
		this.misspellingcritical = misspellingcritical;
	}

	public String getPunctuationcritical() {
		return punctuationcritical;
	}

	public void setPunctuationcritical(String punctuationcritical) {
		this.punctuationcritical = punctuationcritical;
	}

	public String getStylecritical() {
		return stylecritical;
	}

	public void setStylecritical(String stylecritical) {
		this.stylecritical = stylecritical;
	}

	public String getMiscellaneouscritical() {
		return miscellaneouscritical;
	}

	public void setMiscellaneouscritical(String miscellaneouscritical) {
		this.miscellaneouscritical = miscellaneouscritical;
	}

	public String getSdlqualityinfor() {
		return sdlqualityinfor;
	}

	public void setSdlqualityinfor(String sdlqualityinfor) {
		this.sdlqualityinfor = sdlqualityinfor;
	}

	public String getOmissioncritical() {
		return omissioncritical;
	}

	public void setOmissioncritical(String omissioncritical) {
		this.omissioncritical = omissioncritical;
	}

	public String getMeaningcritical() {
		return meaningcritical;
	}

	private String wrongminor;
	private String wrongweighted;
	private String wrongserious;
	private String wrongpoints;
	private String wrongcategory;
	private String wrongcritical;

	private String structuralnminor;
	private String structuralweighted;
	private String structuralserious;
	private String structuralpoints;
	private String structuralcategory;
	private String structuralcritical;

	private String misspellingminor;
	private String misspellingweighted;
	private String misspellingserious;
	private String misspellingpoints;
	private String misspellingcategory;
	private String misspellingcritical;

	private String punctuationminor;
	private String punctuationweighted;
	private String punctuationserious;
	private String punctuationpoints;
	private String punctuationcategory;
	private String punctuationcritical;

	private String styleminor;
	private String styleweighted;
	private String styleserious;
	private String stylepoints;

	public String getClientname() {
		return clientname;
	}

	public void setClientname(String clientname) {
		this.clientname = clientname;
	}

	public String getSdlbusinessunit() {
		return sdlbusinessunit;
	}

	public void setSdlbusinessunit(String sdlbusinessunit) {
		this.sdlbusinessunit = sdlbusinessunit;
	}

	public String getSdlcostcode() {
		return sdlcostcode;
	}

	public void setSdlcostcode(String sdlcostcode) {
		this.sdlcostcode = sdlcostcode;
	}

	public String getSdlnetworkoffice() {
		return sdlnetworkoffice;
	}

	public void setSdlnetworkoffice(String sdlnetworkoffice) {
		this.sdlnetworkoffice = sdlnetworkoffice;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getTranslatorname() {
		return translatorname;
	}

	public void setTranslatorname(String translatorname) {
		this.translatorname = translatorname;
	}

	public String getReviewername() {
		return reviewername;
	}

	public void setReviewername(String reviewername) {
		this.reviewername = reviewername;
	}

	public String getSectionevaluated() {
		return sectionevaluated;
	}

	public void setSectionevaluated(String sectionevaluated) {
		this.sectionevaluated = sectionevaluated;
	}

	public String getEvaluatorname() {
		return evaluatorname;
	}

	public void setEvaluatorname(String evaluatorname) {
		this.evaluatorname = evaluatorname;
	}

	public String getEvaluatedtype() {
		return evaluatedtype;
	}

	public void setEvaluatedtype(String evaluatedtype) {
		this.evaluatedtype = evaluatedtype;
	}

	public String getEvaluationmethod() {
		return evaluationmethod;
	}

	public void setEvaluationmethod(String evaluationmethod) {
		this.evaluationmethod = evaluationmethod;
	}

	public String getQadate() {
		return qadate;
	}

	public void setQadate(String qadate) {
		this.qadate = qadate;
	}

	public String getSourcelanguage() {
		return sourcelanguage;
	}

	public void setSourcelanguage(String sourcelanguage) {
		this.sourcelanguage = sourcelanguage;
	}

	public String getWordcount() {
		return wordcount;
	}

	public void setWordcount(String wordcount) {
		this.wordcount = wordcount;
	}

	public String getAdequacylevel() {
		return adequacylevel;
	}

	public void setAdequacylevel(String adequacylevel) {
		this.adequacylevel = adequacylevel;
	}

	public String getTargetlanguage() {
		return targetlanguage;
	}

	public void setTargetlanguage(String targetlanguage) {
		this.targetlanguage = targetlanguage;
	}

	public String getTranslationtype() {
		return translationtype;
	}

	public void setTranslationtype(String translationtype) {
		this.translationtype = translationtype;
	}

	public String getMeaningminor() {
		return meaningminor;
	}

	public void setMeaningminor(String meaningminor) {
		this.meaningminor = meaningminor;
	}

	public String getMeaningweighted() {
		return meaningweighted;
	}

	public void setMeaningweighted(String meaningweighted) {
		this.meaningweighted = meaningweighted;
	}

	public String getMeaningserious() {
		return meaningserious;
	}

	public void setMeaningserious(String meaningserious) {
		this.meaningserious = meaningserious;
	}

	public String getMeaningpoints() {
		return meaningpoints;
	}

	public void setMeaningpoints(String meaningpoints) {
		this.meaningpoints = meaningpoints;
	}

	public String getMeaningcategory() {
		return meaningcategory;
	}

	public void setMeaningcategory(String meaningcategory) {
		this.meaningcategory = meaningcategory;
	}

	public String getWrongminor() {
		return wrongminor;
	}

	public void setWrongminor(String wrongminor) {
		this.wrongminor = wrongminor;
	}

	public String getWrongweighted() {
		return wrongweighted;
	}

	public void setWrongweighted(String wrongweighted) {
		this.wrongweighted = wrongweighted;
	}

	public String getWrongserious() {
		return wrongserious;
	}

	public void setWrongserious(String wrongserious) {
		this.wrongserious = wrongserious;
	}

	public String getWrongpoints() {
		return wrongpoints;
	}

	public void setWrongpoints(String wrongpoints) {
		this.wrongpoints = wrongpoints;
	}

	public String getWrongcategory() {
		return wrongcategory;
	}

	public void setWrongcategory(String wrongcategory) {
		this.wrongcategory = wrongcategory;
	}

	public String getStructuralnminor() {
		return structuralnminor;
	}

	public void setStructuralnminor(String structuralnminor) {
		this.structuralnminor = structuralnminor;
	}

	public String getStructuralweighted() {
		return structuralweighted;
	}

	public void setStructuralweighted(String structuralweighted) {
		this.structuralweighted = structuralweighted;
	}

	public String getStructuralserious() {
		return structuralserious;
	}

	public void setStructuralserious(String structuralserious) {
		this.structuralserious = structuralserious;
	}

	public String getStructuralpoints() {
		return structuralpoints;
	}

	public void setStructuralpoints(String structuralpoints) {
		this.structuralpoints = structuralpoints;
	}

	public String getStructuralcategory() {
		return structuralcategory;
	}

	public void setStructuralcategory(String structuralcategory) {
		this.structuralcategory = structuralcategory;
	}

	public String getMisspellingminor() {
		return misspellingminor;
	}

	public void setMisspellingminor(String misspellingminor) {
		this.misspellingminor = misspellingminor;
	}

	public String getMisspellingweighted() {
		return misspellingweighted;
	}

	public void setMisspellingweighted(String misspellingweighted) {
		this.misspellingweighted = misspellingweighted;
	}

	public String getMisspellingserious() {
		return misspellingserious;
	}

	public void setMisspellingserious(String misspellingserious) {
		this.misspellingserious = misspellingserious;
	}

	public String getMisspellingpoints() {
		return misspellingpoints;
	}

	public void setMisspellingpoints(String misspellingpoints) {
		this.misspellingpoints = misspellingpoints;
	}

	public String getMisspellingcategory() {
		return misspellingcategory;
	}

	public void setMisspellingcategory(String misspellingcategory) {
		this.misspellingcategory = misspellingcategory;
	}

	public String getPunctuationminor() {
		return punctuationminor;
	}

	public void setPunctuationminor(String punctuationminor) {
		this.punctuationminor = punctuationminor;
	}

	public String getPunctuationweighted() {
		return punctuationweighted;
	}

	public void setPunctuationweighted(String punctuationweighted) {
		this.punctuationweighted = punctuationweighted;
	}

	public String getPunctuationserious() {
		return punctuationserious;
	}

	public void setPunctuationserious(String punctuationserious) {
		this.punctuationserious = punctuationserious;
	}

	public String getPunctuationpoints() {
		return punctuationpoints;
	}

	public void setPunctuationpoints(String punctuationpoints) {
		this.punctuationpoints = punctuationpoints;
	}

	public String getPunctuationcategory() {
		return punctuationcategory;
	}

	public void setPunctuationcategory(String punctuationcategory) {
		this.punctuationcategory = punctuationcategory;
	}

	public String getStyleminor() {
		return styleminor;
	}

	public void setStyleminor(String styleminor) {
		this.styleminor = styleminor;
	}

	public String getStyleweighted() {
		return styleweighted;
	}

	public void setStyleweighted(String styleweighted) {
		this.styleweighted = styleweighted;
	}

	public String getStyleserious() {
		return styleserious;
	}

	public void setStyleserious(String styleserious) {
		this.styleserious = styleserious;
	}

	public String getStylepoints() {
		return stylepoints;
	}

	public void setStylepoints(String stylepoints) {
		this.stylepoints = stylepoints;
	}

	public String getStylecategory() {
		return stylecategory;
	}

	public void setStylecategory(String stylecategory) {
		this.stylecategory = stylecategory;
	}

	public String getMiscellaneousminor() {
		return miscellaneousminor;
	}

	public void setMiscellaneousminor(String miscellaneousminor) {
		this.miscellaneousminor = miscellaneousminor;
	}

	public String getMiscellaneousweighted() {
		return miscellaneousweighted;
	}

	public void setMiscellaneousweighted(String miscellaneousweighted) {
		this.miscellaneousweighted = miscellaneousweighted;
	}

	public String getMiscellaneousserious() {
		return miscellaneousserious;
	}

	public void setMiscellaneousserious(String miscellaneousserious) {
		this.miscellaneousserious = miscellaneousserious;
	}

	public String getMiscellaneouspoints() {
		return miscellaneouspoints;
	}

	public void setMiscellaneouspoints(String miscellaneouspoints) {
		this.miscellaneouspoints = miscellaneouspoints;
	}

	public String getMiscellaneouscategory() {
		return miscellaneouscategory;
	}

	public void setMiscellaneouscategory(String miscellaneouscategory) {
		this.miscellaneouscategory = miscellaneouscategory;
	}

	public String getLegacydataerrors() {
		return legacydataerrors;
	}

	public void setLegacydataerrors(String legacydataerrors) {
		this.legacydataerrors = legacydataerrors;
	}

	public String getSourcetexterrors() {
		return sourcetexterrors;
	}

	public void setSourcetexterrors(String sourcetexterrors) {
		this.sourcetexterrors = sourcetexterrors;
	}

	public String getErrorpointsallowed() {
		return errorpointsallowed;
	}

	public void setErrorpointsallowed(String errorpointsallowed) {
		this.errorpointsallowed = errorpointsallowed;
	}

	public String getTotalcategoryerrorpoints() {
		return totalcategoryerrorpoints;
	}

	public void setTotalcategoryerrorpoints(String totalcategoryerrorpoints) {
		this.totalcategoryerrorpoints = totalcategoryerrorpoints;
	}

	public String getQualityindicator() {
		return qualityindicator;
	}

	public void setQualityindicator(String qualityindicator) {
		this.qualityindicator = qualityindicator;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getYxbz() {
		return yxbz;
	}

	public void setYxbz(String yxbz) {
		this.yxbz = yxbz;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public String getVendorid() {
		return vendorid;
	}

	public void setVendorid(String vendorid) {
		this.vendorid = vendorid;
	}

	public String getLead() {
		return lead;
	}

	public void setLead(String lead) {
		this.lead = lead;
	}

	public String getIfscwj() {
		return ifscwj;
	}

	public void setIfscwj(String ifscwj) {
		this.ifscwj = ifscwj;
	}

	public String getLmorgl() {
		return lmorgl;
	}

	public void setLmorgl(String lmorgl) {
		this.lmorgl = lmorgl;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getOverallreadability() {
		return overallreadability;
	}

	public void setOverallreadability(String overallreadability) {
		this.overallreadability = overallreadability;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getSdlqualityindicator() {
		return sdlqualityindicator;
	}

	public void setSdlqualityindicator(String sdlqualityindicator) {
		this.sdlqualityindicator = sdlqualityindicator;
	}

	public String getSdlqualityindicator_show() {
		return sdlqualityindicator_show;
	}

	public void setSdlqualityindicator_show(String sdlqualityindicator_show) {
		this.sdlqualityindicator_show = sdlqualityindicator_show;
	}

	public String getQastatus() {
		return qastatus;
	}

	public void setQastatus(String qastatus) {
		this.qastatus = qastatus;
	}

	public String getComponenttype() {
		return componenttype;
	}

	public void setComponenttype(String componenttype) {
		this.componenttype = componenttype;
	}

	public String getMatches() {
		return matches;
	}

	public void setMatches(String matches) {
		this.matches = matches;
	}

	public String getOmissionminor() {
		return omissionminor;
	}

	public void setOmissionminor(String omissionminor) {
		this.omissionminor = omissionminor;
	}

	public String getOmissionweighted() {
		return omissionweighted;
	}

	public void setOmissionweighted(String omissionweighted) {
		this.omissionweighted = omissionweighted;
	}

	public String getOmissionserious() {
		return omissionserious;
	}

	public void setOmissionserious(String omissionserious) {
		this.omissionserious = omissionserious;
	}

	public String getOmissionpoints() {
		return omissionpoints;
	}

	public void setOmissionpoints(String omissionpoints) {
		this.omissionpoints = omissionpoints;
	}

	public String getOmissioncategory() {
		return omissioncategory;
	}

	public void setOmissioncategory(String omissioncategory) {
		this.omissioncategory = omissioncategory;
	}

	public String getLrr() {
		return lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public String getRemark3() {
		return remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

	public String getRemark4() {
		return remark4;
	}

	public void setRemark4(String remark4) {
		this.remark4 = remark4;
	}

	public String getFtpfilename() {
		return ftpfilename;
	}

	public void setFtpfilename(String ftpfilename) {
		this.ftpfilename = ftpfilename;
	}

	public String getFilefilename() {
		return filefilename;
	}

	public void setFilefilename(String filefilename) {
		this.filefilename = filefilename;
	}

	public String getFilecontenttype() {
		return filecontenttype;
	}

	public void setFilecontenttype(String filecontenttype) {
		this.filecontenttype = filecontenttype;
	}

	public void setId(int id) {
		this.id = id;
	}

	

}