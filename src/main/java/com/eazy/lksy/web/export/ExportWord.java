package com.eazy.lksy.web.export;

import java.io.OutputStream;
import java.util.List;

import com.eazy.lksy.web.utils.WordUtil;

public class ExportWord extends Export {

	@Override
	public OutputStream writeStream(OutputStream out, String type, List<String[]> records) {
		String[] columns = getColumns(type);
		records.add(0, columns);
		WordUtil.writeStream(out, records);
		return out;
	}

}
