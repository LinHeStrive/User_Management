package com.helin.crud.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.language.bm.Rule.Phoneme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helin.crud.bean.Msg;
import com.helin.crud.bean.User;
import com.helin.crud.service.UserService;
import com.helin.crud.util.Encrypt;
import com.helin.crud.util.Pbkdf2Sha256;

@Controller
@RequestMapping("/user")
public class UserCheck {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/checkpwd")
	public Msg checkpwd(@RequestParam("password") String password) {
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)";
		if (!password.matches(regx)) {
			return Msg.fail().add("va_msg", "密码必须是6-16位大、小写字母、数字和符号的组合");
		} else {
			return Msg.success();
		}
	}
	@ResponseBody
	@RequestMapping("/checkpwdeq")
	public Msg checkpwdeq( @RequestParam("pwd1") String pwd1,
			@RequestParam("pwd2") String pwd2) {
		if(pwd1.equals(pwd2)) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "密码必须不一致");
		}
		
	}
	@ResponseBody
	@RequestMapping("/check_oldpwd")
	public Msg checkoldpwd(@RequestParam("pwd") String pwd,HttpSession session) {
		Integer id = (Integer) session.getAttribute("id");
		User user = userService.selectUserById(id);
		String old_pwd = user.getPassword();
		//获取盐值
    	String salt = user.getSalt();
    	//盐值+用户输入密码生成密钥
    	String salt_key = Pbkdf2Sha256.encode(pwd, salt);
    	//生成byte密钥
    	byte [] key = Pbkdf2Sha256.fromHex(salt_key);
    	//用户输入密码+key 加密生成密码
    	byte [] en_pwd = Encrypt.Aes256Encode(pwd, key);
    	//生成string型密码
    	String str_en = Pbkdf2Sha256.toHex(en_pwd);
    	if(old_pwd.equals(str_en)) {
    		return Msg.success();
    	}else {
    		return Msg.fail().add("va_msg", "密码输入不正确！");
    	}
    	
	}
	
	
//	@ResponseBody
//	@RequestMapping("/checkphone")
//	public Msg checkemail(@RequestParam("phone") String phone) {
//		String regx = "(^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\\\d{8}$)";
//		if (!phone.matches(regx)) {
//			return Msg.fail().add("va_msg", "手机号格式不正确");
//		} else {
//			return Msg.success();
//		}
//	}

	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("username") String username) {
		// 先判断用户名是否合法
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!username.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		// 数据库用户名重复校验
		boolean b = userService.checkUser(username);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}
	@ResponseBody
	@RequestMapping("/checkoldpwd")
	public Msg checkoldpwd(@RequestParam("username") String username,@RequestParam("password") String password) {
		
		User user = userService.CheckLoginAndPwd(username, password);
		System.out.println(user);
		if (user!=null) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "密码输入错误！");
		}
	}
}
