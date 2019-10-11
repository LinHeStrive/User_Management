package com.helin.crud.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.helin.crud.bean.User;

/**
 * @class_name��UserBiz
 * @param: 4.service��ӿ�
 * @return: ҵ���߼���
 * @author:Zoutao
 * @createtime:2018��3��21��
 */

public interface UserService {
    // ��¼��ѯ
    public User CheckLoginAndPwd(String name, String pwd);
    
    public User selectUserById(Integer id);

    // ע���û�
    public void addUser(User user);
    
    public User getUser(Integer id);
    
    public void update(User user);
    
    public User getUserByCode(String code);

	public User CheckLoginAndPwdAndState(String name, String pwd,Integer state);

	public boolean checkUser(String username);

	public List<User> getByrole(String role);

	public List<User> getAll();

	public User CheckLoginByUser(String name);

	public boolean checkName(String name);

	public User getUserByUserName(String username);

	void deleteBatch(List<Integer> ids);

	void deleteUser(Integer id);

	public void export(String[] titles, ServletOutputStream out,String ids);

	public List<User> findUserByMs(String name, String username, String sex, String bNum);
}
