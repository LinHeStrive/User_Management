package com.helin.crud.controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helin.crud.bean.Msg;
import com.helin.crud.bean.User;
import com.helin.crud.service.UserService;  
  
@Controller  
public class imgController {  
	
	@Autowired
	UserService userService;
  
    /**  
     * 注释的代码可以忽略  
     * @throws  
     */
    @RequestMapping(value="/upload",method = RequestMethod.POST)  
    @ResponseBody  
    public Msg updatepic(@RequestParam("file") String file,  
            HttpServletRequest request,HttpSession session) throws Exception {  
          
        Decoder decoder = Base64.getDecoder();  
        // 去掉base64编码的头部 如："data:image/jpeg;base64," 如果不去，转换的图片不可以查看  
        file = file.substring(23);  
                //解码  
        byte[] imgByte = decoder.decode(file);  
  
        /*//在tomcat目录下创建picture文件夹保存图片  
        String path = request.getSession().getServletContext()  
                .getRealPath("");  
        String contextPath = request.getContextPath();  
        path = path.replace(contextPath.substring(1), "")  + "picture";  
        File dir = new File(path);  
        if (!dir.exists()) {// 判断文件目录是否存在  
            dir.mkdirs();  
        }  
                //因为windows和linux路径不同，window：D:\dir   linux:opt/java  
        //System.getProperty("file.separator")能根据系统的不同获取文件路径的分隔符  
        String fileName = getFileName();  
        path = path + System.getProperty("file.separator") + fileName;  
                */  
        Integer id =  (Integer) session.getAttribute("id");
        String name = getFileName(id);
        System.out.println(name);
        try {
            FileOutputStream out = new FileOutputStream("E:\\java_eclipse\\User_Management\\src\\main\\webapp\\model\\images\\faces/"+name); // 输出文件路径  
            System.out.println(name);
            out.write(imgByte);  
            out.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        User user = userService.getUser(id);
        System.out.println(name);
        user.setPic(name);
        userService.update(user);
          
        return Msg.success();  
  
        /*String url = request.getScheme() + "://" + request.getServerName()  
                + ":" + request.getServerPort() + "/picture/" + fileName;  
        return url; */  
    }  
  
    /**  
               * 创建文件名称 内容：时间戳+随机数  
     *   
     * @param @return  
     * @throws  
     */  
    private String getFileName(Integer userId) {  
    	/*
          SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
          String timeStr = sdf.format(new Date());  
          String str = RandomStringUtils.random(5,"abcdefghijklmnopqrstuvwxyz1234567890");  
          String name = timeStr + str + ".jpg"; 
         * 
         */
        User user = userService.getUser(userId);
        String name = user.getUsername()+".jpg";
        return name;  
    }  
  
}