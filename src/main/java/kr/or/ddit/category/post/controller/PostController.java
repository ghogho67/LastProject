package kr.or.ddit.category.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.category.attachment.model.AttachmentVo;
import kr.or.ddit.category.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.model.PostVo;
import kr.or.ddit.category.post.service.IPostService;
import kr.or.ddit.category.reply.service.IReplyService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/post")
@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);

	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "replyService")
	private IReplyService replyService;

	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@RequestMapping("delete")
	public String postDelete(Model model, int cate_id, int post_id, PageVo pageVo) {

		postService.postDelete(post_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		if (cate_id != 0)
			map.put("cate_id", cate_id);

		Map<String, Object> resultMap = postService.postPagingList(map);
		pageVo.setPage((int) map.get("page"));
		pageVo.setPageSize((int) map.get("pageSize"));

		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("postList", (List<PostVo>) resultMap.get("postList"));
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		return "post/postPagingList";

	}

	@RequestMapping("detail")
	public String postDetail(int cate_id, int post_id, Model model) {

		// cate_id
		model.addAttribute("cate_id", cate_id);
		// replyList
		model.addAttribute("replyList", replyService.replyList(post_id));
		// postVo
		model.addAttribute("postVo", postService.getPost(post_id));
		// post_id
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		// 페이지 이동
		return "post/postDetail";

	}

	@RequestMapping(path = "modifyView")
	public String postModifyView(int cate_id, int post_id, PostVo postVo, Model model) {

		postVo = postService.getPost(post_id);

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postVo);

		return "post/postModify";
	}

	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public String postModify(Model model, int post_id, @RequestParam("file") MultipartFile[] files, PostVo postVo,
			String post_nm, String post_cont, int cate_id, String mem_id, AttachmentVo attachmentVo) {
		// multipartRequest 사용할 준비
		postVo = postService.getPost(post_id);
		// reply 답글 등록 파라미터 설정==============================================
		// ================================================

		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mem_id);
//		postVo.setRef(postVo.getRef());
//		postVo.setRe_step(postVo.getRe_step() + 1);
//		postVo.setRe_level(postVo.getRe_level() + 1);

		postService.postModify(postVo);

		// 댓글과 첨부파일 가져오기
		PostVo postVoTime = postService.getLatestPost();
		post_id = postVoTime.getPost_id();
		postVo = postService.getPost(post_id);
		// file data 받기=======================================================
		// DB에 저장할 파일명
		String savePath = PartUtil.getUploadPath();

		logger.debug("file.size():{}", files.length);

		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().isEmpty()) {
				String attachment_name = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				logger.debug("savePath +File.separator+ fileName + ext:{}", savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				attachmentVo.setAtt_nm(file.getOriginalFilename());
				attachmentVo.setAtt_path(savePath + File.separator + fileName + ext);
				attachmentVo.setPost_id(post_id);
				attachmentService.attachmentInsert(attachmentVo);
			}
		}

		// 객체 넘기기=============================================================
		// cate_id,post_id,replyList,attachmentList,postVo
		// cate_id
		model.addAttribute("cate_id", cate_id);
		// post_id
		model.addAttribute("post_id", post_id);
		// replyList
		model.addAttribute("replyList", replyService.replyList(post_id));
		// attachmentList
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		// postVo
		model.addAttribute("postVo", postVo);
		// 페이지
		// 이동====================================================================
		return "post/postDetail";

	}

	@RequestMapping("/pagingList")
	public String postPagingList(@Valid MemberVo mvo, BindingResult result, int cate_id, PageVo pageVo, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		if (cate_id != 0)
			map.put("cate_id", cate_id);

		Map<String, Object> resultMap = postService.postPagingList(map);

		pageVo.setPage((int) map.get("page"));
		pageVo.setPageSize((int) map.get("pageSize"));

		// ====================================================
		// set cate_id,postList,pageVo,paginationSize
		// cate_id
		model.addAttribute("cate_id", cate_id);
		// postList
		model.addAttribute("postList", (List<PostVo>) resultMap.get("postList"));
		// pageVo
		model.addAttribute("pageVo", pageVo);
		// paginationSize
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		// 화면 출력을 담당하는 jsp에게 역할 위임
		return "post/postPagingList";

	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showPostRegister(int cate_id, Model model) {
		model.addAttribute("cate_id", cate_id);
		return "post/postRegister";

	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String postRegister(PostVo postVo, int cate_id, String post_nm, String post_cont, Model model,
			@RequestParam("file") MultipartFile[] files, AttachmentVo attachmentVo, HttpSession session,
			String mem_id) {

//		MemberVo mvo = (MemberVo) session.getAttribute("USER_INFO");
		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
//		postVo.setMem_id(mvo.getMem_id());
		postVo.setMem_id("brown");

		logger.debug("postVo:{}", postVo);
		// 게시글등록---------------------------------------------------------------------------------------
		postService.postInsert(postVo);
		postVo = postService.getLatestPost();
		int post_id = postVo.getPost_id();
		String fieldName = "";
		MultipartFile mfile = null;

		String savePath = PartUtil.getUploadPath();
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().isEmpty()) {
				String attachment_name = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				attachmentVo.setAtt_nm(file.getOriginalFilename());
				attachmentVo.setAtt_path(savePath + File.separator + fileName + ext);
				attachmentVo.setPost_id(post_id);
				attachmentService.attachmentInsert(attachmentVo);
			}
		}
		model.addAttribute("post_id", post_id);

		if (attachmentService.getAttachmentList(post_id) != null)
			model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("postVo", postVo);
		model.addAttribute("replyList", replyService.replyList(post_id));

		return "post/postDetail";

	}

	@RequestMapping(path = "/reply", method = RequestMethod.GET)
	public String postReply(int cate_id, int post_id, Model model) {

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		return "post/postReply";

	}

	@RequestMapping(path = "/reply", method = RequestMethod.POST)
	public String postReply(PostVo postVo, int cate_id, String post_nm, String post_cont, String mem_id, Model model,
			AttachmentVo attachmentVo, int post_id, @RequestParam("file") MultipartFile[] files, HttpSession session) {
		postVo = postService.getPost(post_id);

		MemberVo mvo = (MemberVo) session.getAttribute("USER_INFO");

		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mvo.getMem_id());
