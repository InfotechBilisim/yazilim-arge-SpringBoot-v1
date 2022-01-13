package com.infotech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "COLUMN_CONTENT_DEF")
public class ColumnContentDef implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TABLE_NAME", nullable = false)
	private String tableName;

	@Id
	@Column(name = "COLUMN_NAME", nullable = false)
	private String columnName;

	@Id
	@Column(name = "COLUMN_VALUE", nullable = false)
	private String columnValue;

	@Column(name = "COLUMN_DEF", nullable = true)
	private String columnDef;

	public String getColumnDef() {
		return columnDef;
	}

	public void setColumnDef(String columnDef) {
		this.columnDef = columnDef;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnValue() {
		return columnValue;
	}

	public void setColumnValue(String columnValue) {
		this.columnValue = columnValue;
	}

	@Override
	public String toString() {
		return "ColumnContentDef [columnDef=" + columnDef + ", tableName=" + tableName + ", columnName=" + columnName
				+ ", columnValue=" + columnValue + "]";
	}

}
