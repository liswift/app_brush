package com.eazy.lksy.web.utils;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExportUtil {

	public static void writeStream(OutputStream out, List<String[]> params) {
		try {
			Workbook wkbook = new HSSFWorkbook();

			Sheet sheet = wkbook.createSheet(); // 读取第一个工作簿
			// Sheet sheet = wkbook.cloneSheet(0);
			Row row;
			Cell cell = null;
			// 添加的起始行
			for (int i = 0; i < params.size(); i++) {
				CellStyle style = getStyle(wkbook);

				row = sheet.createRow(i);
				for (int j = 0; j < params.get(i).length; j++) {
					String value = params.get(i)[j];
					value = StrKit.isEmpty(value) ? "" : value;
					// sheet.setColumnWidth(i, value.getBytes().length*2*256);
					sheet.setColumnWidth(i, 5000);

					myCreateCell(j, value, row, cell, style);
				}
			}
			wkbook.write(out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static CellStyle getStyle(Workbook workbook) {
		// 设置字体;
		Font font = workbook.createFont();
		// 设置字体大小;
		font.setFontHeightInPoints((short) 12);
		// 设置字体名字;
		font.setFontName("Courier New");
		// font.setItalic(true);
		// font.setStrikeout(true);
		// 设置样式;
		CellStyle style = workbook.createCellStyle();
		// 设置底边�?
		style.setBorderBottom(CellStyle.BORDER_THIN);
		// 设置底边框颜�?
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边�?
		style.setBorderLeft(CellStyle.BORDER_THIN);
		// 设置左边框颜�?
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边�?
		style.setBorderRight(CellStyle.BORDER_THIN);
		// 设置右边框颜�?
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边�?
		style.setBorderTop(CellStyle.BORDER_THIN);
		// 设置顶边框颜�?
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字�?
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(CellStyle.ALIGN_CENTER);
		// 设置垂直对齐的样式为居中对齐;
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		return style;
	}

	private static void myCreateCell(int cellnum, String value, Row row, Cell cell, CellStyle style) {
		myCreateCell(cellnum, value, row, cell, style, null);
	}

	private static void myCreateCell(int cellnum, String value, Row row, Cell cell, CellStyle style, Sheet sheet) {

		cell = row.createCell((short) cellnum);
		cell.setCellValue(String.valueOf(value));
		cell.setCellStyle(style);
	}
}