package com.helin.crud.dao;

import com.helin.crud.bean.User;
import com.helin.crud.bean.UserExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User CheckLoginAndPwd(@Param("username") String name, @Param("password") String pwd);
    
    User CheckLoginByUser( @Param("username") String name);
    
    User CheckLoginAndPwdAndState(@Param("username") String name, @Param("password") String pwd,@Param("state") Integer state);
	
    User selectByCode(String code);

	List<User> selectByUserRole(String role);

	User selectByUserName(String username);

	List<User> selectByMs(@Param("name")String name, @Param("username")String username, @Param("sex")String sex, @Param("b_num")String bNum);
}