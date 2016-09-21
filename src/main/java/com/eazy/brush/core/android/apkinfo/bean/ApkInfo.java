package com.eazy.brush.core.android.apkinfo.bean;

@SuppressWarnings("unchecked")
public class ApkInfo {

    private String versionCode;
    private String versionName;
    private String apkPackage;
    private String minSdkVersion;
    private String apkName;
    private String apkUrl;

    public ApkInfo() {
        versionCode = null;
        versionName = null;
        apkPackage = null;
        minSdkVersion = null;
        apkName = null;
    }

    public String getApkUrl() {
        return apkUrl;
    }

    public void setApkUrl(String apkUrl) {
        this.apkUrl = apkUrl;
    }

    public String getVersionCode() {
        return versionCode;
    }

    public void setVersionCode(String versionCode) {
        this.versionCode = versionCode;
    }

    public String getVersionName() {
        return versionName;
    }

    public void setVersionName(String versionName) {
        this.versionName = versionName;
    }

    public String getApkPackage() {
        return apkPackage;
    }

    public void setApkPackage(String apkPackage) {
        this.apkPackage = apkPackage;
    }

    public String getMinSdkVersion() {
        return minSdkVersion;
    }

    public void setMinSdkVersion(String minSdkVersion) {
        this.minSdkVersion = minSdkVersion;
    }

    public String getApkName() {
        return apkName;
    }

    public void setApkName(String apkName) {
        this.apkName = apkName;
    }

    public String toString() {
        return (new StringBuilder("&version=" + versionName + "&versioncode=" + versionCode)).toString();
    }
}
