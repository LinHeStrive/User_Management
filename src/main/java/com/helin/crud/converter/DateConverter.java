package com.helin.crud.converter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


/**
 *@class_name��DateConverter  
 *@param: ������(springmvc�ṩ������ת����)
 *@return:  ���ڸ�ʽ���������
 *@author:Zoutao
 *@createtime:2018��3��21��
 */
public class DateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String str) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	

}