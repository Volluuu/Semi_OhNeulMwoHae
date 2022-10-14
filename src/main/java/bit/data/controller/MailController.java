package bit.data.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value="/mail.do")
    public String sendMail(){

        MimeMessage message = mailSender.createMimeMessage();
        try {
            message.setSubject("스프링으로 메일보내기");
            message.setText("메일본문입니다.");
            message.setRecipients(MimeMessage.RecipientType.TO,InternetAddress.parse("ahrl1717@naver.com"));
            mailSender.send(message);
            System.out.println("성공");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return "mailSuccess";
    }
}
