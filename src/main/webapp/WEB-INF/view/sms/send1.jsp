<%@page language="java" import="java.io.*,java.net.*,java.security.*,javax.net.ssl.*" contentType="text/html;charset=euc-kr" %>
<%

/*
 * 뿌리오 발송API 경로 - 서버측 인코딩과 응답형태에 따라 선택
 */
String api_url = "https://www.ppurio.com/api/send_euckr_text.php";    // EUC-KR 인코딩과 TEXT 응답용 호출 페이지
// String api_url = "https://www.ppurio.com/api/send_euckr_json.php"; // EUC-KR 인코딩과 JSON 응답용 호출 페이지
// String api_url = "https://www.ppurio.com/api/send_euckr_xml.php";  // EUC-KR 인코딩과 XML 응답용 호출 페이지
// String api_url = "https://www.ppurio.com/api/send_utf8_text.php";  // UTF-8 인코딩과 TEXT 응답용 호출 페이지
// String api_url = "https://www.ppurio.com/api/send_utf8_json.php";  // UTF-8 인코딩과 JSON 응답용 호출 페이지
// String api_url = "https://www.ppurio.com/api/send_utf8_xml.php";   // UTF-8 인코딩과 XML 응답용 호출 페이지


/*
 * 요청값
 */
String userid = "alsckd0147";           // [필수] 뿌리오 아이디
String callback = "01028490809";    // [필수] 발신번호 - 숫자만
String phone = "01097715447";       // [필수] 수신번호 - 여러명일 경우 |로 구분 "010********|010********|010********"
String msg = "테스트 발송입니다";   // [필수] 문자내용 - 이름(names)값이 있다면 [*이름*]가 치환되서 발송됨
String names = "홍길동";            // [선택] 이름 - 여러명일 경우 |로 구분 "홍길동|이순신|김철수"
String appdate = "20190502093000";  // [선택] 예약발송 (현재시간 기준 10분이후 예약가능)
String subject = "테스트";          // [선택] 제목 (30byte)

String str = "userid="+userid+"&callback="+callback+"&phone="+phone+"&msg="+msg+"&names="+names+"&subject="+subject;

URL url = new URL(api_url);

Security.addProvider(
  new com.sun.net.ssl.internal.ssl.Provider());

SSLSocketFactory factory = 
  (SSLSocketFactory)SSLSocketFactory.getDefault();
SSLSocket socket = 
  (SSLSocket)factory.createSocket(url.getHost(),443);
PrintWriter out1 = new  PrintWriter(
        new OutputStreamWriter(
                socket.getOutputStream()));

%>
