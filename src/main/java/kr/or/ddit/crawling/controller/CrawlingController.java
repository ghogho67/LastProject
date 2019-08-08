package kr.or.ddit.crawling.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.diseaseName.service.IDiseaseNameService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.member.memberDisease.service.IMemberDiseaseService;

@Controller
public class CrawlingController {

	private static final Logger logger = LoggerFactory.getLogger(CrawlingController.class);

	@Resource(name = "memberDiseaseService")
	private IMemberDiseaseService memberDiseaseService;

	@Resource(name = "diseaseNameService")
	private IDiseaseNameService diseaseNameService;

	@RequestMapping(path = "/crawling")
	public String crawling(HttpSession session, Model model, String mem_id, String keyWord) throws IOException {
		MemberVo memVo = (MemberVo) session.getAttribute("MEM_INFO");
		mem_id = memVo.getMem_id();
		int num = 0;
		List<MemberDiseaseVo> mdList = memberDiseaseService.getMemDisList(mem_id);
		logger.debug("☞mdList:{}", mdList.size());
		if (mdList.size() > 0) {
			if (mdList.size() == 1) {
				logger.debug("☞mdList.size():{}", mdList.size());
				num = 0;
			} else {
				num = (int) ((Math.random() * (mdList.size() - 1)));
				logger.debug("☞num:{}", num);
				num = mdList.get(num).getDis_id();
				keyWord = diseaseNameService.getDisName(num);
				logger.debug("☞keyWord:{}", keyWord);
			}
		} else {
			keyWord = "치매";
		}

		String src = null;
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" + keyWord;
		Document doc = Jsoup.connect(url).get();

		Elements imgs = doc.select("#main_pack .type01 dl");
		if (imgs.size() > 0) {
			src = imgs.outerHtml();
		}
		session.setAttribute("MEM_INFO", memVo);
		model.addAttribute("src", src);
		return "main";
	}
}