package com.app.mail;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

	public static void sendMail(String authCode, String usermail, String username) {

		try {
			String email = "sathish@fabsys.in",

					password = "sathish@1234", host = "smtp.gmail.com", port = "465",
					subject = "Secret Key For Your File Download";

			Properties props = new Properties();
			props.put("mail.smtp.user", email);
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", port);
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			SecurityManager security = System.getSecurityManager();

			try {
				class SMTPAuthenticator extends javax.mail.Authenticator {
					public PasswordAuthentication getPasswordAuthentication() {
						String email = "sathish@fabsys.in", password = "sathish@1234";
						return new PasswordAuthentication(email, password);
					}
				}
				SMTPAuthenticator auth = new SMTPAuthenticator();
				Session sessions = Session.getInstance(props, auth);
				sessions.setDebug(true);
				MimeMessage msg = new MimeMessage(sessions);
				msg.setSubject(subject);
				msg.setFrom(new InternetAddress(email));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(usermail));
				msg.setText("Hi " + username + ", This is your Secret Key for your file download : " + authCode);
				Transport.send(msg);
				System.out.println("Email sent successfully");
			} catch (Exception ex) {
				System.out.println("Send Failed");
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}