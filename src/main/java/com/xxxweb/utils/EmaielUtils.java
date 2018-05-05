package com.xxxweb.utils;

import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component
public class EmaielUtils {

    public void sendEmail2(String to, String title, String content) {

        Properties prop = new Properties();
        prop.put("mail.host", "smtp.163.com");
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.auth", true);
//使用java发送邮件5步骤
//1.创建sesssion
        Session session = Session.getInstance(prop);
//开启session的调试模式，可以查看当前邮件发送状态
        session.setDebug(true);


//2.通过session获取Transport对象（发送邮件的核心API）
        Transport ts = null;
        try {
            ts = session.getTransport();
            ts.connect("13221296662@163.com", "xu9595");
            //4.创建邮件

            Message msg = createSimpleMail(session, to, title, content);

//5.发送电子邮件
            ts.sendMessage(msg, msg.getAllRecipients());
        } catch (NoSuchProviderException e) {

            e.printStackTrace();
        } catch (MessagingException e) {

            e.printStackTrace();
        }
//3.通过邮件用户名密码链接
    }

    public static MimeMessage createSimpleMail(Session session, String to, String title, String content) throws AddressException, MessagingException {


//    public static MimeMessage createSimpleMail(Session session) throws AddressException,MessagingException{
//创建邮件对象
        MimeMessage mm = new MimeMessage(session);
//设置发件人
        mm.setFrom(new InternetAddress("13221296662@163.com"));
//设置收件人
        mm.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
//设置抄送人
//        mm.setRecipient(Message.RecipientType.CC, new InternetAddress("用户名@163.com"));

        mm.setSubject(title);
        mm.setContent(content, "text/html;charset=gbk");
        return mm;
    }
}
