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
			return Msg.fail().add("va_msg", "���������6-16λ��Сд��ĸ�����ֺͷ��ŵ����");
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
			return Msg.fail().add("va_msg", "������벻һ��");
		}
		
	}
	@ResponseBody
	@RequestMapping("/check_oldpwd")
	public Msg checkoldpwd(@RequestParam("pwd") String pwd,HttpSession session) {
		Integer id = (Integer) session.getAttribute("id");
		User user = userService.selectUserById(id);
		String old_pwd = user.getPassword();
		//��ȡ��ֵ
    	String salt = user.getSalt();
    	//��ֵ+�û���������������Կ
    	String salt_key = Pbkdf2Sha256.encode(pwd, salt);
    	//����byte��Կ
    	byte [] key = Pbkdf2Sha256.fromHex(salt_key);
    	//�û���������+key ������������
    	byte [] en_pwd = Encrypt.Aes256Encode(pwd, key);
    	//����string������
    	String str_en = Pbkdf2Sha256.toHex(en_pwd);
    	if(old_pwd.equals(str_en)) {
    		return Msg.success();
    	}else {
    		return Msg.fail().add("va_msg", "�������벻��ȷ��");
    	}
    	
	}
	
	
//	@ResponseBody
//	@RequestMapping("/checkphone")
//	public Msg checkemail(@RequestParam("phone") String phone) {
//		String regx = "(^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\\\d{8}$)";
//		if (!phone.matches(regx)) {
//			return Msg.fail().add("va_msg", "�ֻ��Ÿ�ʽ����ȷ");
//		} else {
//			return Msg.success();
//		}
//	}

	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("username") String username) {
		// ���ж��û����Ƿ�Ϸ�
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!username.matches(regx)) {
			return Msg.fail().add("va_msg", "�û���������6-16λ���ֺ���ĸ����ϻ���2-5λ����");
		}
		// ���ݿ��û����ظ�У��
		boolean b = userService.checkUser(username);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "�û���������");
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
			return Msg.fail().add("va_msg", "�����������");
		}
	}
}
