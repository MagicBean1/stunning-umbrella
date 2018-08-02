package member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

    	PasswordAuthentication pa;
    	
    	public MyAuthentication() {
    		String id="hiek2003@gamil.com"; //구글 아이디
    		String pw="dhakwn6627"; //구글 비밀번호
    		
    		//id와 pw 입력
    		pa=new PasswordAuthentication(id, pw);
    	}
    	
    	
    	
    	//시스템에서 사용하는 인증정보
    	public PasswordAuthentication getPasswordAuthentication() {
//    		return pa;
    		return new PasswordAuthentication("hiek2003","dhakwn6627");
    	}
}
