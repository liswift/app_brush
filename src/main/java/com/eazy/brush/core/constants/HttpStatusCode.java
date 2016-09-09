package com.eazy.brush.core.constants;

public class HttpStatusCode {

    /**
     * 正常请求
     */
    public final static int OK_REQUEST = 200;
    /**
     * 请求出错 由于语法格式有误，服务器无法理解此请求。不作修改，客户程序就无法重复此请求。
     */
    public final static int BADREQUEST = 400;
    /**
     * 未授权
     */
    public final static int NOT_AUTHORIZED = 401;
    /**
     * 禁止执行访问
     */
    public final static int FORBIDDEN = 403;

    /**
     * 资源未找到
     */
    public final static int NOT_FOUND = 404;
    /**
     * 500 服务器的内部错误
     */
    public final static int INTERNAL_SERVER_ERROR = 500;
    /**
     * 未实现  Web 服务器不支持实现此请求所需的功能。请检查URL 中的错误，如果问题依然存在，请与 Web服务器的管理员联系。
     */
    public final static int SERVICE_UNREALIZED = 501;
    /**
     * 服务停止
     */
    public final static int SERVICE_UNAVAILABLE = 503;
}
