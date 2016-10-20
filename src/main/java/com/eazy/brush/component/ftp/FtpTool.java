package com.eazy.brush.component.ftp;

import com.eazy.brush.controller.common.IFtpClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;

/**
 * Ftp client
 *
 * @author feng.liu
 * @date 2016/9/8 18:35
 */
@Slf4j
@Component
public class FtpTool implements IFtpClient{

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

    private FTPClient ftp = new FTPClient();

    public FtpTool() {
    }

    public void connect() {
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

    public void disconnect() {
        try {
            ftp.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
            log.error("discollect ftp error {}", e);
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
     * 删除一个文件
     */
    public boolean deleteFile(String filename) {
        boolean flag = true;
        try {
            flag = ftp.deleteFile(filename);
            if (flag) {
                log.info("删除文件"+filename+"成功！");
            } else {
                log.info("删除文件"+filename+"失败！");
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return flag;
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

    /**
     * 在服务器上创建一个文件夹
     *
     * @param dir 文件夹名称，不能含有特殊字符，如 \ 、/ 、: 、* 、?、 "、 <、>...
     */
    private boolean makeDirectory(String dir) {
        boolean flag = true;
        try {
            flag = ftp.makeDirectory(dir);
            if (flag) {
                log.info("创建文件夹"+ dir + " 成功！");
            } else {
                log.info("创建文件夹"+ dir + " 失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    /**
     * 进入到服务器的某个目录下
     *
     * @param directory
     */
    private boolean changeWorkingDirectory(String directory) {
        boolean flag = true;
        try {
            flag = ftp.changeWorkingDirectory(directory);
            if (flag) {
                log.info("进入文件夹"+ directory + " 成功！");
            } else {
                log.info("进入文件夹"+ directory + " 失败！");
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return flag;
    }

    /**
     * 递归创建远程目录,并切换到当前目录
     * @param remote
     * @return
     * @throws IOException
     */
   private  boolean CreateDirecroty(String remote) throws IOException {
        boolean success = true;
       String directory="";
        if(remote.contains("/")){
            directory = remote.substring(0, remote.lastIndexOf("/") + 1);
        }else {
            directory=remote;
        }
        // 如果远程目录不存在，则递归创建远程服务器目录
        if (!directory.equalsIgnoreCase("/")&& !changeWorkingDirectory(new String(directory))) {
            int start = 0;
            int end = 0;
            if (directory.startsWith("/")) {
                start = 1;
            } else {
                start = 0;
            }
            end = directory.indexOf("/", start);
            while (true) {
                String subDirectory = new String(remote.substring(start, end).getBytes("GBK"),"iso-8859-1");
                if (!changeWorkingDirectory(subDirectory)) {
                    if (makeDirectory(subDirectory)) {
                        changeWorkingDirectory(subDirectory);
                    } else {
                        log.info("创建目录["+subDirectory+"]失败");
                        success = false;
                        return success;
                    }
                }
                start = end + 1;
                end = directory.indexOf("/", start);
                // 检查所有目录是否创建完毕
                if (end <= start) {
                    break;
                }
            }
        }
        return success;
    }

    /**
     *
     * @param fileName
     * @param path xx/xx/xx
     * @param outputStream
     */
    @Override
    public void downLoadToOutputStream(String fileName, String path, OutputStream outputStream) throws IOException {
        connect();
        CreateDirecroty(path);
        downLoadToOutputStream(fileName,outputStream);
        disconnect();
    }

    /**
     *
     * @param fileName
     * @param path xx/xx/xx
     * @param inputStream
     */
    @Override
    public void uploadToInoutStream(String fileName, String path, InputStream inputStream) throws IOException {
        connect();
        CreateDirecroty(path);
        upload(inputStream,fileName);
        disconnect();
    }

    /**
     * 删除文件
     * @param fileName
     * @param path
     * @throws IOException
     */
    @Override
    public void deleteFile(String fileName, String path) throws IOException {
        connect();
        CreateDirecroty(path);
        deleteFile(fileName);
        disconnect();
    }
}
