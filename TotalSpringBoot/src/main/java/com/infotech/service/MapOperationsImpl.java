package com.infotech.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotech.dao.MapOperationsDao;
import com.infotech.map.DataMapInfo;

@Service
public class MapOperationsImpl implements MapOperations {
	
	@Autowired
	private MapOperationsDao mapOpDao;
	
	  @Override
	  public DataMapInfo getMapInfo (double latitude, double longitude,String company) {
		  
		  
		  	DataMapInfo dmi = mapOpDao.getMapInfo(latitude,longitude,company);
		    
		  	
		    return dmi;  
		 }
}
