package com.eazy.brush.controller.view.web.page;

/**
 * 代码来源 http://www.suchso.com/projecteactual/jquery-datatable-jsp-demo.html
 */
public class DataTableReturnObject {
	
	private int iTotalRecords;
	private int iTotalDisplayRecords;
	private String sEcho;
	private String[][] aaData;

	public DataTableReturnObject(int totalRecords, int totalDisplayRecords, String echo, String[][] d) {
		this.setiTotalRecords(totalRecords);
		this.setiTotalDisplayRecords(totalDisplayRecords);
		this.setsEcho(echo);
		this.setAaData(d);
	}

	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	public int getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setsEcho(String sEcho) {
		this.sEcho = sEcho;
	}

	public String getsEcho() {
		return sEcho;
	}

	public void setAaData(String[][] aaData) {
		this.aaData = aaData;
	}

	public String[][] getAaData() {
		return aaData;
	}
}