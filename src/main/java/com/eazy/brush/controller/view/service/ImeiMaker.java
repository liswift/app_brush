package com.eazy.brush.controller.view.service;

import java.util.Random;

/**
 * Created by yuekuapp on 16-6-4.
 */
public class ImeiMaker {

  private final static String[] TOP_TAC = { "352584", "867676", "352105", "865863", "867514" };

  /**
   * imei由15位数字组成，
   * 前6位(TAC)是型号核准号码，代表手机类型。
   * 接着2位(FAC)是最后装配号，代表产地。
   * 后6位(SNR)是串号，代表生产顺序号。
   * 最后1位 (SP)是检验码。
   *
   * 检验码计算：
   * (1).将偶数位数字分别乘以2，分别计算个位数和十位数之和
   * (2).将奇数位数字相加，再加上上一步算得的值
   * (3).如果得出的数个位是0则校验位为0，否则为10减去个位数
   */
  public static String getIMEI() {
    return getLastImei(getPreSix(), getMidTwo(), getMidSix());
  }

  private static String getLastImei(String topSix, String midTwo, String lastSix) {

    String imeiString = topSix + midTwo + lastSix;
    char[] imeiChar = imeiString.toCharArray();
    int resultInt = 0;
    for (int i = 0; i < imeiChar.length; i++) {
      String imeichar=String.valueOf(imeiChar[i]);
      int a = Integer.parseInt(imeichar);
      i++;
      final int temp = Integer.parseInt(imeichar) * 2;
      final int b = temp < 10 ? temp : temp - 9;
      resultInt += a + b;
    }
    resultInt %= 10;
    resultInt = resultInt == 0 ? 0 : 10 - resultInt;
    return imeiString + resultInt;
  }

  private static String getPreSix() {
    Random random = new Random(System.currentTimeMillis());
    return TOP_TAC[random.nextInt(5)];
  }

  private static String getMidSix() {
    Random random = new Random(System.currentTimeMillis());
    return random.nextInt(1000000) + "";
  }

  private static String getMidTwo() {
    Random random = new Random(System.currentTimeMillis());
    return random.nextInt(10) + random.nextInt(10) + "";
  }
}