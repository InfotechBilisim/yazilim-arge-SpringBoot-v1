package com.infotech.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.infotech.entity.ColumnContentDef;

@Repository
@Transactional
public class ColumnContentDefDaoImpl implements ColumnContentDefDao {

	private static final Logger logger = LogManager.getLogger(ColumnContentDefDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<ColumnContentDef> getColumnContentDefList(String tableName, String columnName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from ColumnContentDef WHERE TABLE_NAME = :TableName AND COLUMN_NAME= :ColumnName");
		query.setParameter("TableName", tableName);
		query.setParameter("ColumnName", columnName);
		List<ColumnContentDef> list = query.getResultList();
		return list;
	}
	
	
	@Override
	public List<ColumnContentDef> getColumnContentDefListOrderByValue(String tableName, String columnName) {
		Session session = sessionFactory.getCurrentSession();
		
		String sql = "SELECT * FROM COLUMN_CONTENT_DEF WHERE TABLE_NAME = :TableName AND COLUMN_NAME= :ColumnName ORDER BY TO_NUMBER(COLUMN_VALUE)";
		List<Object> list = session.createNativeQuery(sql).setParameter("TableName", tableName).setParameter("ColumnName", columnName).list();
		
		List<ColumnContentDef> listDto = new ArrayList<ColumnContentDef>();
		
		
		if (list != null) {
			Object[] item = list.toArray(new Object[list.size()]);

			for (int i = 0; i < list.size(); i++) {
				Object[] m = (Object[]) item[i];
				ColumnContentDef dto = new ColumnContentDef();

				dto.setTableName(m[0].toString());
				dto.setColumnName(m[1].toString());
				dto.setColumnValue(m[2].toString());
				dto.setColumnDef(m[3].toString());

				listDto.add(dto);
			}
		}
		
		return listDto;
	}
	
}
