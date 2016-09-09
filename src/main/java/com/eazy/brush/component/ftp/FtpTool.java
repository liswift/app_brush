package com.eazy.brush.component.ftp;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.*;

/**
 * Ftp client
 *
 * @author feng.liu
 * @date 2016/9/8 18:35
 */
@Slf4j
@Component
public class FtpTool {

    private FTPClient ftp;

    /**
     * @param path     上传到ftp服务器哪个路径下
     * @param addr     地址
     * @param port     端口号
     * @param username 用户名
     * @param password 密码
     */
    @PostConstruct
    public void connect(String path, String addr, int port, String username, String password) {
        ftp = new FTPClient();
        int reply;
        try {
            ftp.connect(addr, port);
            ftp.login(username, password);
            ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
            }
            ftp.changeWorkingDirectory(path);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("collect ftp error {}", e);
        }
    }

    /**
     * @param inputStream 上传的流
     * @param ftpName     上传的文件
     */
    public void upload(InputStream inputStream, String ftpName) {
        try {
            ftp.storeFile(ftpName, inputStream);
        } catch (IOException e) {
            log.error("upload ftp error {}", e);
        }
    }

    /**
     * 下载ftp文件
     *
     * @param ftpFile ftp目录
     * @param dstFile 本地目录
     */
    public File downLoad(String ftpFile, String dstFile) {
        File file = new File(dstFile);
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(file);
            ftp.retrieveFile(ftpFile, fos);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("down ftp file error {}", e);
        } finally {
            IOUtils.closeQuietly(fos);
        }
        return file;
    }

    /**
     * 下载ftp文件到OutputStream
     *
     * @param ftpFile ftp目录
     */
    public OutputStream downLoad(String ftpFile) {
        OutputStream os = new ByteArrayOutputStream();
        try {
            ftp.retrieveFile(ftpFile, os);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("down ftp file error {}", e);
        }
        return os;
    }

    public static void main(String[] args) throws FileNotFoundException {
        FtpTool t = new FtpTool();

        t.connect("", "115.28.7.101", 21, "lf", "liufeng65");
        File file = new File("F:\\a.log");
        t.upload(new FileInputStream(file), "a.log");
        t.downLoad("test.log", "F:\\test.log");
    }
}
