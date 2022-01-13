package com.infotech.dto;

import java.io.Serializable;
import java.util.List;

public class LongListWrapper implements Serializable {

	private static final long serialVersionUID = 1L;

	List<Long> longList;

	private Long dataId;

	public LongListWrapper() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LongListWrapper(List<Long> longList) {
		super();
		this.longList = longList;
	}

	public List<Long> getLongList() {
		return longList;
	}

	public void setLongList(List<Long> longList) {
		this.longList = longList;
	}

	public Long getDataId() {
		return dataId;
	}

	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}

}
