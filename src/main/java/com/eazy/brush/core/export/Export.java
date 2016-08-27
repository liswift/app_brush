package com.eazy.brush.core.export;

import java.io.OutputStream;
import java.util.List;

public abstract class Export {

	public abstract OutputStream writeStream(OutputStream out, String type, List<String[]> records);

	public static final String LOGMANAGER = "logManager"; // 日志管理
	
	protected String[] getColumns(String type) {
		if (LOGMANAGER.equals(type)) {
			return new String[] { "ID", "浏览器类型", "操作系统", "IP地址", "创建时间" };
		} else {
			return null;
		}
	}
}
