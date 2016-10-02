package com.eazy.brush.core.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.ParseException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * author : liufeng
 * create time:2016/9/11 18:10
 */
@Slf4j
public class HttpUtil {

    public static String get(String url) {
        String content = null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpGet httpget = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpget);
            try {
                HttpEntity entity = response.getEntity();
                System.out.println(response.getStatusLine());
                if (entity != null) {
                    content = EntityUtils.toString(entity);
                }
            } finally {
                response.close();
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        } finally {
            try {
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return content;
    }


    public static boolean checkAviable(String ipPort){
        String[] ipp = ipPort.split(":");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpHost target=new HttpHost("www.baidu.com",80,"http");
        HttpHost proxy=new HttpHost(ipp[0],Integer.valueOf(ipp[1]),"http");
        RequestConfig config = RequestConfig.custom().setProxy(proxy).setConnectTimeout(2000).setSocketTimeout(5000).build();
        HttpGet httpGet=new HttpGet("/");
        httpGet.setConfig(config);
        try {
            CloseableHttpResponse response=httpClient.execute(target,httpGet);
            if(response.getStatusLine().getStatusCode()==200){
                return true;
            }
        } catch (IOException e) {
            log.info("check proxy error:"+e.getMessage());
        }finally {
            try {
                httpGet.releaseConnection();
                httpClient.close();
            } catch (IOException e) {
            }
        }
        return false;
    }

}
