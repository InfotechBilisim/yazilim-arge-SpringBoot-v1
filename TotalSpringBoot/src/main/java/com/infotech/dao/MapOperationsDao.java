package com.infotech.dao;

import com.infotech.map.DataMapInfo;

public interface MapOperationsDao {

	DataMapInfo getMapInfo(double latitude, double longitude, String company);

}
