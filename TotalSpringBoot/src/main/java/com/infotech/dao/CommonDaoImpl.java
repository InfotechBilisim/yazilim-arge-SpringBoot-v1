package com.infotech.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotech.config.Utils;
import com.infotech.dto.DataSuggestionDto;
import com.infotech.entity.SysParam;

@Repository
@Transactional
public class CommonDaoImpl implements CommonDao {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	private Utils utils;

	@Override
	public String getTranslateDbres(String keyword, String language, String val) {
		Session session = sessionFactory.getCurrentSession();

		String translate = session.createNativeQuery("SELECT GET_TRANSLATE_DBRES(?1,?2,?3) FROM DUAL")
				.setParameter(1, keyword).setParameter(2, language).setParameter(3, val).getSingleResult().toString();

		return translate;
	}
	/*** 3 ***/
	@Override
	public List<DataSuggestionDto> searchAddressesViaKey(String key, int count) {
		List<DataSuggestionDto> list = new ArrayList<DataSuggestionDto>();
		try {
			Session session = sessionFactory.getCurrentSession();

			String[] keywords = Utils.getSplitKeywords(key);

			String sql = "SELECT * FROM (SELECT ID,FROM_TABLE,TEXT,SUFFIX,XCOOR,YCOOR FROM SUGGESTION WHERE TEXT_KEYWORD LIKE :TheKeyboard "
					+ (keywords.length > 1 ? "AND SUFFIX_KEYWORD LIKE :TheKeyboard2 " : "")
					+ "ORDER BY PRIORITY) WHERE ROWNUM <= :TheCount";

			String keyWord0 = Utils.convToEnglish(keywords[0]).toUpperCase();
			keyWord0 = keyWord0.replaceAll(" ", "");

			NativeQuery query = session.createNativeQuery(sql).setParameter("TheKeyboard", "%" + keyWord0 + "%")
					.setParameter("TheCount", count);

			if (keywords.length > 1) {
				String keyWord1 = Utils.convToEnglish(keywords[1]).toUpperCase();
				keyWord1 = keyWord1.replaceAll(" ", "");
				query.setParameter("TheKeyboard", "%" + keyWord1 + "%");
			}

			List<Object[]> rows3 = query.list();

			for (Object[] row : rows3) {
				DataSuggestionDto dto = new DataSuggestionDto();
				dto.setId(row[0] != null ? Long.parseLong(row[0].toString()) : null);
				dto.setFromTable(row[1] != null ? row[1].toString() : null);
				dto.setName(row[2] != null ? row[2].toString() : null);
				dto.setSuffix(row[3] != null ? row[3].toString() : null);
				dto.setxCoor(row[4] != null ? Double.parseDouble(row[4].toString()) : null);
				dto.setyCoor(row[5] != null ? Double.parseDouble(row[5].toString()) : null);
				dto.setDataMode(3);

				String name = Utils.toFineCase(dto.getName() + (dto.getSuffix() != null ? ", " + dto.getSuffix() : ""));
				dto.setName(name);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}

		return list;

	}

	@Override
	public SysParam getSysParamByName(String paramName) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from SysParam where name= :TheParamName";
		Query query = session.createQuery(sql);
		query.setParameter("TheParamName", paramName);
		List<SysParam> dto = query.getResultList();
		return dto != null ? dto.get(0) : new SysParam();
	}

	
	@Override
	@SuppressWarnings("rawtypes")
	public Long getNextVal(String secName) {
		Session session = sessionFactory.getCurrentSession();
		if (!secName.equals("")) {
			Query q = session.createNativeQuery("select "+ secName +".nextval as num from dual");
			return ((BigDecimal) q.uniqueResult()).longValue();
		}
		return null;
	}
}
