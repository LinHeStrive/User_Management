package com.helin.crud.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.helin.crud.bean.User;

/**
 * @class_name：UserBiz
 * @param: 4.service层接口
 * @return: 业务逻辑层
 * @author:Zoutao
 * @createtime:2018年3月21日
 */

public interface UserService {
    // 登录查询
    public User CheckLoginAndPwd(String name, String pwd);
    
    public User selectUserById(Integer id);

    // 注册用户
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
