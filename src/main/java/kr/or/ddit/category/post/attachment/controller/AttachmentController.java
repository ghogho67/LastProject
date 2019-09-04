package kr.or.ddit.category.post.attachment.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

	/**
	* Method : attachmentDownload
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @param post_id
	* @param att_id
	* @param attachmentVo
	* @param request
	* @param response
	* @throws IOException
	* Method 설명 : 파일 다운로드
	*/
	@RequestMapping(path = "/download")
	public void attachmentDownload(int cate_id, int post_id, int att_id, AttachmentVo attachmentVo,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		attachmentVo = attachmentService.getAttachment(att_id);

		logger.debug("☞attachmentVo:{}", attachmentVo);

		String fileName = attachmentVo.getAtt_nm();
		String path = attachmentVo.getAtt_path();
		FileInputStream fis = null;
		byte[] b = new byte[4096];
		try {
			fis = new FileInputStream(path);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

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

	/**
	* Method : attachmentDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @param post_id
	* @param cate_id
	* @param model
	* @param postVo
	* @param session
	* @return
	* Method 설명 : 파일 삭제
	*/
	@RequestMapping(path = "/delete")
	public String attachmentDelete(int att_id, int post_id, int cate_id, Model model, PostVo postVo,
			HttpSession session) {

		logger.debug("☞post_id:{}", post_id);
		logger.debug("☞cate_id:{}", cate_id);
		attachmentService.attchmentDelete(att_id);

		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		postVo = postService.getPost(post_id);
		model.addAttribute("board_id", postVo.getCate_id());
		model.addAttribute("postVo", postVo);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		return "/post/postDetail.tiles";

	}

}
