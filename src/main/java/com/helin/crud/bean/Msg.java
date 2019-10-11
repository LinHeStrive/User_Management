package com.helin.crud.bean;
/**
 * 
 * 通用的返回类
 * @author hl777
 *
 */

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class Msg {

	//状态码
	private int code;
	//提示信息
	private String msg;
	//用户要返回给浏览器的数据
	private Map<String, Object> extend = new HashMap<String,Object>();
	
	public static Msg success_local() {
		Msg result = new Msg();
		result.setCode(104);
		result.setMsg("定位准确！");
		return result;
	}
	
	public static Msg admin_success() {
		Msg result = new Msg();
		result.setCode(103);
		result.setMsg("尊敬的管理员，欢迎登录！");
		return result;
	}
	
	public static Msg user_success() {
		Msg result = new Msg();
		result.setCode(102);
		result.setMsg("尊敬的用户，欢迎登录！");
		return result;
	}
	
	public static Msg successpwd() {
		Msg result = new Msg();
		result.setCode(101);
		result.setMsg("修改密码成功！");
		return result;
	}
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功！");
		return result;
	}
	
	
	
	
	
	public static Msg fail_local() {
		Msg result = new Msg();
		result.setCode(204);
		result.setMsg("您的地点异常，请前往邮箱验证！");
		return result;
	}
	
	public static Msg user_fail() {
		Msg result = new Msg();
		result.setCode(203);
		result.setMsg("尊敬的用户您的账户以锁定，请前去邮箱验证！");
		return result;
	}
	
	public static Msg failpwd() {
		Msg result = new Msg();
		result.setCode(202);
		result.setMsg("密码错误！");
		return result;
	}
	
	public static Msg noname() {
		Msg result = new Msg();
		result.setCode(201);
		result.setMsg("用户名不存在！");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败！");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
}
