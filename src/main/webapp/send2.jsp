<%@page language="java" import="java.io.*,java.net.*,java.security.*,javax.net.ssl.*" contentType="text/html;charset=euc-kr" %>
<%

/*
 * �Ѹ��� �߼�API ��� - ������ ���ڵ��� �������¿� ���� ����
 */
// String api_url = "https://www.ppurio.com/api/send_euckr_text.php";    // EUC-KR ���ڵ��� TEXT ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_euckr_json.php"; // EUC-KR ���ڵ��� JSON ����� ȣ�� ������
// String api_url = "https://www.ppurio.com/api/send_euckr_xml.php";  // EUC-KR ���ڵ��� XML ����� ȣ�� ������
String api_url = "https://www.ppurio.com/api/send_utf8_text.php";  // UTF-8 ���ڵ��� TEXT ����� ȣ�� ������
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


try {

    String str = "userid="+userid+"&callback="+callback+"&phone="+phone+"&msg="+msg+"&names="+names+"&subject="+subject;
    out.println(str); 
    URL url = new URL(api_url);

    Security.addProvider(
      new com.sun.net.ssl.internal.ssl.Provider());

    SSLSocketFactory factory = 
      (SSLSocketFactory)SSLSocketFactory.getDefault();
    SSLSocket socket = 
      (SSLSocket)factory.createSocket(url.getHost(),443);

    PrintWriter out1 = new PrintWriter(
        new OutputStreamWriter(
            socket.getOutputStream()));
    out1.println("POST "+ api_url +" HTTP/1.1");
    out1.println("Content-type: application/x-www-form-urlencoded");
    out1.println("Content-length: "+ str.getBytes().length +"\r\n");
    out1.println(str);
    out1.flush();

    BufferedReader in = new BufferedReader(
        new InputStreamReader(
        socket.getInputStream()));

    String line;

    while ((line = in.readLine()) != null) {
        System.out.println(line);
    }

    out1.close();
    in.close();

} catch (IOException localIOException) {
    out.println(localIOException.toString());
}


/*
 * ���䰪
 *
 *  <������>
 *    "ok|sms|123456789|1"           - ���۰��|�߼�����(�ܹ��� sms �幮�� lms ���乮�ڴ� mms)|�߼� msgid (������ҽ� �ʿ�)|�߼۰Ǽ�
 *
 *  <���н�>
 *    "invalid_member"               - �������� ��û�� �� �ưų� ���� ���̵�
 *    "under_maintenance"            - ��û�ð��� ������������ ���
 *    "allow_https_only"             - http ��û�� ���
 *    "invalid_ip"                   - ��ϵ� ���Ӱ��� IP�� �ƴ� ���
 *    "invalid_msg"                  - ���ڳ��뿡 ������ �ִ� ���
 *    "invalid_names"                - �̸��� ������ �ִ� ���
 *    "invalid_subject"              - ���� ������ �ִ� ���
 *    "invalid_sendtime"             - ����߼� �ð��� ������ �ִ� ��� (10�����ĺ��� �����ظ����� ����)
 *    "invalid_sendtime_maintenance" - ����߼� �ð��� �������� ������ ���
 *    "invalid_phone"                - ���Ź�ȣ�� ������ �ִ� ���
 *    "invalid_msg_over_max"         - ���ڳ����� �ʹ� �� ���
 *    "invalid_callback"             - �߽Ź�ȣ�� ������ �ִ� ���
 *    "once_limit_over"              - 1ȸ �ִ� �߼۰Ǽ� �ʰ��� ���
 *    "daily_limit_over"             - 1�� �ִ� �߼۰Ǽ� �ʰ��� ���
 *    "not_enough_point"             - �ܾ��� ������ ���
 *    "over_use_limit"               - �Ѵ� ���ݾ��� �ʰ��� ���
 *    "server_error"                 - ��Ÿ ���� ����
 */

%>