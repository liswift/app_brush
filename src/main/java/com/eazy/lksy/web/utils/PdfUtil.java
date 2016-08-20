package com.eazy.lksy.web.utils;

import java.io.OutputStream;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfUtil {
	// 表格的设置
	private static final int spacing = 2;

	// 表格的设置
	private static final int padding = 2;

	// 导出Pdf文挡
	public static void writeStream(OutputStream out, List<String[]> params) {
		// 创建文Pdf文挡50, 50, 50,50左右上下距离
		Document document = new Document(new Rectangle(1500, 2000), 50, 50, 50,
				50);
		try {
			//使用PDFWriter进行写文件操作
			PdfWriter.getInstance(document, out);
			document.open();
			// 中文字体
			BaseFont bfChinese = BaseFont.createFont("STSong-Light",
					"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			Font fontChinese = new Font(bfChinese, 12, Font.NORMAL);
			// 创建有colNumber(6)列的表格
			PdfPTable datatable = new PdfPTable(params.get(0).length);
			//定义表格的宽度
			int[] cellsWidth = { 3, 3, 3, 3, 3 };
			datatable.setWidths(cellsWidth);
			// 表格的宽度百分比
			datatable.setWidthPercentage(100);
			datatable.getDefaultCell().setPadding(padding);
			datatable.getDefaultCell().setBorderWidth(spacing);
			//设置表格的底色
			datatable.getDefaultCell().setBackgroundColor(BaseColor.GREEN);
			datatable.getDefaultCell().setHorizontalAlignment(
					Element.ALIGN_CENTER);
			// 添加表头元素
			for (int i = 0; i < params.get(0).length; i++) {
				datatable.addCell(new Paragraph(params.get(0)[i], fontChinese));
			}
			params.remove(0);
			// 添加子元素
			for (int i = 0; i < params.size(); i++) {
				String [] value = params.get(i);
				for(String v : value)
					datatable.addCell(new Paragraph(v, fontChinese));
			}
			document.add(datatable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.close();
	}

}
