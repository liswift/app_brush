package com.eazy.brush.core.export;

import java.io.OutputStream;
import java.util.List;

import com.eazy.brush.core.utils.PdfUtil;

public class ExportPdf extends Export {

	@Override
	public OutputStream writeStream(OutputStream out, String type, List<String[]> records) {
		String[] columns = getColumns(type);
		records.add(0, columns);
		PdfUtil.writeStream(out, records);
		return out;
	}

}
