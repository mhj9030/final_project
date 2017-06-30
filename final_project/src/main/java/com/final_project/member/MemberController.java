package com.final_project.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/member/login_check", method = RequestMethod.POST)
	public String loginsubmit(@RequestParam String mid, @RequestParam String mpwd, Model model, HttpSession session, HttpServletRequest req)
			throws Exception {
		
		String cp = req.getContextPath();

		// 로그인 정보 가져오기
		Member dto = service.readMember(mid);

		// sha 256 암호화 알고리즘 객체 생성
		ShaPasswordEncoder pe = new ShaPasswordEncoder(256);

		// 파라미터로 넘어온 비밀번호 값을 암호화 처리
		String s2 = pe.encodePassword(mpwd, null);

		// 암호화 된 비밀번호 서로 비교
		if (dto == null || (!dto.getMpwd().equals(s2))) {
			model.addAttribute("mode", "loginfail");
			return ".subLayout";
		}

		// 로그인 세션 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getMid());
		info.setUserName(dto.getMname());
		session.setAttribute("member", info);
		
		//프로필 영역 변수
		String profileurl = cp+"/profile?mid="+mid;
		
		model.addAttribute("profileurl", profileurl);

		return ".mainLayout";

	}
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) throws Exception{
		
		// 세션 삭제
		session.removeAttribute("member");
		session.invalidate();

		return "redirect:/";
	}

	// 회원가입
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String memberRegister(Member dto, Model model) throws Exception {

		ShaPasswordEncoder pe = new ShaPasswordEncoder(256); // sha-256 암호화 객체
															
		String s = pe.encodePassword(dto.getMpwd(), null);
		dto.setMpwd(s);

		try {
			// 회원가입 정보 dao 전송
			service.insertMember(dto);
		} catch (Exception e) {
			model.addAttribute("mode", "registerFail"); // 회원가입 실패 mode 전송
			return ".subLayout";
		}
		model.addAttribute("mode", "registerComplet"); // 오류 발생이 안되면 완료 mode 전송

		return ".subLayout";

	}

	// 사용자 이메일 중복 체크
	@RequestMapping(value = "/member/userEmailCheck")
	@ResponseBody
	public Map<String, Object> userEmailCheck(@RequestParam(value = "mid") String userEmail) throws Exception {
		String state = "false";
		Member dto = service.readMember(userEmail);
		if (dto == null)
			state = "true";

		// 결과 JSON 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;

	}

}
