/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.controller;

/**
 *
 * @author Joker
 */
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

//    public static void main(String[] args) {
//        sendMail("aa", "bb");
//    }
    public static void sendMail(String to, String pass) {

//        String to = "tuhintowhidul9@gmail.com";//change accordingly
//Get the session object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("teacherreview47@gmail.com", "review47");//change accordingly
            }
        });

//compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("tuhintowhidul9@gmail.com"));//change accordingly
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Password Of the Teacher's Review");
            message.setText("Password: " + pass);

            //send message
            Transport.send(message);

            System.out.println("message sent successfully");

        } catch (MessagingException e) {
            System.out.println("mail.SendMail.sendMail()");
        }

    }
}
