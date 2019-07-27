package kr.or.ddit.category.post.attachment.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.category.post.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.category.post.post.service.IPostService;
import kr.or.ddit.category.post.reply.service.IReplyService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/attachment")
@Controller
public class AttachmentController {

	private static final Logger logger = LoggerFactory.getLogger(AttachmentController.class);

	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "replyService")
	private IReplyService replyService;

	//0725
	@RequestMapping(path = "/download")
	public void attachmentDownload(int cate_id, int post_id, int att_id, AttachmentVo attachmentVo,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		attachmentVo = attachmentService.getAttachment(att_id);

		logger.debug("☞attachmentVo:{}", attachmentVo);

		String fileName = attachmentVo.getAtt_nm();
		String path = attachmentVo.getAtt_path();

		byte[] b = new byte[4096];
		FileInputStream fis = new FileInputStream(path);

		File file = new File(path);

		String mimeType = request.getServletContext().getMimeType(path);
		if (mimeType == null) {
			mimeType = "application/octet-stream;charset=utf-8";
		}

		response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
		ServletOutputStream out = response.getOutputStream();

		int numRead;
		while (true) {
			numRead = fis.read(b, 0, b.length);
			if (numRead == -1)
				break;
			out.write(b, 0, numRead);
		}
		out.flush();
		out.close();
		fis.close();
	}

	//0725
	@RequestMapping(path = "/delete")
	public String attachmentDelete(int att_id, int post_id, int cate_id, Model model, PostVo postVo, HttpSession session) {
		attachmentService.attchmentDelete(att_id);

		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		postVo = postService.getPost(post_id);
		model.addAttribute("board_id", postVo.getCate_id());
		model.addAttribute("postVo", postVo);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("post_id", postVo.getPost_id());
		MemberVo mvo = (MemberVo)session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id",mvo.getMem_id());
		return "/post/postDetail.tiles";

	}

}
