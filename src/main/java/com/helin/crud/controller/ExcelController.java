package com.helin.crud.controller;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.helin.crud.service.UserService;

@Controller
@RequestMapping("/fee")
public class ExcelController {
 
	@Autowired
	UserService userService;
	
	//@RequestMapping("/feeList")// 注意@ResponseBody就是写在这个位置
	@RequestMapping(value="/userList")
    public @ResponseBody void export(@RequestParam("ids")String ids,HttpServletResponse response){
        //response.setContentType("application/binary;charset=UTF-8");
		response.setContentType("application/vnd.ms-excel");
		
        try{
            ServletOutputStream out=response.getOutputStream();
            String fileName=new String(("UserInfo "+ new SimpleDateFormat("yyyy-MM-dd").format(new Date())).getBytes(),"UTF-8");
            response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(fileName,"UTF-8")+ ".xls");  
            String[] titles = { "用户编号", "姓名", "用户名", "性别" };
            System.out.println(ids);
            userService.export(titles, out,ids);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}