//		postVo.setRef(postVo.getRef());
//		postVo.setRe_step(postVo.getRe_step() + 1);
//		postVo.setRe_level(postVo.getRe_level() + 1);

		// 답글 순서조정 메서드
		postService.updateStep(postVo);
		// 답글 쓰기
		postService.postReply(postVo);

		PostVo postVoTime = postService.getLatestPost();

		post_id = postVoTime.getPost_id();

		// reply 답글 등록 파라미터 설정==============================================
		// ================================================

		// 댓글과 첨부파일 가져오기

		// file data 받기=======================================================
		// DB에 저장할 파일명
		String savePath = PartUtil.getUploadPath();
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().isEmpty()) {
				String attachment_name = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				attachmentVo.setAtt_nm(file.getOriginalFilename());
				attachmentVo.setAtt_path(savePath + File.separator + fileName + ext);
				attachmentVo.setPost_id(post_id);
				attachmentService.attachmentInsert(attachmentVo);
			}
		}

		// 객체 넘기기=============================================================
		// cate_id,post_id,replyList,attachmentList,postVo
		// cate_id
		model.addAttribute("cate_id", cate_id);
		// post_id
		model.addAttribute("post_id", post_id);
		// replyList
		model.addAttribute("replyList", replyService.replyList(post_id));
		// attachmentList
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		// postVo
		model.addAttribute("postVo", postVo);
		// 페이지
		// 이동====================================================================
		return "post/postDetail";

	}

	@RequestMapping("upload")
	public String postUpload(Model model, MultipartFile file, MemberVo mvo, int cate_id) {
		String fileName = null;

		if (file.getSize() > 0) {
			fileName = file.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);
			String uploadPath = PartUtil.getUploadPath();
			String filePath = uploadPath + File.pathSeparator + UUID.randomUUID().toString() + ext;

			mvo.setMem_photo_path(filePath);
			mvo.setMem_photo_nm(fileName);
			logger.debug("uploadPath:{}", filePath);
			try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("fileName", fileName);
		return "post/postRegister";

	}

}
