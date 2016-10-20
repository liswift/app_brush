package com.eazy.brush.core.utils;

import com.eazy.brush.core.export.Export;
import com.eazy.brush.core.export.ExportExcel;
import com.eazy.brush.core.export.ExportPdf;
import com.eazy.brush.core.export.ExportWord;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

/**
 * @author jzx
 * @desc http 请求处理工具类
 * @date 2016/2/6
 */
public class ActionRequest {

    public static String getPara(String name, HttpServletRequest request) {
        return request.getParameter(name);
    }

    public static void renderError(String msg, HttpServletResponse response) {
        try {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.getWriter().write("<script>alert('" + msg + "');</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void renderJson(String data, HttpServletResponse response) {
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void renderStream(String data, HttpServletResponse response) {
        response.setHeader("Content-Disposition", "attachment;filename=" + data);// 指定下载的文件名
        response.setContentType("application/octet-stream");
    }

    public static String[] getParaValues(String name, HttpServletRequest request) {
        return request.getParameterValues(name);
    }

    public static void setAttr(HttpServletRequest request, String key, Object value) {
        request.setAttribute(key, value);
    }

    public static Object getAttr(HttpServletRequest request, String key) {
        return request.getAttribute(key);
    }

    public static Enumeration<String> getAttrs(HttpServletRequest request) {
        return request.getAttributeNames();
    }

    public static void setAttrs(HttpServletRequest request, Map<String, Object> map) {
        for (Map.Entry<String, Object> m : map.entrySet()) {
            request.setAttribute(m.getKey(), m.getValue());
        }
    }

    public static void renderWEP(String fileName, String columnName, List<String[]> list1, int importWEP, HttpServletResponse response) {
        try {
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);// 指定下载的文件名
            response.setContentType("application/msexcel;charset=UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            Export excel = null;
            if (importWEP == 1) {
                excel = new ExportWord();
            } else if (importWEP == 2) {
                excel = new ExportExcel();
            } else if (importWEP == 3) {
                excel = new ExportPdf();
            }
            OutputStream out = null;
            out = excel.writeStream(outputStream, columnName, list1);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
