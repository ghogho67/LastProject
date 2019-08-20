//package kr.or.ddit.category.post.post.controller;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import kr.or.ddit.category.post.post.model.PostVo;
//import kr.or.ddit.member.member.model.MemberVo;
//import kr.or.ddit.page.model.PageVo;
//
//public class ss {
//	@RequestMapping(path = "/searchPagingList", method = RequestMethod.POST)
//	public String titlePagingList(Model model, int cate_id, String search, HttpSession session, PageVo pageVo,
//			String searchType) {
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		map.put("page", pageVo.getPage());
//		map.put("pageSize", pageVo.getPageSize());
//		if (cate_id != 0)
//			map.put("cate_id", cate_id);
//
//		if (searchType.equals("title")) {
//			String post_nm = search;
//			map.put("post_nm", post_nm);
//			resultMap = postService.titlePagingList(map);
//		}
//		if (searchType.equals("cont")) {
//			String post_cont = search;
//			map.put("post_cont", post_cont);
//			resultMap = postService.contPagingList(map);
//		}
//		if (searchType.equals("id")) {
//			String mem_id = search;
//			map.put("mem_id", mem_id);
//			resultMap = postService.idPagingList(map);
//		}
//
//		pageVo.setPage((int) map.get("page"));
//		pageVo.setPageSize((int) map.get("pageSize"));
//
//		int current = 1;
//		model.addAttribute("current", current);
//		model.addAttribute("postCnt", (Integer) resultMap.get("postCnt"));
//		model.addAttribute("postList", (List<PostVo>) resultMap.get("postList"));
//		model.addAttribute("cate_id", cate_id);
//		model.addAttribute("pageVo", pageVo);
//		logger.debug("paginationSize:{}", (Integer) resultMap.get("paginationSize"));
//		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
//		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
//		model.addAttribute("mem_id", mvo.getMem_id());
//
//		return "/post/postPagingList.tiles";
//	}
//}
