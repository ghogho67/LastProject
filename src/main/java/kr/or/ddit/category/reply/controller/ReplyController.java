package kr.or.ddit.category.reply.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.service.IPostService;
import kr.or.ddit.category.reply.model.ReplyVo;
import kr.or.ddit.category.reply.service.IReplyService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/reply")
@Controller
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "replyService")
	private IReplyService replyService;

	@RequestMapping(path = "/delete")
	public String replyDelete(int reply_id, int cate_id, int post_id, Model model) {

		replyService.replyDelete(reply_id);

		model.addAttribute("postVo", postService.getPost(post_id));
		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));

		return "/post/postDetail.tiles";

	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String replyRegister(String reply_cont, int post_id, ReplyVo replyVo, Model model, int cate_id) {
//		HttpSession session, 
		logger.debug("post_id:{}", post_id);
		logger.debug("reply_cont:{}", reply_cont);
		logger.debug("cate_id:{}", cate_id);

		replyVo.setPost_id(post_id);
		replyVo.setReply_cont(reply_cont);
//		MemberVo mvo = (MemberVo) session.getAttribute("USER_INFO");
		replyVo.setMem_id("brown");

		logger.debug("replyVO:{}", replyVo);
		replyService.replyInsert(replyVo);

		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postService.getPost(post_id));
		model.addAttribute("replyList", replyService.replyList(post_id));

		return "/post/postDetail.tiles";
	}

}
