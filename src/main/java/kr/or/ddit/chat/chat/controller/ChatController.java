package kr.or.ddit.chat.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.chat.chat.service.IChatService;
import kr.or.ddit.joinVo.ChatMemListVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.register.service.IRegisterService;

@RequestMapping("/chat")
@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	@Resource(name = "chatService")
	private IChatService chatService;
	@Resource(name = "registerService")
	private IRegisterService registerService;
	
	
	@RequestMapping(path = "/thistok", method = RequestMethod.GET)
	public String thistock(String mem_id, Model model, HttpSession session) {
		//mem id로 채팅회원 방아이디 검색을 한다. 그리고 그에대한 LIST를 뿌려준다.
		logger.debug("☞mem_id:{}",mem_id);
		List<ChatMemListVo> chatList = chatService.chatList(mem_id);
		logger.debug("☞chatList:{}",chatList);
		
		logger.debug("☞thistockmemid:{}",mem_id);
		session.setAttribute("mem_id", mem_id);	
		
		
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("chatList",chatList);
	
		return "thistok/thistok";
	}
	
	@RequestMapping(path = "/tokProfileView", method = RequestMethod.GET)
	   public String profile(String mem_id, Model model) throws IOException {
	      //사용자 정보(Path)를 조회
	         MemberVo memberVo = memberService.getMemVo(mem_id);
	         model.addAttribute("memberVo", memberVo);
	         
	         //profileView에서 처리하게 할예정
	         return "profileView";
	   }
	
	@RequestMapping(path = "/chatDelete", method = RequestMethod.GET)
	public String deleteChat(Model model, HttpSession session) {
		int chat_id = (int) session.getAttribute("chat_id");
		String mem_id =(String)session.getAttribute("mem_id");
		logger.debug("☞deleteChat mem_id:{}",mem_id);
		chatService.deletChat(chat_id);
		
	
		return "redirect: /chat/thistok?mem_id="+mem_id;
	}
	
	
	@RequestMapping(path = "/createChatView", method = RequestMethod.GET)
	public String createChatView(Model model, HttpSession session, String chatmem_id) {
		String mem_id =(String)session.getAttribute("mem_id");
		model.addAttribute("mem_id",mem_id);
		return "thistok/creattok";
	}
	
	@RequestMapping(path = "/createChat", method = RequestMethod.POST)
	public String createChat(Model model, HttpSession session, String chatmem_id, String chat_nm) {
		String mem_id =(String)session.getAttribute("mem_id");
		
		
		
		
		
		model.addAttribute("mem_id",mem_id);
		return "thistok/creattok";
	}
	
	
	@RequestMapping(path = "/searchId", method = RequestMethod.POST)
	public String SearchId(Model model, HttpSession session, String chatmem_id) {
		int cm_id = registerService.idCheck(chatmem_id);
		return "jsonView";
	}
	
}



