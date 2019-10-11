package com.helin.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.Msg;
import com.helin.crud.bean.User;
import com.helin.crud.service.UserService;
import com.helin.crud.util.Encrypt;
import com.helin.crud.util.MailUtil;
import com.helin.crud.util.Pbkdf2Sha256;

@Controller
public class UserUpdateController {

	@Autowired
	UserService userService;

	//管理员删除用户
	@ResponseBody
	@RequestMapping(value="/user/{ids}",method=RequestMethod.DELETE)
	public Msg deleteUser(@PathVariable("ids") String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<>();
			String []str_ids = ids.split("-");
			for (String string : str_ids) {
				String username = string;
				User user = userService.getUserByUserName(username);
				Integer id = user.getId();
				del_ids.add(id);
			}
			userService.deleteBatch(del_ids);
		}else {
			String username = ids;
			User user = userService.getUserByUserName(username);
			Integer id = user.getId();
			System.out.println(id);
			userService.deleteUser(id);
		}
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public Msg getUser(@PathVariable("id") Integer id) {

		User user = userService.getUser(id);
		// String pwd = MD5.JM(user.getPassword());
		// user.setPassword(pwd);
		return Msg.success().add("user", user);
	}

	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.PUT)
	public Msg updatePwd(HttpSession session, @RequestParam("pwd") String pwd, @RequestParam("pwd1") String pwd1,
			@RequestParam("pwd2") String pwd2) {
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
    	if(old_pwd.equals(str_en) && pwd1.equals(pwd2)) {
    		//盐值+用户输入密码生成密钥
        	String salt_key_new = Pbkdf2Sha256.encode(pwd2, salt);
        	//生成byte密钥
        	byte [] key_new = Pbkdf2Sha256.fromHex(salt_key_new);
        	//用户输入密码+key 加密生成密码
        	byte [] en_pwd_new = Encrypt.Aes256Encode(pwd2, key_new);
        	//生成string型密码
        	String str_en_new = Pbkdf2Sha256.toHex(en_pwd_new);
    		user.setPassword(str_en_new);
    		userService.update(user);
    		return Msg.success();
    	}else {
			return Msg.fail();
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/phone", method = RequestMethod.PUT)
	public Msg updatephone(HttpSession session, @RequestParam("phone") String phone) {
		Integer id = (Integer) session.getAttribute("id");
		User user = userService.selectUserById(id);
    	user.setPhone(phone);
    	userService.update(user);
    	return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.PUT)
	public Msg updateUser(User user) {
		userService.update(user);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/user_lock/{ids}", method = RequestMethod.POST)
	public Msg lockUser(@RequestParam("state") Integer state, @PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			List<Integer> lock_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				lock_ids.add(Integer.parseInt(string));
			}
			for (Integer id : lock_ids) {
				User user = userService.getUser(id);
				user.setState(state);
				userService.update(user);
			}
		} else {
			Integer id = Integer.parseInt(ids);
			User user = userService.getUser(id);
			user.setState(state);
			userService.update(user);
		}

		return Msg.success();
	}

	@RequestMapping("/users")
	@ResponseBody
	public Msg getUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		String role = "user";
		PageHelper.startPage(pn, 10);
		List<User> users = userService.getByrole(role);
		PageInfo page = new PageInfo(users, 10);
		return Msg.success().add("pageInfo", page);
	}
}
