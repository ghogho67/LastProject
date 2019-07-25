package kr.or.ddit.category.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "/post/postPagingList.tiles";

	}

	@RequestMapping("detail")
	public String postDetail(int cate_id, int post_id, Model model, HttpSession session) {

		logger.debug("cate_id:{}", cate_id);
		logger.debug("post_id:{}", post_id);

		// cate_id
		model.addAttribute("cate_id", cate_id);
		// replyList
		model.addAttribute("replyList", replyService.replyList(post_id));
		// postVo
		model.addAttribute("postVo", postService.getPost(post_id));
		// post_id
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		// 페이지 이동
		return "/post/postDetail.tiles";

	}

	@RequestMapping(path = "modifyView")
	public String postModifyView(int cate_id, int post_id, PostVo postVo, Model model) {

		postVo = postService.getPost(post_id);

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postVo);

		return "/post/postModify.tiles";
	}

	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public String postModify(Model model, int post_id, @RequestParam("file") MultipartFile[] files, PostVo postVo,
			String post_nm, String post_cont, int cate_id, String mem_id, AttachmentVo attachmentVo,
			HttpSession session) {
		// multipartRequest 사용할 준비
		postVo = postService.getPost(post_id);
		// reply 답글 등록 파라미터 설정==============================================
		// ================================================

		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mem_id);

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
				String a = file.getOriginalFilename();
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
		// mem_id
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		// 페이지
		// 이동====================================================================
		return "/post/postDetail.tiles";

	}

	@RequestMapping("/pagingList")
	public String postPagingList(int cate_id, PageVo pageVo, Model model, HttpSession session) {
//		@Valid MemberVo mvo, BindingResult result, 
		logger.debug("☞delete:{}");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		if (cate_id != 0)
			map.put("cate_id", cate_id);

		Map<String, Object> resultMap = postService.postPagingList(map);
		logger.debug("resultMap:{}", resultMap);

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
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		// 화면 출력을 담당하는 jsp에게 역할 위임
		return "/post/postPagingList.tiles";
	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showPostRegister(int cate_id, Model model) {
		model.addAttribute("cate_id", cate_id);
		return "/SE2/SE2postRegister.tiles";
//		return "board/basicWriting수정";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String postRegister(PostVo postVo, int cate_id, String post_nm, String post_cont, Model model,
			@RequestParam("file") MultipartFile[] files, AttachmentVo attachmentVo, HttpSession session) {

		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mvo.getMem_id());

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
				String att_nm = file.getOriginalFilename();
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
		mvo = (MemberVo) session.getAttribute("MEM_INFO");
		logger.debug("☞mvo.getMem_id():{}",mvo.getMem_id());
		model.addAttribute("mem_id",mvo.getMem_id());

		return "/post/postDetail.tiles";

	}

	@RequestMapping(path = "/reply", method = RequestMethod.GET)
	public String postReply(int cate_id, int post_id, Model model) {

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		return "/post/postReply.tiles";

	}

	@RequestMapping(path = "/reply", method = RequestMethod.POST)
	public String postReply(PostVo postVo, int cate_id, String post_nm, String post_cont, Model model,
			AttachmentVo attachmentVo, int post_id, @RequestParam("file") MultipartFile[] files, HttpSession session) {

		postVo = postService.getPost(post_id);

		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");

		logger.debug("☞postVo:{}", postVo);
		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setPost_group(postVo.getPost_group());
		postVo.setPost_nm(post_nm);
		postVo.setMem_id(mvo.getMem_id());
		postVo.setPost_par(post_id);
		logger.debug("☞postVo:{}", postVo);

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
				String att_nm = file.getOriginalFilename();
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
		mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id",mvo.getMem_id());
		// 페이지
		// 이동====================================================================
		return "/post/postDetail.tiles";

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
		return "/post/postRegister.tiles";

	}

}
