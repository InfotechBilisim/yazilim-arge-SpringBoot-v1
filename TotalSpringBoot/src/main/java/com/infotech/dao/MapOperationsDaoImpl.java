package com.infotech.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.infotech.map.DataMapInfo;

@Repository
@Transactional
public class MapOperationsDaoImpl implements MapOperationsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public DataMapInfo getMapInfo(double latitude, double longitude, String company) {

		Session session = sessionFactory.getCurrentSession();
		DataMapInfo dmi = new DataMapInfo();

		String sql = "SELECT ULKE_ADI,IL_ADI,ILCE_ADI,MAHALLE_ADI FROM ADMIN_AREA ";
		sql += "WHERE SDO_ANYINTERACT(GEOLOC, SDO_GEOMETRY(2001,8307, SDO_POINT_TYPE(:latitude,:longitude,NULL), NULL, NULL)) = 'TRUE' ";

		List<Object> object = session.createNativeQuery(sql).setParameter("latitude", latitude)
				.setParameter("longitude", longitude).list();

		if (object != null) {

			Object[] result = (Object[]) object.get(0);

			dmi.setCountry(result[0].toString());
			dmi.setDistrict(result[1].toString());
			dmi.setQuarter(result[2].toString());
			dmi.setTown(result[3].toString());

		}

		sql = "SELECT NAME FROM YOL_G WHERE SDO_NN(GEOLOC, SDO_GEOMETRY(2001,8307, SDO_POINT_TYPE(:latitude,:longitude,NULL), NULL, NULL),'SDO_NUM_RES=1') = 'TRUE' ";
		object = session.createNativeQuery(sql).setParameter("latitude", latitude).setParameter("longitude", longitude)
				.list();

		if (object != null) {
			dmi.setRoad(object.get(0).toString());

		}

		sql = "SELECT STANDARD_NAME,SDO_NN_DISTANCE(1),SDO_GEOM.SDO_CENTROID(GEOLOC, 0.5).SDO_POINT.X,SDO_GEOM.SDO_CENTROID(GEOLOC, 0.5).SDO_POINT.Y FROM ";
		sql += "POI_ENYAKIN WHERE SDO_NN(GEOLOC, SDO_GEOMETRY(2001,8307, SDO_POINT_TYPE(:latitude,:longitude,NULL), NULL, NULL),'SDO_NUM_RES=1',1) = 'TRUE' ";
		object = session.createNativeQuery(sql).setParameter("latitude", latitude).setParameter("longitude", longitude)
				.list();

		if (object != null) {
			Object[] result = (Object[]) object.get(0);
			dmi.setPoi(result[0].toString());
			dmi.setPoiDist(result[1].toString());
			dmi.setPoiLatitude(Double.parseDouble(result[2].toString()));
			dmi.setPoiLongitude(Double.parseDouble(result[3].toString()));

		}

		sql = "SELECT POINTNAME,((:latitude - XCOOR) * (:latitude - XCOOR) + (:longitude - YCOOR) * (:longitude - YCOOR)) DIST,XCOOR,YCOOR FROM ";
		sql += "CUSTOMER_POINTS WHERE CUSTNAME = :company ORDER BY DIST ";
		object = session.createNativeQuery(sql).setParameter("latitude", latitude).setParameter("longitude", longitude)
				.setParameter("company", company).list();

		if (object != null) {
			Object[] result = (Object[]) object.get(0);
			dmi.setCust(result[0].toString());
			dmi.setCustDist(result[1].toString());
			dmi.setCustLatitude(Double.parseDouble(result[2].toString()));
			dmi.setCustLongitude(Double.parseDouble(result[3].toString()));
		}

		return dmi;
	}
}
