package com.infotech.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotech.dto.BolgeDto;


@Repository
@Transactional
public class BolgeDaoImpl implements BolgeDao{

	private static final Logger logger = LogManager.getLogger(BolgeDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<BolgeDto> getBolgeById(Long bolgeId) {
		List<BolgeDto> list = new ArrayList<BolgeDto>();
		logger.info("Bolgeler listesi veritabanından çekiliyor.");

		Session session = sessionFactory.getCurrentSession();
		try {
			String sql = "SELECT BOLGE_ID,BOLGE_ADI,XCOOR,YCOOR,KEYWORD, ULKE_ID FROM BOLGE WHERE ULKE_ID=:TheUlkeId ORDER BY BOLGE_ADI";
			List<Object[]> rows =  session.createNativeQuery(sql).setParameter("TheUlkeId", bolgeId).list();
			for (Object[] row : rows) {				
				BolgeDto dto = new BolgeDto(row);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}
		return list;
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
