package com.infotech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotech.dao.BolgeDao;
import com.infotech.dto.BolgeDto;

@Service
public class BolgeServiceImpl implements BolgeService {
	@Autowired
	private BolgeDao dao;
	@Override
	public List<BolgeDto> getBolgeById(Long ulkeId) {
		return dao.getBolgeById(ulkeId);
	}

	@Override
	public List<BolgeDto> getIller() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BolgeDto> getIlById(Long ilId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BolgeDto> getIlceById(Long ilId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BolgeDto> getMahalleById(Long ilceId) {
		// TODO Auto-generated method stub
		return null;
	}

}
