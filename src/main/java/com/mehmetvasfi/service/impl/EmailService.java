package com.mehmetvasfi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.mehmetvasfi.entites.User;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendVerificationEmail(User user) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getMailProperties());
        mailMessage.setSubject("Email Verification");
        mailMessage.setText("Please verify your email by clicking the link: " +
                "http://localhost:8080/verify?token=" + user.getVerificationToken());

        javaMailSender.send(mailMessage);
    }
}
