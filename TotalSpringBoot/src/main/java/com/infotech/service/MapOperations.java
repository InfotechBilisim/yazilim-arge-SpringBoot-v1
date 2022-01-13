package com.infotech.service;

import com.infotech.map.DataMapInfo;

public interface MapOperations {

	DataMapInfo getMapInfo(double latitude, double longitude, String company);

}
