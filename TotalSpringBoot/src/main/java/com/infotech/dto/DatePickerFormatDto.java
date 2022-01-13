package com.infotech.dto;

import java.io.Serializable;
import java.util.Date;

public class DatePickerFormatDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String stringStDate;
	private String stringEndDate;

	private Date stDate;
	private Date endDate;

	private String dateRange;
	private boolean useYesterdayDate = false;

	public DatePickerFormatDto(Date stDate, Date endDate) {
		super();
		this.stDate = stDate;
		this.endDate = endDate;
	}

	public DatePickerFormatDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DatePickerFormatDto(String stringStDate, String stringEndDate) {
		super();
		this.stringStDate = stringStDate;
		this.stringEndDate = stringEndDate;
	}

	public DatePickerFormatDto(String stringStDate, String stringEndDate, String dateRange) {
		super();
		this.stringStDate = stringStDate;
		this.stringEndDate = stringEndDate;
		this.dateRange = dateRange;
	}

	public String getStringStDate() {
		return stringStDate;
	}

	public void setStringStDate(String stringStDate) {
		this.stringStDate = stringStDate;
	}

	public String getStringEndDate() {
		return stringEndDate;
	}

	public void setStringEndDate(String stringEndDate) {
		this.stringEndDate = stringEndDate;
	}

	public Date getStDate() {
		return stDate;
	}

	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public boolean isUseYesterdayDate() {
		return useYesterdayDate;
	}

	public void setUseYesterdayDate(boolean useYesterdayDate) {
		this.useYesterdayDate = useYesterdayDate;
	}

}
