package kr.or.ddit.category.post.post.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.category.post.attachment.service.IAttachmentService;
import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.category.post.post.service.IPostService;
import kr.or.ddit.category.post.reply.service.IReplyService;
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
		logger.debug("☞pagingList");
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
		logger.debug("☞mvo:{}", mvo);
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
		logger.debug("☞mvo.getMem_id():{}", mvo.getMem_id());
		model.addAttribute("mem_id", mvo.getMem_id());

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
		model.addAttribute("mem_id", mvo.getMem_id());
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

	@RequestMapping(path = "ImageBoard1", method = RequestMethod.GET)
	public String ImageBoard() {
		return "festival";
	}
	

	@RequestMapping(path = "ImageBoard")
	public String ImageBoard(Model model, HttpServletRequest request, HttpServletResponse response, PageVo pageVo) throws Exception {
		 if(pageVo==null) {
	        	pageVo.setPage(1);
	        	pageVo.setPageSize(8);
	        }
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=";
        String serviceKey = "t%2FXGXgVLvr7AP3UYDfiatY68OGq5G8nNprjWOevj7BoQRawrcLoRsspN7RY9I034kI5tntajdfp8Bd9Z7mBXCg%3D%3D";
        String parameter = "";
 
        PrintWriter out = response.getWriter();
        String area ="대전";
        
        int areaCode = areaCode(request, response, area);
        parameter = parameter + "&" + "areaCode="+areaCode;
        parameter = parameter + "&" + "eventStartDate=201900101";
        parameter = parameter + "&" + "eventEndDate=20191231";
        parameter = parameter + "&" + "pageNo="+pageVo.getPage();
        parameter = parameter + "&" + "numOfRows="+pageVo.getPageSize();
        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "MobileApp=aa";
        parameter = parameter + "&" + "_type=json";
 
        addr = addr + serviceKey + parameter;
        logger.debug("!!!!addr : {}",addr);
        URL url = new URL(addr);
 
        System.out.println(addr);
 
        InputStream in = url.openStream();                            //URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
 
        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();        //InputStream의 데이터들을 바이트 배열로 저장하기 위해
        IOUtils.copy(in, bos1);            //InputStream의 데이터를 바이트 배열로 복사
        in.close();
        bos1.close();
 
        String mbos = bos1.toString("UTF-8");
 
        byte[] b = mbos.getBytes("UTF-8");
        String s = new String(b, "UTF-8");        //String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
        out.println(s);

        
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObj = (JsonObject) jsonParser.parse(s);
        JsonArray array = (JsonArray) jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
        double boardCnt=jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsDouble();
        int boardCnt2=(int) boardCnt;
        logger.debug("!!!!! json:{}",array);

        
        Gson gson = new Gson();

        ArrayList<Object> list = gson.fromJson( array.toString() , new TypeToken <ArrayList<Object>>(){}.getType() );

        model.addAttribute("list", list);
        model.addAttribute("boardCnt", boardCnt2);
        logger.debug("!!!!! list:{}",list);

        int paginationSize= (int) Math.ceil((double)boardCnt/pageVo.getPageSize());
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("pageVo",pageVo);

        
        return "festivalAjaxHtml";
        
    }
	
	
	
	
	
	public int areaCode(HttpServletRequest request, HttpServletResponse response, String area) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=";
        String serviceKey = "t%2FXGXgVLvr7AP3UYDfiatY68OGq5G8nNprjWOevj7BoQRawrcLoRsspN7RY9I034kI5tntajdfp8Bd9Z7mBXCg%3D%3D";
        String parameter = "";
 
        PrintWriter out = response.getWriter();
        

        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "MobileApp=aa";
        parameter = parameter + "&" + "numOfRows=17";
        parameter = parameter + "&" + "_type=json";
 
        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
 
        System.out.println(addr);
 
        InputStream in = url.openStream();                            //URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
 
        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();        //InputStream의 데이터들을 바이트 배열로 저장하기 위해
        IOUtils.copy(in, bos1);            //InputStream의 데이터를 바이트 배열로 복사
        in.close();
        bos1.close();
 
        String mbos = bos1.toString("UTF-8");
 
        byte[] b = mbos.getBytes("UTF-8");
        String s = new String(b, "UTF-8");        //String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
        out.println(s);
    
        
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObj = (JsonObject) jsonParser.parse(s);
        JsonArray array = (JsonArray) jsonObj.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
        int code =0;
        for (int i = 0; i < array.size(); i++) {          
        	JsonObject object = (JsonObject) array.get(i);
        	String name2 =object.get("name").getAsString();
        	if(area.equals(name2)) {
        		code = Integer.parseInt(object.get("code").toString());
        		break;
        	}
        	     
     
        }            
     
        return code;
    }

}
