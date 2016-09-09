package com.eazy.brush.controller.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eazy.brush.controller.common.models.ErrorModel;
import com.eazy.brush.controller.common.models.ErrorType;
import com.eazy.brush.controller.common.models.ResultDataModel;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eazy.brush.model.User;
import com.eazy.brush.core.utils.ActionRequest;
import com.eazy.brush.core.utils.DateUtils;
import com.eazy.brush.core.utils.JsonKsy;
import com.eazy.brush.core.utils.StringEscapeEditor;
import com.eazy.brush.core.utils.UserUtil;
import com.eazy.brush.controller.view.PageData;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * @author jzx
 * @desc controller 基础操作类
 * @date 2016.3.19
 */
@Slf4j
public abstract class BaseController {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected RedirectAttributes redirectAttributes;

    public static final ResultDataModel DEFAULT_SUCCESS_MODEL = new ResultDataModel(true, "操作成功。");

    public String getPara(String key) {
        return getRequest().getParameter(key);
    }

    public String getPara(String name, String defaultValue) {
        String result = getRequest().getParameter(name);
        return result != null && !"".equals(result) ? result : defaultValue;
    }

    public int getParaInt(String name, int defaultValue) {
        String result = getRequest().getParameter(name);
        return result != null && !"".equals(result) ? Integer.parseInt(result) : defaultValue;
    }

    private PageData getPageData() {
        return new PageData(getRequest());
    }

    public Map<String, String> getPageData(HttpServletRequest request) {
        return new PageData(request).getColumns();
    }

    public Map<String, String> getFormPage() {
        return getPageData().getColumns();
    }

    public Map<String, String> getData() {
        return getPageData().getColumns();
    }

    public String getStr(String name) {
        return getFormPage().get(name);
    }

    public String[] getParaValues(String key) {
        return getRequest().getParameterValues(key);
    }

    public void setAttr(String key, Object value) {
        getRequest().setAttribute(key, value);
    }

    public void setAttrs(Map<String, Object> map) {
        ActionRequest.setAttrs(getRequest(), map);
    }

    public Object getAttr(String key) {
        return getRequest().getAttribute(key);
    }

    public void renderResult(boolean result) {
        if (result) {
            renderJson200();
        } else {
            renderJson500();
        }
    }

    public void renderJson200() {
        renderJson("{\"code\":200}");
    }

    public void renderJson500() {
        renderJson("{\"code\":500}");
    }

    public void renderJsonError(String msg) {
        renderJson("{\"msg\":\" " + msg + " \"}");
    }

    public void renderJson(String data) {
        ActionRequest.renderJson(data, getResponse());
    }

    protected ErrorModel buildErrorModel(ErrorType errorType, Object... args) {
        ErrorModel model = new ErrorModel(getRequest().getRequestURI(), errorType.getDisplayMessage(), errorType, args);
        log.error(String.format("Error uri:%s, desc:%s", model.getRequest(), model.getDisplayMessage()));
        return model;
    }

    public void renderJson(Object data) {
        if (data instanceof List
                || data.getClass().isArray()) {
            Map<String, Object> dataMap = Maps.newHashMap();
            dataMap.put("data", data);
            ActionRequest.renderJson(JsonKsy.converMapToJson(dataMap), getResponse());
        } else {
            ActionRequest.renderJson(JsonKsy.converMapToJson(data), getResponse());
        }
    }

    public void renderWord(String fileName, String columnName, List<String[]> list1) {
        renderWEP(fileName, columnName, list1, 1);
    }

    public void renderExcel(String fileName, String columnName, List<String[]> list1) {
        renderWEP(fileName, columnName, list1, 2);
    }

    public void renderPdf(String fileName, String columnName, List<String[]> list1) {
        renderWEP(fileName, columnName, list1, 3);
    }

    private void renderWEP(String fileName, String columnName, List<String[]> list1, int type) {
        ActionRequest.renderWEP(fileName, columnName, list1, type, getResponse());
    }

    public List<Map<String, Object>> toGson(String data) {
        Gson gson = new Gson();
        return gson.fromJson(data, new TypeToken<List<Map<String, Object>>>() {
        }.getType());
    }

    public String toJson(Object src) {
        Gson gson = new Gson();
        return gson.toJson(src);
    }

    /**
     * 拿到一些时间的简单调用
     */
    public String getTimeNow() {
        return DateUtils.getNowTime();
    }

    /**
     * 拿到系统当前用户信息
     */
    public User getCurrentUser() {
        return UserUtil.getCurrentUser();
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        /**
         * 自动转换日期类型的字段格式
         */
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

        /**
         * 防止XSS攻击
         */
        binder.registerCustomEditor(String.class, new StringEscapeEditor(true, true));
    }

    @ModelAttribute
    private void init(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        this.request = request;
        this.response = response;
        this.redirectAttributes = redirectAttributes;
    }

    public HttpServletResponse getResponse() {
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        return response;
    }

    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public HttpSession getSession() {
        return getRequest().getSession();
    }

}
