package gift.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SendEmail extends Authenticator {

    	PasswordAuthentication pa;
    	
    	public SendEmail() {
    		String id="hellostella226@gamil.com"; //구글 아이디
    		String pw="Wkdtlfna119"; //구글 비밀번호
    		
    		//id와 pw 입력
    		pa=new PasswordAuthentication(id, pw);
    	}
    	
    	
    	
    	//시스템에서 사용하는 인증정보
    	public PasswordAuthentication getPasswordAuthentication() {
//    		return pa;
    		return new PasswordAuthentication("hellostella226","Wkdtlfna119");
    	}
}
