package com.eazy.brush.controller.api.service;

import com.eazy.brush.controller.api.vo.DynamicArgument;
import com.eazy.brush.service.PhoneNumberService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by yuekuapp on 16-10-18.
 * 防止同一个接口多次请求,缓存请求结果
 */
@Slf4j
public class ActionItemNetService {

    private Map<String,String> collectApi = new HashedMap();
    private Map<String,String> collectArgument = new HashedMap();

    public String getByMethod(DynamicArgument method,PhoneNumberService phoneNumberService){
        log.info("getByMethod:" + method);
        String result = collectApi.get(method.getType());
        if(StringUtils.isNotEmpty(result)){
            return result;
        }
        log.info("getByMethod: type:" + method.getType());
        if("getMobilenum".equals(method.getType())){
            String size=method.getValue("size");
            int sizei=1;
            try{
                sizei= Integer.valueOf(size);
            }catch (Exception e){
            }
            result=phoneNumberService.getMobileNum(method.getValue("pid"),sizei);
            collectArgument.put("mobile",result);//添加新参数
        }
        collectArgument.putAll(method.getArguments());//添加所有静态参数
        return result;
    }


    /**
     * xxxx{key}&{key}
     * @param template
     * @return
     */
    public String transforValue(String template){
        if(StringUtils.isEmpty(template)){
            return template;
        }
        log.info("temple:"+template+" collection:"+collectArgument);
        //生成匹配模式的正则表达式
        String patternString = "\\{(" + StringUtils.join(collectArgument.keySet(), "|") + ")\\}";

        Pattern pattern = Pattern.compile(patternString);
        Matcher matcher = pattern.matcher(template);

        //两个方法：appendReplacement, appendTail
        StringBuffer sb = new StringBuffer();
        while(matcher.find()) {
            String keyString=matcher.group(1);
            matcher.appendReplacement(sb, keyString+"="+collectArgument.get(keyString));
        }
        matcher.appendTail(sb);

        return sb.toString();
    }

}
