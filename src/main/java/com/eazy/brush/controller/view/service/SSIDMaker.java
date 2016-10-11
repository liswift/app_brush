package com.eazy.brush.controller.view.service;

import com.eazy.brush.core.lottery.Award;
import com.eazy.brush.core.lottery.LotteryUtil;
import com.eazy.brush.core.utils.RandomUtil;
import org.apache.commons.lang.StringUtils;

import java.util.Arrays;
import java.util.Random;

/**
 * Created by yuekuapp on 16-10-11.
 */
public class SSIDMaker {
    private static Element[] elements = { new Element("TP-LINK", 30.48),
            new Element("HUAWEI", 11.12), new Element("NETGEAR", 6.97),
            new Element("ASUS", 5.26), new Element("H3C", 1),new Element("cisco",1),
            new Element("MERCURY", 0.5), new Element("fast", 1),new Element("",50),
            new Element("UTT", 0.5), new Element("TOTOLINK", 0.2),
            new Element("Volans", 0.2), new Element("Tenda", 7.48),
            new Element("D-Link", 6.75), new Element("HiWiFi", 8.3),
            new Element("360", 6.83), new Element("Xiaomi", 2.85) };

    public static String getSSID() {
        String prefix = prefix();
        String result=prefix + postfix(StringUtils.isNotEmpty(prefix));
        if(result.length()>32){
            result=result.substring(0,31);
        }
        return result;
    }

    private static String prefix() {
        return LotteryUtil.lottery(Arrays.asList(elements)).value();
    }

    private static String postfix(boolean hasprefix) {
        StringBuffer result=new StringBuffer();
        Random random=new Random();
        if(hasprefix){
            boolean has=random.nextBoolean();
            result.append(has?"_":(random.nextBoolean()?"":"-"));
            result.append(RandomUtil.generateMixString(random.nextInt(5)));
        }else{
            result.append(RandomUtil.generateUpperString(2+random.nextInt(3)));
        }
        if(random.nextBoolean()){
            result.append(random.nextBoolean()?"_":(random.nextBoolean()?"":"-"));
            result.append(RandomUtil.getNotSimple(new int[]{1,2,3,4,5,6,7,8,9},random.nextInt(7)+1));
        }
        return result.toString();
    }

    public static class Element implements Award {
        Element(String name, double pr) {
            this.name = name;
            this.proportion = pr;
        }

        private String name;
        private double proportion;

        String value() {
            return name;
        }

        @Override
        public double getRate() {
            return proportion;
        }
    }
}
