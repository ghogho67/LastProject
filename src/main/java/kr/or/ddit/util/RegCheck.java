package kr.or.ddit.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;


//정규식 체크 
@ComponentScan
public class RegCheck {
	
	//정규식이 통과하면 true, 틀리면 false
	private boolean result = false;
	
	/**
	* Method : regId
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 아이디 정규식 - 영어대소문자, 숫자, 특수문자 4~8자리
	*/
	public boolean regId(String mem_id) {
		Pattern p = Pattern.compile("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{4,8}$");
		Matcher m = p.matcher(mem_id);
		result = m.matches();
		return result;
	}
	
	
	/**
	* Method : regPass
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_pass
	* @return
	* Method 설명 : 영어, 숫자, 특수문자  8자리 이상
	*/
	public boolean regPass(String mem_pass) {
//		Pattern p = Pattern.compile("^[a-zA-Z0-9]{4,6}$");
		Pattern p = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$");
		Matcher m = p.matcher(mem_pass);
		result = m.matches();
		return result;
	}
	
	/**
	* Method : regName
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_nm
	* @return
	* Method 설명 : 이름 정규식 - 한글 2~5자리
	*/
	public boolean regName(String mem_nm) {
		Pattern p = Pattern.compile("^[가-힣]{2,5}$");
		Matcher m = p.matcher(mem_nm);
		result = m.matches();
		return result;
	}
	
	/**
	* Method : regPhone
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_phone
	* @return
	* Method 설명 :핸드폰 정규식
	*/
	public boolean regPhone(String mem_phone) {
//		Pattern p = Pattern.compile("/^\\\\d{3}-\\\\d{3,4}-\\\\d{4}$/");
		Pattern p = Pattern.compile("^\\d{3}-\\d{3,4}-\\d{4}$");
		Matcher m = p.matcher(mem_phone);
		result = m.matches();
		return result;
	}
	
	/**
	* Method : regMail
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_mail
	* @return
	* Method 설명 :이메일 정규식
	*/
	public boolean regMail(String mem_mail) {
//		Pattern p = Pattern.compile("^[_a-zA-Z0-9-\\\\.]+@[\\\\.a-zA-Z0-9-]+\\\\.[a-zA-Z]+$");
		Pattern p = Pattern.compile("^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$");
		Matcher m = p.matcher(mem_mail);
		result = m.matches();
		return result;
	}
	
	
	


}












