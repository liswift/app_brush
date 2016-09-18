package com.eazy.brush.dao.entity;

import com.eazy.brush.controller.view.vo.ActionItemVo;
import lombok.Data;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * 元动作
 * author : liufeng
 * create time:2016/9/10 20:21
 */
@Data
public class ActionItem {
    private int id;
    private int actionPageId;//页动作id
    private String name;//元动作名称,
    private String viewName; //view类名,
    private String viewId; //viewId,
    private String viewContent; //view内容,
    private int action;//动作,
    private String actionParams;//动作参数,type:value;type:value
    private int stayTime;//停留时间,秒
    private int upDown;//波动范围,秒

    public ActionItemVo transform2Vo(){
        ActionItemVo actionItemVo=new ActionItemVo();
        actionItemVo.setId(id);
        actionItemVo.setAction(action);
        actionItemVo.setActionPageId(actionPageId);
        actionItemVo.setName(name);
        actionItemVo.setStayTime(stayTime);
        actionItemVo.setUpDown(upDown);
        actionItemVo.setViewContent(viewContent);
        actionItemVo.setViewId(viewId);
        actionItemVo.setViewName(viewName);
        Map<String,String> map=new HashMap<>();
        if(StringUtils.isNotEmpty(actionParams)){
            String[] param=actionParams.split(";");
            for(String item:param){
                if(StringUtils.isNotEmpty(item)){
                    String[] keyvalue=item.split(":");
                    if(keyvalue.length>=2&&StringUtils.isNotEmpty(keyvalue[0])&&StringUtils.isNotEmpty(keyvalue[1])){
                        map.put(keyvalue[0],keyvalue[1]);
                    }
                }
            }
        }
        actionItemVo.setActionParams(map);
        return actionItemVo;
    }
}
