package com.eazy.brush.dao.entity;

import com.eazy.brush.controller.api.service.ActionItemNetService;
import com.eazy.brush.controller.api.vo.DynamicArgument;
import com.eazy.brush.controller.view.vo.ActionItemApiArgument;
import com.eazy.brush.controller.view.vo.ActionItemApiVo;
import com.eazy.brush.controller.view.vo.ActionItemVo;
import com.eazy.brush.service.PhoneNumberService;
import com.google.common.collect.Lists;
import lombok.Data;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.List;
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

    public ActionItemApiVo transform2ApiVo(ActionItemNetService service, PhoneNumberService phoneNumberService){
        ActionItemApiVo actionItemApiVo = new ActionItemApiVo();
        actionItemApiVo.setClassName(getViewName());
        actionItemApiVo.setDelayTime(getStayTime());
        actionItemApiVo.setRealAction(getAction());
        actionItemApiVo.setText(getViewContent());
        actionItemApiVo.setViewId(getViewId());
        actionItemApiVo.setUpdownTime(getUpDown());
        List<ActionItemApiArgument> actionItemApiArgumentList= Lists.newArrayList();
        if(StringUtils.isNotEmpty(actionParams)){
            String[] param=actionParams.split(";");
            for(String item:param){
                if(StringUtils.isNotEmpty(item)){
                    String[] keyvalue=item.split(":");
                    if(keyvalue.length>=2&&StringUtils.isNotEmpty(keyvalue[0])&&StringUtils.isNotEmpty(keyvalue[1])){
                        String value=keyvalue[1];
                        if(keyvalue[1].startsWith("net|")){
                            value = service.getByMethod(DynamicArgument.trans2Dynamic(keyvalue[1].replaceAll("net|","")),phoneNumberService);
                        }
                        actionItemApiArgumentList.add(new ActionItemApiArgument(keyvalue[0],value));
                    }
                }
            }
        }
        actionItemApiVo.setArguments(actionItemApiArgumentList);
        return actionItemApiVo;
    }


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
