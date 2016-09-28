package com.eazy.brush.controller.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by yuekuapp on 16-9-27.
 */
public interface IFtpClient {

    void downLoadToOutputStream(String fileName,String path,OutputStream outputStream) throws IOException;

    void uploadToInoutStream(String fileName, String path, InputStream inputStream) throws IOException;

    void deleteFile(String fileName,String path) throws IOException;
}
