package com.helin.crud.bean;
/**
 * 
 * ͨ�õķ�����
 * @author hl777
 *
 */

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class Msg {

	//״̬��
	private int code;
	//��ʾ��Ϣ
	private String msg;
	//�û�Ҫ���ظ������������
	private Map<String, Object> extend = new HashMap<String,Object>();
	
	public static Msg success_local() {
		Msg result = new Msg();
		result.setCode(104);
		result.setMsg("��λ׼ȷ��");
		return result;
	}
	
	public static Msg admin_success() {
		Msg result = new Msg();
		result.setCode(103);
		result.setMsg("�𾴵Ĺ���Ա����ӭ��¼��");
		return result;
	}
	
	public static Msg user_success() {
		Msg result = new Msg();
		result.setCode(102);
		result.setMsg("�𾴵��û�����ӭ��¼��");
		return result;
	}
	
	public static Msg successpwd() {
		Msg result = new Msg();
		result.setCode(101);
		result.setMsg("�޸�����ɹ���");
		return result;
	}
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("����ɹ���");
		return result;
	}
	
	
	
	
	
	public static Msg fail_local() {
		Msg result = new Msg();
		result.setCode(204);
		result.setMsg("���ĵص��쳣����ǰ��������֤��");
		return result;
	}
	
	public static Msg user_fail() {
		Msg result = new Msg();
		result.setCode(203);
		result.setMsg("�𾴵��û������˻�����������ǰȥ������֤��");
		return result;
	}
	
	public static Msg failpwd() {
		Msg result = new Msg();
		result.setCode(202);
		result.setMsg("�������");
		return result;
	}
	
	public static Msg noname() {
		Msg result = new Msg();
		result.setCode(201);
		result.setMsg("�û��������ڣ�");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("����ʧ�ܣ�");
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
