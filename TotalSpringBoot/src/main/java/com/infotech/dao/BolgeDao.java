package com.infotech.dao;

import java.util.List;

import com.infotech.dto.BolgeDto;

public interface BolgeDao {
	public List<BolgeDto> getBolgeById(Long ulkeId);
	public List<BolgeDto> getIller();
	public List<BolgeDto> getIlById(Long ilId);
	public List<BolgeDto> getIlceById(Long ilId);
	public List<BolgeDto> getMahalleById(Long ilceId);
}
