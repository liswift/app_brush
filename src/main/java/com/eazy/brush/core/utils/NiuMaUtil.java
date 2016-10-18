package com.eazy.brush.core.utils;

/**
 * Created by yuekuapp on 16-10-18.
 */
public class NiuMaUtil {

    private static final String HOST="http://api.niuma.org/api.aspx?action=";

    /**
     * 获取登录
     * @param uid
     * @param pwd
     * @return
     */
    public static String getLogin(String uid,String pwd){
        return HOST+"loginIn&uid="+uid+"&pwd="+pwd;
    }

    /**
     * 获取手机号
     * @param pid
     * @param uid
     * @param token
     * @return
     */
    public static String getMobileNum(String pid,String uid,String token){
        return HOST+"getMobilenum&pid="+pid+"&uid="+uid+"&token="+token+"&author_uid="+uid;
    }

    /**
     *释放手机号
     * @param uid
     * @param token
     * @param mobile 可以不填写
     * @return
     */
    public static String releaseMobileNum(String uid,String token,String mobile){
        return HOST+"ReleaseMobile&uid="+uid+"&token="+token+"&mobile="+mobile;
    }

    /**
     * 获取验证码
     * @param uid
     * @param token
     * @param pid
     * @param mobile
     * @return
     */
    public static String getVcodeAndReleaseMobile(String uid,String token,String pid,String mobile){
        return HOST+"getVcodeAndReleaseMobile&uid="+uid+"&token="+token+"&pid="+pid+"&mobile="+mobile;
    }

    public static String addIgnoreList(String uid,String token,String mobiles,String pid){
        return HOST+"addIgnoreList&uid="+uid+"&token="+token+"&mobiles="+mobiles+"&pid="+pid;
    }
}
