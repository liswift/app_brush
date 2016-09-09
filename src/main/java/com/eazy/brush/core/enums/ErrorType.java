package com.eazy.brush.core.enums;


import com.google.common.collect.Maps;

import static com.eazy.brush.core.constants.HttpStatusCode.*;

import java.util.Map;

public enum ErrorType {
    _10001(INTERNAL_SERVER_ERROR, 10001, "System error", "服务器开小差了~等一下下嘛~"),
    _10002(INTERNAL_SERVER_ERROR, 10002, "Service unavailable", "服务器在偷懒儿,请稍候再试"),
    _10003(INTERNAL_SERVER_ERROR, 10003, "Remote service error", "不要着急,休息一下"),
    _10004(FORBIDDEN, 10004, "Access was forbidden", "无权访问，请订购"),
    _10005(FORBIDDEN, 10005, "Error devicString index out of rangeeId", "未注册的设备，无法使用"),
    _10006(FORBIDDEN, 10006, "Access was forbidden", "您的设备 {} 禁止访问，请联系客服"),
    _10008(BADREQUEST, 10008, "Param ({}) error, see doc for more info", "参数{}错误,{}"),
    _10009(BADREQUEST, 10009, "header info lost", "请求失败,稍候再试,如仍未成功请联系客服人员"),
    _10016(BADREQUEST, 10016, "Miss required parameter ({}) , see doc for more info", "亲，你没填完哦"),
    _10017(BADREQUEST, 10017, "", "亲，你没填{}哦"),
    _10024(NOT_AUTHORIZED, 10024, "Unsupported operations", "请拨打10010进行订购/退订操作。"),
    _10025(SERVICE_UNREALIZED, 10025, "Unsupported operations", "该操作不被支持"),
    _10026(NOT_FOUND, 10026, "Resource Not Found", "资源未找到"),


    _20001(INTERNAL_SERVER_ERROR, 20001, "Unknown logic error", "发生未知错误"),
    _20002(FORBIDDEN, 20002, "Target appId does not exist", "appId不存在"),
    _20003(BADREQUEST, 20003, "The target length is too short", "目标内容过短"),
    _20004(BADREQUEST, 20004, "Param {} length is too long", "{}内容过长"),
    _20005(BADREQUEST, 20005, "Param {} length is too short", "{}内容过短"),
    _20006(FORBIDDEN, 20006, "Not login", "请登录后进行操作"),
    _20007(FORBIDDEN, 20007, "Mobile Version not found", "您当前已是最新版本"),
    _20008(BADREQUEST, 20008, "Hasn't bind device yet", "尚未绑定设备"),

