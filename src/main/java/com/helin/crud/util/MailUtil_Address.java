package com.helin.crud.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil_Address implements Runnable{

	private String email;// 收件人邮箱
    private String userCity;// 用户定位

    public MailUtil_Address(String email, String userCity) {
        this.email = email;
        this.userCity = userCity;
    }

	@Override
	public void run() {
		// TODO Auto-generated method stub
		// 1.创建连接对象javax.mail.Session
        // 2.创建邮件对象 javax.mail.Message
        // 3.发送一封激活邮件
        String from = "972641143@qq.com";// 发件人电子邮箱
        String host = "smtp.qq.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)

        Properties properties = System.getProperties();// 获取系统属性

        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证

        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);


            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("972641143@qq.com", "msrmplaprdakbdde"); // 发件人邮箱账号、授权码
                }
            });

            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(from));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("HLPASS账号激活!");
            // 2.4设置邮件内容
            String content = "<html>"
            		+ "<head></head>"
            		+ "<body>"
            		+ "<div style=\"width:800px;background-color:#F5F5DC;text-align:center;margin:0 auto;border:1px solid #F5F5DC\">"
            		+ "<div style=\"width:800px;background-color:#FFF;\"><img src=\"http://localhost:8080/ssm-crud/model/images/logo.png\" style=\"width:150px;height:60px;\"/></div>"
            		+ "<h1>尊敬的HLPASS用户您好！</h1>"
            		+ "<h3>由于您的登录地址异常，如果确认是您本人在"+userCity+"进行登录，请点击下方链接进行验证：<br><a href='http://localhost:8080/ssm-crud/user/address.php'>http://localhost:8080/ssm-crud/user/address.php</a></h3>"
            		+ "</div></body></html>";
          
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
