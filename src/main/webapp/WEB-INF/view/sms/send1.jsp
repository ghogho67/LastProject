<%@page language="java" import="java.io.*,java.net.*,java.security.*,javax.net.ssl.*" contentType="text/html;charset=euc-kr" %>
<%

/*
 * �Ѹ��� �߼�API ��� - ������ ���ڵ��� �������¿� ���� ����
 */
String api_url = "https://www.ppurio.com/api/send_euckr_text.php";    // EUC-KR ���ڵ��� TEXT ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_euckr_json.php"; // EUC-KR ���ڵ��� JSON ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_euckr_xml.php";  // EUC-KR ���ڵ��� XML ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_utf8_text.php";  // UTF-8 ���ڵ��� TEXT ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_utf8_json.php";  // UTF-8 ���ڵ��� JSON ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_utf8_xml.php";   // UTF-8 ���ڵ��� XML ����� ȣ�� ������


/*
 * ��û��
 */
String userid = "alsckd0147";           // [�ʼ�] �Ѹ��� ���̵�
String callback = "01028490809";    // [�ʼ�] �߽Ź�ȣ - ���ڸ�
String phone = "01097715447";       // [�ʼ�] ���Ź�ȣ - �������� ��� |�� ���� "010********|010********|010********"
String msg = "�׽�Ʈ �߼��Դϴ�";   // [�ʼ�] ���ڳ��� - �̸�(names)���� �ִٸ� [*�̸�*]�� ġȯ�Ǽ� �߼۵�
String names = "ȫ�浿";            // [����] �̸� - �������� ��� |�� ���� "ȫ�浿|�̼���|��ö��"
String appdate = "20190502093000";  // [����] ����߼� (����ð� ���� 10������ ���డ��)
String subject = "�׽�Ʈ";          // [����] ���� (30byte)

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