    _20300(BADREQUEST, 20300, "", "亲,忘记密码了? 可以通过手机找回密码。"),    //
    _20301(INTERNAL_SERVER_ERROR, 20301, "Auth faild", "登录失败，请稍后再试"),    //认证失败
    _20302(BADREQUEST, 20302, "Username or password error", "您输入的账号或密码错误"),   //用户名或密码不正确
    _20303(BADREQUEST, 20303, "Parameter absent", "您还没有填写账号和密码"),                                //缺少必要的参数
    _20304(BADREQUEST, 20304, "Parameter rejected", "登录失败，请联系客服"),                                             //OAuth参数被拒绝
    _20305(BADREQUEST, 20305, "Invalid request", "登录失败，请与客服联系"),
    _20306(BADREQUEST, 20306, "Invalid client", "请使用官方客户端"),
    _20307(INTERNAL_SERVER_ERROR, 20307, "Unauthorized client", "请使用最新官方客户端"),
    _20308(BADREQUEST, 20308, "Redirect uri mismatch", "重定向uir不匹配"),
    _20309(FORBIDDEN, 20309, "Access denied", "操作被拒绝"),
    _20310(BADREQUEST, 20310, "Unsupported response type", "不支持的返回类型"),
    _20311(BADREQUEST, 20311, "Unsupported grant type", "登录失败，请联系客服人员"),
    _20312(BADREQUEST, 20312, "Invalid scope", "无效区域"),
    _20313(BADREQUEST, 20313, "Invalid grant", "无效授权"),
    _20314(BADREQUEST, 20314, "Invalid token", "登录失效，请重新登录"),
    _20315(FORBIDDEN, 20315, "Invalid auth uid", "此账号已禁用，请联系客服人员"),
    _20316(FORBIDDEN, 20316, "User does not exist", "不存在此账号"),
    _20317(FORBIDDEN, 20317, "User was disabled", "此账号已禁用，请联系客服"),
    _20318(BADREQUEST, 20318, "User password error", "账号或密码错误"),   //密码不正确
    _20319(BADREQUEST, 20319, "Please input the correct Unicom mobile phone number", "请输入正确的联通号码"),//手机号格式不对或不是联通手机号
    _20320(BADREQUEST, 20320, "Send code too frequent", "请求验证码过于频繁，请稍后再试"),
    _20321(BADREQUEST, 20321, "Send code error", "验证码发送故障，请稍后再试"),
    _20324(BADREQUEST, 20324, "not support this open platform", "不支持该开放平台"),
    _20325(BADREQUEST, 20325, "has binded another user", "已经被绑定到了其他账号"),
    _20326(BADREQUEST, 20326, "token has refreshed", "开放平台token已过期"),
    _20327(BADREQUEST, 20327, "token has refreshed", "该账号已绑定邮箱"),
    _20328(BADREQUEST, 20328, "token has refreshed", "账户已经绑定了其他开放平台账号"),
    _20329(BADREQUEST, 20329, "password error", "密码错误"),
    _20330(BADREQUEST, 20330, "User password error", "您输入的原密码不正确"),   //修改密码
    _20331(FORBIDDEN, 20331, "Invalid auth uid", "此条消息为会员特权内容，你还不是会员省份不能查看。"),
    _20332(BADREQUEST, 20332, "Please input the correct mobile phone number", "请输入正确的移动或电信号码"),//手机号格式不对或是联通手机号
    _20333(BADREQUEST, 20333, "", "该手机号已经预定,不能重复预定"),//手机号格式不对或是联通手机号
    _20334(BADREQUEST, 20334, "Please input the correct identity number", "请输入正确的身份证号"),//身份证号格式不对
    _20335(BADREQUEST, 20335, "Please input the correct user name", "请输入正确的真实名"),
    _20336(BADREQUEST, 20336, "Please input the correct http url", "请输入正确的网址"),

    _20402(BADREQUEST, 20402, "Email address exist", "您输入的邮箱地址已存在"),
    _20403(BADREQUEST, 20403, "Email address doesn't not exist", "找不到该用户"),
    _20404(BADREQUEST, 20404, "Email format error", "请输入正确的邮箱地址"),
    _20405(BADREQUEST, 20405, "Email send failure", "邮件发送失败"),
    _20406(BADREQUEST, 20406, "Register too frequent", "抱歉，您注册过于频繁"),
    _20407(BADREQUEST, 20407, "Register too frequent", "您输入的手机号已存在"),
    _20409(BADREQUEST, 20409, "Phone format error", "请输入正确的手机号码"),


    _20601(BADREQUEST, 20601, "Target product does not exist", "请求的服务不存在"),
    _20602(BADREQUEST, 20602, "", "该设备已激活"),
    _20605(FORBIDDEN, 20605, "The user does not order", "您还没有开通免流量服务"),
    _20606(FORBIDDEN, 20606, "", "需要手机号登陆才能继续"),
    _20607(FORBIDDEN, 20607, "", "您的账号已绑定其他手机"),
    _20608(FORBIDDEN, 20608, "", "您的手机已绑定其他账号"),
    _20615(FORBIDDEN, 20615, "", "尊敬的用户，您已订购过沃音悦台免流量服务，点击进入“我的音悦”登录即可免流量观看高清mv。"),

    _20801(BADREQUEST, 20801, "", "验证失败，访问被拒绝"),
    _20802(BADREQUEST, 20802, "", "非联通手机号码，访问被拒绝");

    private int statusCode; // response 状态码
    private int errorCode; // 提示错误码
    private String error; // 错误信息，用于开发使用，支持String.format占位，具体内容 是buildErrorModel 时传进来的
    private String displayMessage; // 提示用户内容

    ErrorType(int statusCode, int errorCode, String error, String displayMessage) {
        this.statusCode = statusCode;
        this.errorCode = errorCode;
        this.error = error;
        this.displayMessage = displayMessage;
        ErrorTypeHelper.map.put(errorCode, this);
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getError() {
        return error;
    }

    public String getDisplayMessage() {
        return displayMessage;
    }

    public void setDisplayMessage(String displayMessage) {
        this.displayMessage = displayMessage;
    }

    public static ErrorType valueOf(int errorCode) {
        return ErrorTypeHelper.map.get(errorCode);
    }

    static class ErrorTypeHelper {
        static Map<Integer, ErrorType> map = Maps.newHashMap();
    }
}
