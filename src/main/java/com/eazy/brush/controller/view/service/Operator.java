package com.eazy.brush.controller.view.service;

import com.eazy.brush.core.lottery.Award;
import com.eazy.brush.dao.entity.CardInfo;

import java.util.Random;

public class Operator implements Award {

    /**
     * @param networktype 2g/3g/4g/:
     *                    301/914/9444
     * @return
     */
    public static Operator[] getInstances(String networktype) {
        for (Operator item : OPERATORS) {
            item.setNetworktype(networktype);
        }
        return OPERATORS;
    }


    private static final Operator[] OPERATORS = {
            new Operator(new String[]{"133", "153", "180", "181", "189", "177", "149"}, "中国电信",
                    new String[]{"03"}, 8858),
            new Operator(new String[]{
                    "134", "135", "136", "137", "138", "139", "150", "151", "152", "158", "159", "182", "183",
                    "184", "157", "187", "188", "147", "178", "184"}, "中国移动", new String[]{"00", "02"}, 41266),
            new Operator(new String[]{"130", "131", "132", "155", "156", "145", "185", "186", "176"},
                    "中国联通", new String[]{"01"}, 10188)
    };

    /**
     * 2g/3g/4g/
     * 联通／移动／电信
     */
    private static final int[][][] NETWORKTPYPES = new int[][][]{{
            {1, 16}, {2, 16}, {4}},//2g:联通／移动／电信
            {{3, 8, 9, 10, 15}, {17}, {5, 6, 12}},//3g:联通／移动／电信
            {{13}, {13}, {13}}};//4g:联通／移动／电信

    /**
     * 2g/3g/4g
     */
    private int[] networktypeg;
    private String[] numberpr;
    private String operatorName;
    private String[] operatorNum;

    private void setNetworktype(String networktype) {
        int index = 0;
        if ("01".equals(operatorName)) {
            index = 0;
        } else if ("03".equals(operatorName)) {
            index = 2;
        } else {
            index = 1;
        }

        if ("2g".equals(networktype)) {
            this.networktypeg = NETWORKTPYPES[0][index];
        } else if ("3g".equals(networktype)) {
            this.networktypeg = NETWORKTPYPES[1][index];
        } else {
            this.networktypeg = NETWORKTPYPES[2][index];
        }
    }

    /**
     * 此网络运营商的数据量
     * 用来搞随机变量
     */
    private long num;

    private Operator(String[] numberpr, String operatorName, String[] operatorNum, long num) {
        this.numberpr = numberpr;
        this.operatorName = operatorName;
        this.operatorNum = operatorNum;
        this.num = num;
    }

    public CardInfo getCardInfo() {

        Random random = new Random();
        return new SingleNumberInfo(numberpr[random.nextInt(numberpr.length)], operatorNum[random.nextInt(operatorNum.length)], networktypeg).getCardInfo();
    }

    @Override
    public double getRate() {
        return num;
    }

    class SingleNumberInfo {
        private String mLineNumber;
        private String mOperatorNum;
        private int networktype;

        SingleNumberInfo(String sufixx, String operatorNum, int[] networktype) {
            String second = String.valueOf(getNum(1, 888) + 10000).substring(1);
            String thrid = String.valueOf(getNum(1, 9100) + 10000).substring(1);
            mLineNumber = sufixx + second + thrid;
            mOperatorNum = operatorNum;
            Random r = new Random();
            this.networktype = networktype[r.nextInt(networktype.length)];
        }

        String getAndroidId() {
            return ImeiMaker.getIMEI();
        }

        //15位
        String getSubscriberid() {
            return "460" + mOperatorNum + mLineNumber.substring(4, 7) + mLineNumber.substring(3, 4) + (System.currentTimeMillis() + "").substring(7, 13);
        }

        String getOperator() {
            return mOperatorNum + "";
        }

        String getOperatorName() {
            return operatorName;
        }

        String getLine1Number() {
            return mLineNumber;
        }

        //20位
        String getSimSerialNumber() {
            return "8906" + mOperatorNum + mLineNumber.substring(0, 3) + System.currentTimeMillis() / 1000;
        }

        int getNetworkType() {
            return networktype;
        }

        String getPhoneType() {
            Random random = new Random();
            return (random.nextInt(2) + 1) + "";
        }

        CardInfo getCardInfo() {
            CardInfo cardInfo = new CardInfo();
            cardInfo.setLine1Number(getLine1Number());
            cardInfo.setNetworkType(getNetworkType());
            cardInfo.setOperator(getOperator());
            cardInfo.setOperatorName(getOperatorName());
            cardInfo.setPhoneType(getPhoneType());
            cardInfo.setSimSerialNumber(getSimSerialNumber());
            cardInfo.setSubscriberId(getSubscriberid());
            cardInfo.setTelAndroidId(getAndroidId());
            return cardInfo;
        }
    }

    private static int getNum(int start, int end) {
        return (int) (Math.random() * (end - start + 1) + start);
    }
}