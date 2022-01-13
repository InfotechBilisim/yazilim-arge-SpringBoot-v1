package com.infotech.dto;

public class DataSuggestionDto {
	
	private Long id;
	private String fromTable;
	private String name;
	private String suffix;
	private Double xCoor;
	private Double yCoor;
	private int dataMode; // hangi tipte veri aramasına ait olduğunun tutulduğu alan
	
	
	
	public DataSuggestionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DataSuggestionDto(Long id, String fromTable, String name, String suffix, Double xCoor, Double yCoor,
			int dataMode) {
		super();
		this.id = id;
		this.fromTable = fromTable;
		this.name = name;
		this.suffix = suffix;
		this.xCoor = xCoor;
		this.yCoor = yCoor;
		this.dataMode = dataMode;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFromTable() {
		return fromTable;
	}
	public void setFromTable(String fromTable) {
		this.fromTable = fromTable;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	public Double getxCoor() {
		return xCoor;
	}
	public void setxCoor(Double xCoor) {
		this.xCoor = xCoor;
	}
	public Double getyCoor() {
		return yCoor;
	}
	public void setyCoor(Double yCoor) {
		this.yCoor = yCoor;
	}
	public int getDataMode() {
		return dataMode;
	}
	public void setDataMode(int dataMode) {
		this.dataMode = dataMode;
	}
	
}
