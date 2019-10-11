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

	private String email;// �ռ�������
    private String userCity;// �û���λ

    public MailUtil_Address(String email, String userCity) {
        this.email = email;
        this.userCity = userCity;
    }

	@Override
	public void run() {
		// TODO Auto-generated method stub
		// 1.�������Ӷ���javax.mail.Session
        // 2.�����ʼ����� javax.mail.Message
        // 3.����һ�⼤���ʼ�
        String from = "972641143@qq.com";// �����˵�������
        String host = "smtp.qq.com"; // ָ�������ʼ�������smtp.qq.com(QQ)|smtp.163.com(����)

        Properties properties = System.getProperties();// ��ȡϵͳ����

        properties.setProperty("mail.smtp.host", host);// �����ʼ�������
        properties.setProperty("mail.smtp.auth", "true");// ����֤

        try {
            //QQ������Ҫ������δ��룬163���䲻��Ҫ
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);


            // 1.��ȡĬ��session����
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("972641143@qq.com", "msrmplaprdakbdde"); // �����������˺š���Ȩ��
                }
            });

            // 2.�����ʼ�����
            Message message = new MimeMessage(session);
            // 2.1���÷�����
            message.setFrom(new InternetAddress(from));
            // 2.2���ý�����
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3�����ʼ�����
            message.setSubject("HLPASS�˺ż���!");
            // 2.4�����ʼ�����
            String content = "<html>"
            		+ "<head></head>"
            		+ "<body>"
            		+ "<div style=\"width:800px;background-color:#F5F5DC;text-align:center;margin:0 auto;border:1px solid #F5F5DC\">"
            		+ "<div style=\"width:800px;background-color:#FFF;\"><img src=\"http://localhost:8080/ssm-crud/model/images/logo.png\" style=\"width:150px;height:60px;\"/></div>"
            		+ "<h1>�𾴵�HLPASS�û����ã�</h1>"
            		+ "<h3>�������ĵ�¼��ַ�쳣�����ȷ������������"+userCity+"���е�¼�������·����ӽ�����֤��<br><a href='http://localhost:8080/ssm-crud/user/address.php'>http://localhost:8080/ssm-crud/user/address.php</a></h3>"
            		+ "</div></body></html>";
          
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.�����ʼ�
            Transport.send(message);
            System.out.println("�ʼ��ɹ�����!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
