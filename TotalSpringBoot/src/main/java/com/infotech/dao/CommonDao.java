package com.infotech.dao;

import java.util.List;

import com.infotech.dto.ColorCodeDto;
import com.infotech.dto.DataSuggestionDto;
import com.infotech.entity.SysParam;

public interface CommonDao {

	String getTranslateDbres(String keyword, String language, String obj);

	List<DataSuggestionDto> searchAddressesViaKey(String key, int count);

	public SysParam getSysParamByName(String paramName);

	Long getNextVal(String secName);
	
}
