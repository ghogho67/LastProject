package kr.or.ddit.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;

@RequestMapping("/TokProfileView")
public class TokProfileView implements View {
	private static final Logger logger = LoggerFactory.getLogger(TokProfileView.class);
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	
	@Override
	public String getContentType() {
		return "img";
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.debug("☞profileView.render()");

		String mem_id = (String) model.get("mem_id");
		String mem_photo_path = memberService.getProfile(mem_id);

		ServletOutputStream sos = response.getOutputStream();
		FileInputStream fis = null;
		String filePath = null;
		// 사용자가 업로드한 파일이 존재할 경우 : path
		if (mem_photo_path != null) {
			filePath = mem_photo_path;
		} else {
			filePath = request.getServletContext().getRealPath("/image/no_image.gif");
			// webapp/image/no_image.gif
		}
		// path정보로 file을 읽어 드여서
		File file = new File(filePath);
		fis = new FileInputStream(file);

		byte[] buffer = new byte[512];

		// response객체에 스트림으로 써준다.
		while (fis.read(buffer, 0, 512) != -1) {
			sos.write(buffer);
		}
		fis.close();
		sos.close();
	}

}
