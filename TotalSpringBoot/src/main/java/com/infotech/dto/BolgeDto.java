package com.infotech.dto;

import java.io.Serializable;

public class BolgeDto implements Serializable {
	private Long id = 0L;
	private String name = null;
	private Double xcoor = 0.00;
	private Double ycoor = 0.00;
    private String keyword = null;
    private Long bolgeId = 0L;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getXcoor() {
		return xcoor;
	}
	public void setXcoor(Double xcoor) {
		this.xcoor = xcoor;
	}
	public Double getYcoor() {
		return ycoor;
	}
	public void setYcoor(Double ycoor) {
		this.ycoor = ycoor;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Long getBolgeId() {
		return bolgeId;
	}
	public void setBolgeId(Long bolgeId) {
		this.bolgeId = bolgeId;
	}
	
   public BolgeDto(Object[] row) {
	    try {
	      int i = 0;
	      this.id = row[i] != null ? Long.parseLong(row[i].toString()) : null;
	      this.name = row[++i] != null ? row[i].toString() : null;
	      this.xcoor = row[++i] != null ? Double.parseDouble(row[i].toString()) : null;
	      this.ycoor = row[++i] != null ? Double.parseDouble(row[i].toString()) : null;
	      this.keyword = row[++i] != null ? row[i].toString() : null;	
	      this.bolgeId = row[++i] != null ? Long.parseLong(row[i].toString()) : null;
	    }
	    catch (Exception ex) {
	      ex.printStackTrace();
	    }
	  }
	
}
