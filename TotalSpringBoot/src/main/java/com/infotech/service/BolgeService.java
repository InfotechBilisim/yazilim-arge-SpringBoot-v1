package com.infotech.service;

import java.util.List;

import com.infotech.dto.BolgeDto;

public interface BolgeService {
	public List<BolgeDto> getBolgeById(Long ulkeId);
	public List<BolgeDto> getIller();
	public List<BolgeDto> getIlById(Long ilId);
	public List<BolgeDto> getIlceById(Long ilId);
	public List<BolgeDto> getMahalleById(Long ilceId);
}
