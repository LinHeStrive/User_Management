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
     * ע�͵Ĵ�����Ժ���  
     * @throws  
     */
    @RequestMapping(value="/upload",method = RequestMethod.POST)  
    @ResponseBody  
    public Msg updatepic(@RequestParam("file") String file,  
            HttpServletRequest request,HttpSession session) throws Exception {  
          
        Decoder decoder = Base64.getDecoder();  
        // ȥ��base64�����ͷ�� �磺"data:image/jpeg;base64," �����ȥ��ת����ͼƬ�����Բ鿴  
        file = file.substring(23);  
                //����  
        byte[] imgByte = decoder.decode(file);  
  
        /*//��tomcatĿ¼�´���picture�ļ��б���ͼƬ  
        String path = request.getSession().getServletContext()  
                .getRealPath("");  
        String contextPath = request.getContextPath();  
        path = path.replace(contextPath.substring(1), "")  + "picture";  
        File dir = new File(path);  
        if (!dir.exists()) {// �ж��ļ�Ŀ¼�Ƿ����  
            dir.mkdirs();  
        }  
                //��Ϊwindows��linux·����ͬ��window��D:\dir   linux:opt/java  
        //System.getProperty("file.separator")�ܸ���ϵͳ�Ĳ�ͬ��ȡ�ļ�·���ķָ���  
        String fileName = getFileName();  
        path = path + System.getProperty("file.separator") + fileName;  
                */  
        Integer id =  (Integer) session.getAttribute("id");
        String name = getFileName(id);
        System.out.println(name);
        try {
            FileOutputStream out = new FileOutputStream("E:\\java_eclipse\\User_Management\\src\\main\\webapp\\model\\images\\faces/"+name); // ����ļ�·��  
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
               * �����ļ����� ���ݣ�ʱ���+�����  
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