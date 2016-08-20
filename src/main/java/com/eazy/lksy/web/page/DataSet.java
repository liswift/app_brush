package com.eazy.lksy.web.page;

import java.util.List;

/**
 * 查询的数据列表
 * @author li.chang
 *
 * @param <T>
 */
public final class DataSet<T> {
	private List<T> rows;
	private final Long totalDisplayRecords;
	private final Long totalRecords;
	
	public DataSet(List<T> rows, Long totalRecords, Long totalDisplayRecords) {
		this.rows = rows;
		this.totalRecords = totalRecords;
		this.totalDisplayRecords = totalDisplayRecords;
	}

	public List<T> getRows() {
		return rows;
	}

	public Long getTotalDisplayRecords() {
		return totalDisplayRecords;
	}

	public Long getTotalRecords() {
		return totalRecords;
	}
}
