package kr.or.ddit.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatbotController {

	@RequestMapping(path = "/chatbot", method = RequestMethod.GET)
	public String chatbot(Model model, String str, String userquestion, String userSay, String chatBotSay) {
	
//		if(userquestion == "매칭" || userquestion == "요양보호사" || userquestion == "요양보호사선택" || 
// 				userquestion == "요양사" || userquestion == "보호사"){
//			str = "매칭";
// 		}
		
		
		
//		else if(userquestion == "골드회원" || userquestion == "등급변경" || userquestion == "유료회원"){
// 			$("#chat").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
// 			$("#chat").append("<div id='chatBotSay'> 골드회원서비스 : chatbot "+"</div><br>");
// 		}else if(userquestion == "내정보" || userquestion == "회원정보" || userquestion =="마이페이지"){
// 			$("#chat").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
// 			$("#chat").append("<div id='chatBotSay'> 마이페이지 : chatbot "+"</div><br>");
// 		}else if(userquestion == "무더위쉼터" || userquestion == "더위" || userquestion == "더위대피소" 
// 				|| userquestion == "무더위" || userquestion == "폭염" || userquestion == "양로원"){
// 			$("#chat").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
// 			$("#chat").append("<div id='chatBotSay'> 무더위쉼터 : chatbot "+"</div><br>");
// 		}else if(userquestion == "문화센터" || userquestion == "강좌" || userquestion =="강의" || 
// 				userquestion == "교육" || userquestion =="문화" || userquestion =="수업"){
// 			$("#chat").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
// 			$("#chat").append("<div id='chatBotSay'> 문화강좌정보  : chatbot "+"</div><br>");
// 		}else if(userquestion == "메신저" || userquestion == "메세지" || userquestion == "쪽지"){
// 			$("#chat").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
// 			$("#chat").append("<div id='chatBotSay'> 메신저 : chatbot"+"</div><br>");
// 		}else if(userquestion == ""){
// 			$("#chat").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
// 		}else{
// 			$("#chat").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
// 		} 					
		
		return "chatbot/chatbot";
	}
	
	
	@RequestMapping(path = "/speechToText")
	public String speechToText() {
		
		return "/chatbot/speechToText";
	}
	
}
