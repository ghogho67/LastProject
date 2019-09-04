package kr.or.ddit.category.post.post.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.category.post.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.post.model.DetailCommonVo;
import kr.or.ddit.category.post.post.model.ImageBoardVo;
import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.category.post.post.service.IPostService;
import kr.or.ddit.category.post.reply.service.IReplyService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/post")
@Controller
public class PostController {
//
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);

	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "replyService")
	private IReplyService replyService;

	@Resource(name = "attachmentService")
	private IAttachmentService attachmentService;

	@Resource(name = "categoryService")
	ICategoryService categoryService;

	/**
	* Method : postModifyView
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @param post_id
	* @param postVo
	* @param model
	* @return
	* Method 설명 : 게시판 수정화면 요청
	*/
	@RequestMapping(path = "modifyView")
	public String postModifyView(int cate_id, int post_id, PostVo postVo, Model model) {

		postVo = postService.getPost(post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postVo);

		return "/post/postModify.tiles";
	}

	/**
	* Method : postPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param pageVo
	* @param cate_id
	* @param model
	* @param session
	* @param current
	* @param searchType
	* @param search
	* @return
	* Method 설명 : 게시판 페이징 리스트
	*/
	@RequestMapping("/pagingList")
	public String postPagingList(PageVo pageVo, @RequestParam(required = false) int cate_id, Model model,
			HttpSession session, @RequestParam(required = false) String current,
			@RequestParam(required = false) String searchType, @RequestParam(required = false) String search) {

		pageVo.setPage(pageVo.getPage());
		pageVo.setPageSize(pageVo.getPageSize());

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());

		if (cate_id != 0)
			map.put("cate_id", cate_id);
		if (searchType != null) {
			if (searchType.equals("title")) {
				String post_nm = search;
				map.put("post_nm", post_nm);
				resultMap = postService.titlePagingList(map);
			} else if (searchType.equals("cont")) {
				String post_cont = search;
				map.put("post_cont", post_cont);
				resultMap = postService.contPagingList(map);
			} else if (searchType.equals("id")) {
				String mem_id = search;
				map.put("mem_id", mem_id);
				resultMap = postService.idPagingList(map);
			} else {
				logger.debug("☞map:{}", map);
				resultMap = postService.postPagingList(map);
			}
		} else {
			resultMap = postService.postPagingList(map);
		}

		if (current == null) {
			current = "1";
		}

		model.addAttribute("search", search);
		model.addAttribute("searchType", searchType);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("current", current);
		model.addAttribute("postList", (List<PostVo>) resultMap.get("postList"));
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("postCnt", (Integer) resultMap.get("postCnt"));
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

		return "/post/postPagingList.tiles";
	}

	/**
	* Method : postReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @param post_id
	* @param model
	* @return
	* Method 설명 : 답글 등록 화면 요청
	*/
	@RequestMapping(path = "/reply", method = RequestMethod.GET)
	public String postReply(int cate_id, int post_id, Model model) {
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		return "/post/postReply.tiles";

	}

	/**
	* Method : postDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param model
	* @param cate_id
	* @param post_id
	* @param pageVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
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

		model.addAttribute("postCnt", (Integer) resultMap.get("postCnt"));
		model.addAttribute("post_id", post_id);
		model.addAttribute("cate_id", cate_id);
		model.addAttribute("postList", (List<PostVo>) resultMap.get("postList"));
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		return "/post/postPagingList.tiles";

	}

	/**
	* Method : postDetail
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @param post_id
	* @param model
	* @param session
	* @return
	* Method 설명 : 게시판 
	*/
	@RequestMapping("detail")
	public String postDetail(int cate_id, int post_id, Model model, HttpSession session) {

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("postVo", postService.getPost(post_id));

		// post_id
		model.addAttribute("post_id", post_id);
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		// 페이지 이동
		return "/post/postDetail.tiles";

	}

	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public String postModify(Model model, int post_id, @RequestParam("file") MultipartFile[] files, PostVo postVo,
			String post_nm, String post_cont, int cate_id, String mem_id, AttachmentVo attachmentVo,
			HttpSession session) {

		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mem_id);

		postService.postModify(postVo);
		postVo = postService.getPost(post_id);

		String savePath = PartUtil.getUploadPath();

		for (MultipartFile file : files) {

			if (!file.getOriginalFilename().isEmpty()) {
				String a = file.getOriginalFilename();
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

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postVo);
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

		return "redirect:/post/detail";

	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showPostRegister(int cate_id, Model model) {
		model.addAttribute("cate_id", cate_id);
		return "/SE2/SE2postRegister.tiles";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String postRegister(PostVo postVo, int cate_id, String post_nm, String post_cont, Model model,
			@RequestParam("file") MultipartFile[] files, AttachmentVo attachmentVo, HttpSession session) {

		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setMem_id(mvo.getMem_id());

		// 게시글등록---------------------------------------------------------------------------------------
		postService.postInsert(postVo);
		postVo = postService.getLatestPost();
		int post_id = postVo.getPost_id();

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
		model.addAttribute("mem_id", mvo.getMem_id());

		return "/post/postDetail.tiles";

	}

	@RequestMapping(path = "/reply", method = RequestMethod.POST)
	public String postReply(PostVo postVo, int cate_id, String post_nm, String post_cont, Model model,
			AttachmentVo attachmentVo, int post_id, @RequestParam("file") MultipartFile[] files, HttpSession session) {

		postVo = postService.getPost(post_id);

		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");

		postVo.setPost_nm(post_nm);
		postVo.setPost_cont(post_cont);
		postVo.setCate_id(cate_id);
		postVo.setPost_group(postVo.getPost_group());
		postVo.setPost_nm(post_nm);
		postVo.setMem_id(mvo.getMem_id());
		postVo.setPost_par(post_id);

		postService.postReply(postVo);
		PostVo postVoTime = postService.getLatestPost();
		post_id = postVoTime.getPost_id();

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

		model.addAttribute("cate_id", cate_id);
		model.addAttribute("post_id", post_id);
		model.addAttribute("replyList", replyService.replyList(post_id));
		model.addAttribute("attachmentList", attachmentService.getAttachmentList(post_id));
		model.addAttribute("postVo", postVo);
		mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

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

	@RequestMapping(path = "ImageBoard2")
	public String ImageBoard2() {
		return "festival2";
	}

	@RequestMapping(path = "ImageBoard")
	public String ImageBoard(Model model, HttpServletRequest request, HttpServletResponse response, PageVo pageVo,
			int areaid, int firstDate, int lastDate) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=";
		String serviceKey = "t%2FXGXgVLvr7AP3UYDfiatY68OGq5G8nNprjWOevj7BoQRawrcLoRsspN7RY9I034kI5tntajdfp8Bd9Z7mBXCg%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();

		if (areaid != 0) {
			parameter = parameter + "&" + "areaCode=" + areaid;
		}
		parameter = parameter + "&" + "eventStartDate=" + firstDate;
		parameter = parameter + "&" + "eventEndDate=" + lastDate;
		parameter = parameter + "&" + "pageNo=" + pageVo.getPage();
		parameter = parameter + "&" + "numOfRows=" + pageVo.getPageSize();
		parameter = parameter + "&" + "arrange=D";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);

		InputStream in = url.openStream(); // URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream의 데이터들을 바이트 배열로 저장하기 위해
		IOUtils.copy(in, bos1); // InputStream의 데이터를 바이트 배열로 복사
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8"); // String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
		out.println(s);

		ArrayList<ImageBoardVo> list = null;
		Gson gson = new Gson();
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(s);
		if (jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").isJsonObject() == false) {

			String abc = gson.toJson(jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body")
					.getAsJsonObject().get("items").getAsJsonObject().get("item"));
			Type type = new TypeToken<List<ImageBoardVo>>() {
			}.getType();
			list = gson.fromJson(abc, type);

		} else {

		}
		double boardCnt = jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject()
				.get("totalCount").getAsDouble();
		int boardCnt2 = (int) boardCnt;

		if (list != null) {
			Collections.sort(list, new Comparator<ImageBoardVo>() {

				@Override
				public int compare(ImageBoardVo o1, ImageBoardVo o2) {
					return o1.getEventstartdate().compareTo(o2.getEventstartdate());
				}
			});
		}

		model.addAttribute("boardCnt", boardCnt2);

		int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
		if (pageVo.getPage() == 1) {
			startPage = 1;
		}
		if (startPage >= 2) {
			startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
		}
		int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

		int lastpaginationSize = (int) Math.ceil((double) boardCnt / pageVo.getPageSize());

		if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
			paginationSize = lastpaginationSize;
		}

		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("lastpaginationSize", lastpaginationSize);
		model.addAttribute("pageVo", pageVo);

		return "festivalAjaxHtml";

	}

	@RequestMapping(path = "festvalPost")
	public String festvalPost(Model model, HttpServletRequest request, HttpServletResponse response, int contenid,
			String startDate, String endDate) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "t%2FXGXgVLvr7AP3UYDfiatY68OGq5G8nNprjWOevj7BoQRawrcLoRsspN7RY9I034kI5tntajdfp8Bd9Z7mBXCg%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "contentId=" + contenid;
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);

		InputStream in = url.openStream(); // URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream의 데이터들을 바이트 배열로 저장하기 위해
		IOUtils.copy(in, bos1); // InputStream의 데이터를 바이트 배열로 복사
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8"); // String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
		out.println(s);
		Gson gson = new Gson();
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(s);
		DetailCommonVo vo = new DetailCommonVo();
		String abc = gson.toJson(jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body")
				.getAsJsonObject().get("items").getAsJsonObject().get("item"));
		vo = gson.fromJson(abc, DetailCommonVo.class);

		model.addAttribute("vo", vo);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return "festivalpost";

	}

}