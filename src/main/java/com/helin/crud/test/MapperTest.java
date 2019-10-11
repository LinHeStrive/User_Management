package com.helin.crud.test;

import java.util.Calendar;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.helin.crud.dao.CameraMapper;
import com.helin.crud.dao.UserMapper;
import com.helin.crud.util.Encrypt;
import com.helin.crud.util.PBKDF2Util;
import com.helin.crud.util.Pbkdf2Sha256;
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;

/**
 * 测试dao层的工作
 * 
 * @author hl777 1、导入springtest 2、@ContextConfiguration制定spring配置文件的地址
 *         3、直接autowired要使用的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

//
//	@Autowired
//	SqlSession sqlSession;
//	@Autowired
//	UserMapper userMapper;
//	@Autowired
//	UrlMapper urlMapper;
//
//	/**
//	 * 
//	 * 测试department
//	 */
//	
//	 @Autowired
//	    private PBKDF2Util pbkdf2Util;
//	 
//	 
//	    public static void main(String[] args) {
//	    	Calendar now = Calendar.getInstance();
//			System.out.println("年: " + now.get(Calendar.YEAR));
//			System.out.println("月: " + (now.get(Calendar.MONTH) + 1) + "");
//			System.out.println("日: " + now.get(Calendar.DAY_OF_MONTH));
//			System.out.println("时: " + now.get(Calendar.HOUR_OF_DAY));
//			System.out.println("分: " + now.get(Calendar.MINUTE));
//			System.out.println("秒: " + now.get(Calendar.SECOND));
//	    	for(int i=0;i<10000;i++) {
//	    		String salt = Pbkdf2Sha256.getsalt();
//	    		String pwd = UUID.randomUUID().toString();
//	    		String salt_key = Pbkdf2Sha256.encode(pwd,"B5Se20g6b6AX1oml");
//	    		byte [] key = Pbkdf2Sha256.fromHex(salt_key);
//	    		String str_key = Pbkdf2Sha256.toHex(key);
//	    		byte [] en_pwd = Encrypt.Aes256Encode(pwd, key);
//	    		String str_en = Pbkdf2Sha256.toHex(en_pwd);
//	    		String de_pwd = Encrypt.Aes256Decode(en_pwd, key);
//	    	}
//	    	Calendar now1 = Calendar.getInstance();
//			System.out.println("年: " + now1.get(Calendar.YEAR));
//			System.out.println("月: " + (now1.get(Calendar.MONTH) + 1) + "");
//			System.out.println("日: " + now1.get(Calendar.DAY_OF_MONTH));
//			System.out.println("时: " + now1.get(Calendar.HOUR_OF_DAY));
//			System.out.println("分: " + now1.get(Calendar.MINUTE));
//			System.out.println("秒: " + now1.get(Calendar.SECOND));
//		}
}
