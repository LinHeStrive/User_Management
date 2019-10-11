package com.helin.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jump")
public class JumpController {
	
	
	@RequestMapping("/login.php") 
    public String login(Model model) {
    return "../../Login"; 
    }
	
	@RequestMapping("/register.php") 
    public String register(Model model) { 
    return "register"; 
    }
	
	@RequestMapping("/forget.php") 
    public String forget(Model model) { 
    return "forget"; 
    }
	@RequestMapping("/showItems.php") 
    public String showItems(Model model) {
    return "user/showItems"; 
    }

	@RequestMapping("/visitor_show.php") 
    public String visitor_show(Model model) {
    return "visitor/showItems"; 
    }
	
	@RequestMapping("/pwd.php") 
    public String pwd(Model model) {
    return "user/password/password"; 
    }
	@RequestMapping("/user.php") 
    public String user(Model model) { 
    return "user/user_change/user"; 
    }
	@RequestMapping("/password.php") 
    public String password(Model model) {
    return "user/user_change/password"; 
    }
	@RequestMapping("/face.php") 
    public String face(Model model) {
    return "user/user_change/face"; 
    }
	@RequestMapping("/phone.php") 
    public String mail(Model model) { 
    return "user/user_change/phone"; 
    }
	@RequestMapping("/showadmin.php") 
    public String showadmin(Model model) {
    return "admin/showadmin.jsp"; 
    }
	
	@RequestMapping("/user_manage.php")
	public String user_manage(Model model) {
	    return "admin/user_manage"; 
	}
	@RequestMapping("/massage.php")
	public String massage(Model model) {
	    return "admin/massage/massage"; 
	}
	@RequestMapping("/massage_del.php")
	public String massage_del(Model model) {
	    return "admin/massage/massage_del"; 
	}
	@RequestMapping("/camera_manage.php")
	public String camera_manage(Model model) {
	    return "admin/camera/camera_manage"; 
	}
	@RequestMapping("pwd_change.php")
	public String pwd_change(Model model) {
	    return "admin/password/pwd_change"; 
	}
	@RequestMapping("logout.php")
	public String logout(Model model) {
	    return "../../Login"; 
	}
	@RequestMapping("/massage_user.php")
	public String massage_user(Model model) {
	    return "user/massage/massage"; 
	}
	@RequestMapping("/video.php")
	public String video(Model model) {
	    return "admin/video/video"; 
	}
	
}
