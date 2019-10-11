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

public class MailUtil_Sign implements Runnable{
	private String email;// 收件人邮箱
    private String sign;// 激活码

    public MailUtil_Sign(String email, String sign) {
        this.email = email;
        this.sign = sign;
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
            message.setSubject("HLPASS密码提示！");
            // 2.4设置邮件内容
            String content = "<html>"
            		+ "<head></head>"
            		+ "<body>"
            		+ "<div style=\"width:800px;background-color:#F5F5DC;text-align:center;margin:0 auto;border:1px solid #F5F5DC\">"
            		+ "<div style=\"width:800px;background-color:#FFF;\"><img src=\"http://localhost:8080/ssm-crud/model/images/logo.png\" style=\"width:150px;height:60px;\"/></div>"
            		+ "<h1>尊敬的HLPASS用户您好！</h1>"
            		+ "<h3>这是一封密码提示邮件,请查看文本框中的密码提示后，返回HLPASS首页进行登录！</h3>"
            		+ "<h3><a href='http://localhost:8080/ssm-crud/jump/login.php'>http://localhost:8080/ssm-crud/jump/login.php</a></h3>"
            		+ "<textarea rows=\"4\" style=\"width:80%;text-align:center;margin-bottom:20px;\">"+sign+"</textarea>"
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

