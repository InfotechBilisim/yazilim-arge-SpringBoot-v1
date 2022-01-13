package com.infotech.service;

import java.util.List;

import com.infotech.dto.DataSuggestionDto;
import com.infotech.entity.SysParam;

public interface CommonService {

	public String getTranslateDbres(String keyword, String language, String obj);

	List<DataSuggestionDto> searchAddressesViaKey(String key, int count);
	
	public SysParam getSysParamByName(String paramName);

	public Long getNextVal(String secName);

}
