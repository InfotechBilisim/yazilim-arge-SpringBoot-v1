package com.infotech.dao;

import java.util.List;

import com.infotech.entity.ColumnContentDef;

public interface ColumnContentDefDao {

	public List<ColumnContentDef> getColumnContentDefList(String tableName, String columnName);

	public List<ColumnContentDef> getColumnContentDefListOrderByValue(String tableName, String columnName);
	
}
