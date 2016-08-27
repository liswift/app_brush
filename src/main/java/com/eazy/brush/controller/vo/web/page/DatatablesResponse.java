package com.eazy.brush.controller.vo.web.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 显示给前端的数据
 * @author li.chang
 *
 * @param <T>
 */
public class DatatablesResponse<T> {
	/**
	 * 总记录条数
	 */
	private long recordsTotal;
	
	/**
	 * 实际总记录数
	 */
	private long recordsFiltered;
	
	/**
	 * 数据集合
	 */
	private List<T> data = new ArrayList<T>();
	/**
	 * 次数
	 */
	private Integer draw;
	
	private DatatablesResponse(DataSet<T> dataSet, PageCriterias pcs) {
		this.data = dataSet.getRows();
		this.recordsTotal = dataSet.getTotalRecords();
		this.recordsFiltered = dataSet.getTotalDisplayRecords();
		this.draw = pcs.getDraw();
	}
	
	public static <T> DatatablesResponse<T> build(DataSet<T> dataSet, PageCriterias pcs) {
		return new DatatablesResponse<T>(dataSet, pcs);
	}

	public long getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public long getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Integer getDraw() {
		return draw;
	}

	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	
}
