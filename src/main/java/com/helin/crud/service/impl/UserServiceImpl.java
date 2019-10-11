package com.helin.crud.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.stereotype.Service;
import javax.servlet.ServletOutputStream;
import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.springframework.beans.factory.annotation.Autowired;

import com.helin.crud.bean.Msg;
import com.helin.crud.bean.Note;
import com.helin.crud.bean.User;
import com.helin.crud.bean.UserExample;
import com.helin.crud.bean.UserExample.Criteria;
import com.helin.crud.dao.UserMapper;
import com.helin.crud.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

    @Override
    public User CheckLoginAndPwd(String name, String pwd) {
        // TODO Auto-generated method stub
        return userMapper.CheckLoginAndPwd(name, pwd);
    }

    @Override
    public void addUser(User user) {
        // TODO Auto-generated method stub
        userMapper.insertSelective(user);
    }

	@Override
	public User getUser(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKeySelective(user);
		
	}

	@Override
	public User getUserByCode(String code) {
		User user = userMapper.selectByCode(code);
		return user;
	}
	
	@Override
	public User getUserByUserName(String username) {
		User user = userMapper.selectByUserName(username);
		return user;
	}

	@Override
	public User CheckLoginAndPwdAndState(String name, String pwd,Integer state) {
		User user = userMapper.CheckLoginAndPwdAndState(name, pwd,state);
		return user;
	}

	@Override
	public boolean checkUser(String username) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(example);
		return count==0;
	}

	@Override
	public List<User> getByrole(String role) {
		// TODO Auto-generated method stub
		return userMapper.selectByUserRole(role);
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userMapper.selectByExample(null);
	}

	@Override
	public User CheckLoginByUser(String name) {
		// TODO Auto-generated method stub
		return userMapper.CheckLoginByUser(name);
	}

	@Override
	public User selectUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean checkName(String name) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		long count = userMapper.countByExample(example);
		return count==0;
	}
	
	@Override
	public void deleteUser(Integer id) {
		userMapper.deleteByPrimaryKey(id);

	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		userMapper.deleteByExample(example);

	}

	//�����û���Ϣ
	@Override
	public void export(String[] titles, ServletOutputStream out,String ids) {
		// TODO Auto-generated method stub
		try{
            // ��һ��������һ��workbook����Ӧһ��Excel�ļ�
            HSSFWorkbook workbook = new HSSFWorkbook();
            // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet
            HSSFSheet hssfSheet = workbook.createSheet("sheet1");
            // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short
            HSSFRow hssfRow = hssfSheet.createRow(0);
            // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����
            HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
            //������ʽ
            hssfCellStyle.setAlignment(HorizontalAlignment.CENTER);
 
            HSSFCell hssfCell = null;
            for (int i = 0; i < titles.length; i++) {
                hssfCell = hssfRow.createCell(i);//��������0��ʼ
                hssfCell.setCellValue(titles[i]);//����1
                hssfCell.setCellStyle(hssfCellStyle);//�о�����ʾ
            }
            
            
 
            // ���岽��д��ʵ������
            
            if(ids.contains("-")) {
    			//List<Integer> out_ids = new ArrayList<>();
    			List<User> users = new ArrayList<>();
    			String []str_ids = ids.split("-");
    			for (String string : str_ids) {
    				//out_ids.add(Integer.parseInt(string));
    				System.out.println(string);
    				users.add(userMapper.selectByPrimaryKey(Integer.parseInt(string)));
    			}
    			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                if(users != null && !users.isEmpty()){
                    for (int i = 0; i < users.size(); i++) {
                        hssfRow = hssfSheet.createRow(i+1);
                        User user = users.get(i);
     
                        // ��������������Ԫ�񣬲�����ֵ
                        int id = 0;
                        if(user.getId() != 0){
                            id = user.getId();
                        }
                        hssfRow.createCell(0).setCellValue(id);
                        String name = "";
                        if(user.getName() != null){
                            name = user.getName();
                        }
                        hssfRow.createCell(1).setCellValue(name);
                        String userName = "";
                        if(user.getUsername() != null){
                            userName = user.getUsername();
                        }
                        hssfRow.createCell(2).setCellValue(userName);
                        String sex = "";
                        if(user.getSex() != null){
                            sex = user.getSex();
                            if(sex.equals("1")) {
                            	sex="��";
                            }else {
								sex="Ů";
							}
                        }
                        hssfRow.createCell(3).setCellValue(sex);
                    }
                }
     
                // ���߲������ļ�������ͻ��������
                try {
                    workbook.write(out);
                    out.flush();
                    out.close();
     
                } catch (Exception e) {
                    e.printStackTrace();
                }
    		}else {
    			Integer id = Integer.parseInt(ids);
    			User user = userMapper.selectByPrimaryKey(id);
    			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                if(user != null ){
                        hssfRow = hssfSheet.createRow(1);
                        hssfRow.createCell(0).setCellValue(id);
                        String name = "";
                        if(user.getName() != null){
                            name = user.getName();
                        }
                        hssfRow.createCell(1).setCellValue(name);
                        String userName = "";
                        if(user.getUsername() != null){
                            userName = user.getUsername();
                        }
                        hssfRow.createCell(2).setCellValue(userName);
                        String sex = "";
                        if(user.getSex() != null){
                            sex = user.getSex();
                            if(sex.equals("1")) {
                            	sex="��";
                            }else {
								sex="Ů";
							}
                        }
                        hssfRow.createCell(3).setCellValue(sex);
                }
     
                // ���߲������ļ�������ͻ��������
                try {
                    workbook.write(out);
                    out.flush();
                    out.close();
     
                } catch (Exception e) {
                    e.printStackTrace();
                }
    		}
            //List<User> users = userMapper.selectByPrimaryKey(id));
 
            
        }catch(Exception e){
            e.printStackTrace();
            try {
                throw new Exception("������Ϣʧ�ܣ�");
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
    }

	@Override
	public List<User> findUserByMs(String name, String username, String sex, String bNum) {
		return userMapper.selectByMs(name,username,sex,bNum);
	}

		
	}

