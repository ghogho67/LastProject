package kr.or.ddit.category.post.reply.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.post.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.post.service.IPostService;
import kr.or.ddit.category.post.reply.model.ReplyVo;
import kr.or.ddit.category.post.reply.service.IReplyService;
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

	/**
	* Method : replyDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @param cate_id
	* @param post_id
	* @param model
	* @param session
	* @return
	* Method 설명 : 댓글 삭제
	*/
	@RequestMapping(path = "/delete")
	public String replyDelete(int reply_id, int cate_id, int post_id, Model model, HttpSession session) {

		replyService.replyDelete(reply_id);

		model.addAttribute("postVo", postService.getPost(post_id));
		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

		return "/post/postDetail.tiles";

	}

	/**
	* Method : replyRegister
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_cont
	* @param post_id
	* @param replyVo
	* @param model
	* @param cate_id
	* @param session
	* @return
	* Method 설명 : 댓글 등록
	*/
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String replyRegister(String reply_cont, int post_id, ReplyVo replyVo, Model model, int cate_id,
			HttpSession session) {
		replyVo.setPost_id(post_id);
		replyVo.setReply_cont(reply_cont);
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		replyVo.setMem_id(mvo.getMem_id());

		replyService.replyInsert(replyVo);

		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postService.getPost(post_id));

		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("mem_id", mvo.getMem_id());

		return "redirect:/post/detail";
	}

	/**
	* Method : replyModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @param session
	* @param model
	* @param cate_id
	* @return
	* Method 설명 : 댓글 수정
	*/
	@RequestMapping(path = "/modify", method = RequestMethod.GET)
	public String replyModify(int reply_id, HttpSession session, Model model, int cate_id) {

		ReplyVo rvo = replyService.getReply(reply_id);

		model.addAttribute("post_id", rvo.getPost_id());
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(rvo.getPost_id()));
		model.addAttribute("postVo", postService.getPost(rvo.getPost_id()));
		model.addAttribute("replyList", replyService.replyList(rvo.getPost_id()));
		model.addAttribute("mem_id", rvo.getMem_id());

		return "/post/postDetail.tiles";
	}

}
