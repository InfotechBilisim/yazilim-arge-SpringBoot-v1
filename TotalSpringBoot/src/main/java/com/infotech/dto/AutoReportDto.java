package com.infotech.dto;

import java.io.Serializable;
import java.util.List;

public class AutoReportDto implements Serializable {

	private static final long serialVersionUID = 6738955057181360917L;

	private Long rowno;

	private String report_name;

	private Long auto_rpt_type;

	private Long zip_flag;

	private Long report_period_type;

	private Long report_period;

	private Long aylik_rapor;

	private Long gunluk_rapor;

	private Long haftalik_rapor;

	private String email;

	private Long auto_rptmail;

	private Long id;
	private String text;

	private List<Long> reportList;

	public AutoReportDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AutoReportDto(Long rowno, String report_name, Long auto_rpt_type, Long zip_flag, Long report_period_type,
			Long report_period, Long aylik_rapor, Long gunluk_rapor, Long haftalik_rapor, String email,
			Long auto_rptmail) {
		super();
		this.rowno = rowno;
		this.report_name = report_name;
		this.auto_rpt_type = auto_rpt_type;
		this.zip_flag = zip_flag;
		this.report_period_type = report_period_type;
		this.report_period = report_period;
		this.aylik_rapor = aylik_rapor;
		this.gunluk_rapor = gunluk_rapor;
		this.haftalik_rapor = haftalik_rapor;
		this.email = email;
		this.auto_rptmail = auto_rptmail;
	}

	public AutoReportDto(String report_name, Long rowno) {
		super();
		this.rowno = rowno;
		this.report_name = report_name;
		this.text = report_name;
		this.id = rowno;
	}

	public AutoReportDto(String report_name, Long rowno, Long aylik_rapor, Long gunluk_rapor, Long haftalik_rapor) {
		super();
		this.rowno = rowno;
		this.report_name = report_name;
		this.aylik_rapor = aylik_rapor;
		this.gunluk_rapor = gunluk_rapor;
		this.haftalik_rapor = haftalik_rapor;
		this.text = report_name;
		this.id = rowno;
	}

	public AutoReportDto(Long rowno, String report_name, Long auto_rpt_type, Long zip_flag, Long report_period_type,
			Long report_period, Long aylik_rapor, Long gunluk_rapor, Long haftalik_rapor, String email,
			Long auto_rptmail, Long id, String text, List<Long> reportList) {
		super();
		this.rowno = rowno;
		this.report_name = report_name;
		this.auto_rpt_type = auto_rpt_type;
		this.zip_flag = zip_flag;
		this.report_period_type = report_period_type;
		this.report_period = report_period;
		this.aylik_rapor = aylik_rapor;
		this.gunluk_rapor = gunluk_rapor;
		this.haftalik_rapor = haftalik_rapor;
		this.email = email;
		this.auto_rptmail = auto_rptmail;
		this.id = id;
		this.text = text;
		this.reportList = reportList;
	}

	public Long getAuto_rptmail() {
		return auto_rptmail;
	}

	public void setAuto_rptmail(Long auto_rptmail) {
		this.auto_rptmail = auto_rptmail;
	}

	public Long getRowno() {
		return rowno;
	}

	public void setRowno(Long rowno) {
		this.rowno = rowno;
	}

	public String getReport_name() {
		return report_name;
	}

	public void setReport_name(String report_name) {
		this.report_name = report_name;
	}

	public Long getAuto_rpt_type() {
		return auto_rpt_type;
	}

	public void setAuto_rpt_type(Long auto_rpt_type) {
		this.auto_rpt_type = auto_rpt_type;
	}

	public Long getZip_flag() {
		return zip_flag;
	}

	public void setZip_flag(Long zip_flag) {
		this.zip_flag = zip_flag;
	}

	public Long getReport_period_type() {
		return report_period_type;
	}

	public void setReport_period_type(Long report_period_type) {
		this.report_period_type = report_period_type;
	}

	public Long getReport_period() {
		return report_period;
	}

	public void setReport_period(Long report_period) {
		this.report_period = report_period;
	}

	public Long getAylik_rapor() {
		return aylik_rapor;
	}

	public void setAylik_rapor(Long aylik_rapor) {
		this.aylik_rapor = aylik_rapor;
	}

	public Long getGunluk_rapor() {
		return gunluk_rapor;
	}

	public void setGunluk_rapor(Long gunluk_rapor) {
		this.gunluk_rapor = gunluk_rapor;
	}

	public Long getHaftalik_rapor() {
		return haftalik_rapor;
	}

	public void setHaftalik_rapor(Long haftalik_rapor) {
		this.haftalik_rapor = haftalik_rapor;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<Long> getReportList() {
		return reportList;
	}

	public void setReportList(List<Long> reportList) {
		this.reportList = reportList;
	}

}
