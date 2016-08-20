package com.eazy.lksy.web.utils;

import java.awt.Color;
import java.io.OutputStream;
import java.util.List;

import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.rtf.RtfWriter2;

public class WordUtil {

	// 数据表字段数
	private static final int colNumber = 6;
	// 表格的设置
	private static final int spacing = 2;
	private static final int padding = 2;

	// 导出到word文档
	public static void writeStream(OutputStream out, List<String[]> params) {
		// 创建word文档PageSize.A4,表示用什么型号的纸
		Document document = new Document(PageSize.A4);
		try {
			RtfWriter2.getInstance(document, out);
			document.open();

			// 设置中文字体大小
			BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			Font fontChinese = new Font(bfChinese, 12, Font.NORMAL);
			// 创建有8列的表格
			Table datatable = new Table(params.get(0).length);
			// 每列宽度
			int[] cellsWidth = { 3, 5, 4, 6, 10 };
			datatable.setWidths(cellsWidth);
			datatable.setPadding(padding);
			datatable.setBorderWidth(spacing);
			datatable.setBackgroundColor(Color.ORANGE);
			datatable.setAlignment(Element.ALIGN_CENTER);
			// datatable.setDefaultHorizontalAlignment();
			// 添加表头元素
			for (int i = 0; i < params.get(0).length; i++) {
				datatable.addCell(new Paragraph(params.get(0)[i]));
			}
			params.remove(0);
			// 添加子元素
			for (int i = 0; i < params.size(); i++) {
				String[] value = params.get(i);
				for (String v : value) {
						v = StrKit.isEmpty(v) ? "" : v;
						datatable.addCell(new Paragraph(v));
				}
			}
			document.add(datatable);

		} catch (Exception e) {
			e.printStackTrace();
		}
		document.close();

	}


}
