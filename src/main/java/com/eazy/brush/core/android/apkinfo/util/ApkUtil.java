package com.eazy.brush.core.android.apkinfo.util;

import com.eazy.brush.core.android.apkinfo.bean.ApkInfo;
import org.apache.commons.io.IOUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class ApkUtil {

    private static final Namespace NS = Namespace.getNamespace("http://schemas.android.com/apk/res/android");

    public static ApkInfo getApkInfo(File file) {
        ApkInfo apkInfo = new ApkInfo();
        SAXBuilder builder = new SAXBuilder();
        Document document = null;
        try {
            document = builder.build(getXmlInputStream(file));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Element root = document.getRootElement();//跟节点-->manifest
        apkInfo.setVersionCode(root.getAttributeValue("versionCode", NS));
        apkInfo.setVersionName(root.getAttributeValue("versionName", NS));
        apkInfo.setApkPackage(root.getAttribute("package").getValue());
        Element elemUseSdk = root.getChild("uses-sdk");//子节点-->uses-sdk
        apkInfo.setMinSdkVersion(elemUseSdk.getAttributeValue("minSdkVersion", NS));

        return apkInfo;
    }

    private static InputStream getXmlInputStream(File file) {
        InputStream inputStream = null;
        InputStream xmlInputStream = null;
        ZipFile zipFile = null;
        try {
            zipFile = new ZipFile(file);
            ZipEntry zipEntry = new ZipEntry("AndroidManifest.xml");
            inputStream = zipFile.getInputStream(zipEntry);
            AXMLPrinter xmlPrinter = new AXMLPrinter();
            xmlPrinter.startPrinf(inputStream);
            xmlInputStream = new ByteArrayInputStream(xmlPrinter.getBuf().toString().getBytes("UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(zipFile);
        }

        return xmlInputStream;
    }

    public static void main(String[] args) {
        File file = new File("F:\\netease_newsreader_android.apk");
        ApkInfo apkInfo = ApkUtil.getApkInfo(file);
        System.out.println(apkInfo.getApkPackage());
        System.out.println(apkInfo.getVersionCode());
        System.out.println(apkInfo.getVersionName());
    }
}
