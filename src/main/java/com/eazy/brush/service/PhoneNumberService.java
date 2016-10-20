package com.eazy.brush.service;

/**
 * Created by yuekuapp on 16-10-18.
 */
public interface PhoneNumberService {

    /**
     * [方法名] loginIn
     * 传入参数：
     * 1. uid:用户名
     * 2. pwd:密码
     * GET方式调用实例：http://api.niuma.org/api.aspx?action=loginIn&uid=用户名&pwd=密码
     * 方法调用返回值示例：
     * 1.成功返回：用户名|token(下面所有方法都要用的令牌)
     * 2. 失败返回值说明：
     * 返回值	说明
     * login_error	用户名密码错误
     * message|please try again later	访问速度过快，建议休眠50毫秒后再试
     * account_is_locked	账号被锁定
     * login_error	用户名密码错误
     *
     * @return
     */
    void loginIn();

    /**
     * http://api.niuma.org/api.aspx?action=getMobilenum&pid=项目ID&uid=用户名&token=&size=1
     * @return
     */
    String getMobileNum(String pid,int size);


    /**
     * http://api.niuma.org/api.aspx?action=ReleaseMobile&uid=用户名&token=登录时返回的令牌
     * @return
     */
    void releaseMobileNum(String mobile);


    /**
     * http://api.niuma.org/api.aspx?action=getVcodeAndReleaseMobile&uid=用户&token=登录时返回的令牌&pid=项目ID&mobile=获取到的手机号码
     * @return
     */
    String getMobileCodeAndRelease(String pid,String mobile);

    /**
     * http://api.niuma.org/api.aspx?action=addIgnoreList&uid=用户名&token=登录时返回的令牌&mobiles=号码1,号码2,号码3&pid=项目ID
     * @return
     */
    void addIgnoreList(String mobiles,String pid);
}
