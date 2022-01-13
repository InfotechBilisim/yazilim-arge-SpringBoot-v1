package com.infotech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotech.dao.CommonDao;
import com.infotech.dto.ColorCodeDto;
import com.infotech.dto.DataSuggestionDto;
import com.infotech.entity.SysParam;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;

	@Override
	public String getTranslateDbres(String keyword, String language, String obj) {
		String translateStrings = null;
		if (keyword != null && obj != null) {
			translateStrings = commonDao.getTranslateDbres(keyword, language != null ? language : "tr", obj);
		}
		return translateStrings;
	}

	@Override
	public List<DataSuggestionDto> searchAddressesViaKey(String key, int count) {
		return commonDao.searchAddressesViaKey(key, count);
	}

	@Override
	public SysParam getSysParamByName(String paramName) {
		return commonDao.getSysParamByName(paramName);
	}

	@Override
	public Long getNextVal(String secName) {
		return commonDao.getNextVal(secName);
	}
}
