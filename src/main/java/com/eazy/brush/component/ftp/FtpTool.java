package com.eazy.brush.component.ftp;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${ftp.addr}")
    private String addr;

    @Value("${ftp.port}")
    private int port;

    @Value("${ftp.username}")
    private String username;

    @Value("${ftp.password}")
    private String password;

    @Value("${ftp.path}")
    private String path;

    private FTPClient ftp;

    public FtpTool() {
    }

    @PostConstruct
    public void connect() {
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
            ftp.storeFile(new String(ftpName.getBytes("UTF-8"), "iso-8859-1"), inputStream);
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
    public void downLoadToOutputStream(String ftpFile, OutputStream outputStream) {
        try {
            ftp.retrieveFile(ftpFile, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("down ftp file error {}", e);
        }
    }
}
