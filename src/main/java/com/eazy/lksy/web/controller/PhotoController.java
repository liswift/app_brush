package com.eazy.lksy.web.controller;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.eazy.lksy.web.common.BaseController;

/**
 * 网上随便找的
 * http://blog.csdn.net/a1314517love/article/details/24183273
 */
@Controller
@RequestMapping("/photo")
public class PhotoController extends BaseController {

	/**
	 * 酒店图片上传
	 */
	@RequestMapping(value = "hotelPhotoUpload" , method = { RequestMethod.POST, RequestMethod.GET })
	public void hotelPhotoUpload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException, URISyntaxException {
		/*
		 *  虽然此处已经支持了批量上传，但是由于数据库酒店表只是支持存储一个图片
		 *  批量上传的具体效果，可以看本地磁盘路径是否存在多张图片
		 */
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        if(multipartResolver.isMultipart(request)){  
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    String myFileName = file.getOriginalFilename();  
                    if(myFileName.trim() !=""){  
                        String fileName =  file.getOriginalFilename();  
                        fileName = fileName.substring(0, fileName.lastIndexOf(".")) + ".jpg";
                        // 改写成自己的磁盘路径
                        String windows = "D:\\hotel\\" + fileName;
                        String linux = "/usr/hotel/" + fileName;
                        file.transferTo(new File(linux));
                    }  
                }  
            }  
              
        }  
	}
	
	
	/**
	 * 房间图片上传
	 */
	@RequestMapping(value = "roomPhotoUpload" , method = { RequestMethod.POST, RequestMethod.GET })
	public void roomPhotoUpload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException, URISyntaxException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        if(multipartResolver.isMultipart(request)){  
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    String myFileName = file.getOriginalFilename();  
                    if(myFileName.trim() !=""){  
                        String fileName =  file.getOriginalFilename();  
                        fileName = fileName.substring(0, fileName.lastIndexOf(".")) + ".jpg";
                        // 改写成自己的磁盘路径
                        String windows = "D:\\room\\" + fileName;
                        String linux = "/usr/room/" + fileName;
                        file.transferTo(new File(linux));
                    }  
                }  
            }  
              
        }  
	}
}
