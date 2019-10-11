package com.helin.crud.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helin.crud.bean.Msg;
import com.helin.crud.bean.Note;
import com.helin.crud.bean.User;
import com.helin.crud.service.NoteService;
import com.helin.crud.service.UserService;
import com.helin.crud.util.CodeUtil;
import com.helin.crud.util.Encrypt;
import com.helin.crud.util.MailUtil;
import com.helin.crud.util.MailUtil_Address;
import com.helin.crud.util.MailUtil_Sign;
import com.helin.crud.util.Pbkdf2Sha256;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	NoteService noteService;

	// 设置映射路径和以json格式传送参数
	@RequestMapping(value = "/checkLogin", produces = { "application/json;charset=UTF-8" },method=RequestMethod.POST)
	@ResponseBody
	public Msg checkLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session, HttpServletRequest request) {
		// User user1 = userService.CheckLoginAndPwd(username, password);
		User user2 = userService.CheckLoginByUser(username);
		
		//================
		// =====解密数据库对比=====//
		// 获取用户输入密码
		String pwd = password;
		System.out.println(password);
		// 获取盐值
		String salt = user2.getSalt();
		// 盐值+用户输入密码生成密钥
		String salt_key = Pbkdf2Sha256.encode(pwd, salt);
		// 生成byte密钥
		byte[] key = Pbkdf2Sha256.fromHex(salt_key);
		// 用户输入密码+key 加密生成密码
		byte[] en_pwd = Encrypt.Aes256Encode(pwd, key);
		// 生成string型密码
		String str_en = Pbkdf2Sha256.toHex(en_pwd);
		User user1 = userService.CheckLoginAndPwd(username, str_en);
		if(user1!=null) {
			int allNote = 0;
			List<Note> notes = noteService.getNoteByUser(user1.getId());
			for (Note note : notes) {
				allNote = allNote + note.getState();
			}
			// 获得系统消息未读数量
			user1.setAllnote(allNote);
			userService.update(user1);
			request.getSession().setAttribute("id", user1.getId());
			request.getSession().setAttribute("allNote", user1.getAllnote());
			request.getSession().setAttribute("pwd", pwd);
			session.setAttribute("user1", user1);
			System.out.println(user1);
			System.out.println(request.getRemoteAddr());
			return Msg.success_local();
		}else {
			return Msg.fail();
		}
	}

	
	@RequestMapping(value="/queryItems",method=RequestMethod.GET)
	@ResponseBody
	public Msg queryItems(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("id");
		String pwd = (String) session.getAttribute("pwd");
		User user = userService.selectUserById(id);
		Integer state = user.getState();
		String email = user.getEmail();
		String code = user.getCode();
		String role = user.getRole();
		if (state == 1 && role.equals("user")) {

			// =====密码解密=======//
			//生成byte形式的密码
			byte [] pwd_b = Pbkdf2Sha256.fromHex(user.getPassword());
			//获取盐
			String salt = user.getSalt();
			System.out.println(salt);
			//生成带盐的key
			String salt_key = Pbkdf2Sha256.encode(pwd, salt);
			// 生成byte密钥
			byte[] key = Pbkdf2Sha256.fromHex(salt_key);
			// 用户输入密码+key 解密出密文形式密码
			String de_pwd = Encrypt.Aes256Decode(pwd_b, key);
			
			
			// =====密码加密=======//
			// 生成盐
			String salt_new = Pbkdf2Sha256.getsalt();
			user.setSalt(salt_new);
			// 密码加盐pbkdf2&sha256加密生成aes256密钥
			String salt_key_new = Pbkdf2Sha256.encode(de_pwd, salt_new);
			// 密钥转换为byte
			byte[] key_new = Pbkdf2Sha256.fromHex(salt_key_new);
			// aes256通过pwd和生成的key进行信息加密
			byte[] en_pwd_new = Encrypt.Aes256Encode(de_pwd, key_new);
			String str_en = Pbkdf2Sha256.toHex(en_pwd_new);
			user.setPassword(str_en);
			userService.update(user);
			
			System.out.println("尊敬的用户，欢迎登录!");
			return Msg.user_success();
		} else if (state == 1 && role.equals("admin")) {
			System.out.println("尊敬的管理员，欢迎登录!");
			return Msg.admin_success();
		} else {
			new Thread(new MailUtil(email, code)).start();
			return Msg.user_fail();
		}

	}

	@RequestMapping("/active")
	public String active(@RequestParam("code") String code, HttpSession session) {
		User user = userService.getUserByCode(code);
		user.setState(1);
		user.setCode(CodeUtil.generateUniqueCode());
		userService.update(user);
		return "../../Login";
	}
	@RequestMapping("/address.php")
	public String address(HttpSession session) {
		String userCity = (String) session.getAttribute("userCity");
		System.out.println(userCity);
		User user = (User) session.getAttribute("user1");
		System.out.println(user.getUsername());
		user.setProvince(userCity);;
		userService.update(user);
		return "../../Login";
	}

	@ResponseBody
	@RequestMapping(value = "/doRegist", method = RequestMethod.POST)
	public Msg doRegist(User user, BindingResult result) {
		
		String role = "user";
		user.setRole(role);
		user.setState(1);
		if (user.getSex().equals("0")) {
			user.setPic("female.jpg");
		} else {
			user.setPic("male.jpg");
		}
		
		// 获取当前年、月、日
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		user.setYear(year);
		user.setMonth(month);
		user.setDay(day);

		// =====密码加密=======//
		// 获取密码
		String pwd = user.getPassword();
		// 生成盐
		String salt = Pbkdf2Sha256.getsalt();
		user.setSalt(salt);
		// 密码加盐pbkdf2&sha256加密生成aes256密钥
		String salt_key = Pbkdf2Sha256.encode(pwd, salt);
		// 密钥转换为byte
		byte[] key = Pbkdf2Sha256.fromHex(salt_key);
		// aes256通过pwd和生成的key进行信息加密
		byte[] en_pwd = Encrypt.Aes256Encode(pwd, key);
		String str_en = Pbkdf2Sha256.toHex(en_pwd);
		user.setPassword(str_en);
		userService.addUser(user);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/forget", method = RequestMethod.POST)
	public Msg forget(@RequestParam("username") String username) {
		User user = userService.CheckLoginByUser(username);
		if(user!=null) {
			String sign = user.getSign();
			String email = user.getEmail();
			new Thread(new MailUtil_Sign(email, sign)).start();
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}

}