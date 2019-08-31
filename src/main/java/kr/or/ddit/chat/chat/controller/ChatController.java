package kr.or.ddit.chat.chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.chat.chat.model.ChatVo;
import kr.or.ddit.chat.chat.service.IChatService;
import kr.or.ddit.chat.chatMem.model.ChatMemVo;
import kr.or.ddit.chat.chatMem.service.IChatMemService;
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
	@Resource(name = "chatMemService")
	private IChatMemService chatMemService;
	
	
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
		chatMemService.messageUpdateN(chat_id);
		
		
		
	
		return "redirect: /chat/thistok?mem_id="+mem_id;
	}
	
	
	@RequestMapping(path = "/createChatView", method = RequestMethod.GET)
	public String createChatView(Model model, HttpSession session, String chatmem_id ) {
		String mem_id =(String)session.getAttribute("mem_id");
		
		model.addAttribute("mem_id",mem_id);
		return "thistok/creattok";
	}
	
	@RequestMapping(path = "/createChat")
	public String createChat(Model model, HttpSession session, String chatmem_id, String chat_nm, RedirectAttributes ra) {
		
			
			String mem_id =(String)session.getAttribute("mem_id");
			logger.debug("☞mem_id:{}",mem_id);
			logger.debug("☞mem_id:{}",chat_nm);
			logger.debug("☞mem_id:{}",chatmem_id);
			String chat_mem_id = mem_id;
			ChatVo chatVo = new ChatVo(chat_nm, chat_mem_id);
			chatService.insertChat(chatVo);
			int chat_id = chatVo.getChat_id();
			
			ChatMemVo chatMemVo1 = new ChatMemVo(chat_id, mem_id);
			chatMemService.insertChatMem(chatMemVo1);
			
			ChatMemVo chatMemVo2 = new ChatMemVo(chat_id, chatmem_id);
			chatMemService.insertChatMem(chatMemVo2);
			
			
			ra.addAttribute("mem_id",mem_id);
			ra.addAttribute("chat_id",chat_id);
			return "redirect: /socket/view";
	}
		
	
	
	
	@RequestMapping(path = "/createChat2")
	public String createChat2(Model model, HttpSession session, String chatmem_id, String chat_nm, RedirectAttributes ra, String mem_id) {
		
		logger.debug("☞mem_id:{}",mem_id);
		logger.debug("☞mem_id:{}",chat_nm);
		logger.debug("☞mem_id:{}",chatmem_id);
		String chat_mem_id = mem_id;
		ChatVo chatVo = new ChatVo(chat_nm, chat_mem_id);
		chatService.insertChat(chatVo);
		int chat_id = chatVo.getChat_id();
		
		ChatMemVo chatMemVo1 = new ChatMemVo(chat_id, mem_id);
		chatMemService.insertChatMem(chatMemVo1);

		ChatMemVo chatMemVo2 = new ChatMemVo(chat_id, chatmem_id);
		chatMemService.insertChatMem(chatMemVo2);
		
		logger.debug(chat_mem_id);
		
		
		ra.addAttribute("mem_id",mem_id);
		ra.addAttribute("chat_id",chat_id);
		return "redirect: /socket/view";
	}
	
	
	
	
	
	
	@RequestMapping(path = "/searchId", method = RequestMethod.GET)
	public String SearchId(Model model, HttpSession session, String chatmem_id, @RequestParam(required = false)String chat_nm) {
		logger.debug("☞SearchId까지오니? 그리고 chatmem_id 받니?:{}",chatmem_id);
		int cm_id = 0;
		if(!chatmem_id.equals(null) || !chatmem_id.equals("")) {
			cm_id = registerService.idCheck(chatmem_id);
			model.addAttribute("cm_id",cm_id);
		}else{
			model.addAttribute("cm_id",0);
			
		}
		
	
		
		return "jsonView";
	}
	
}



