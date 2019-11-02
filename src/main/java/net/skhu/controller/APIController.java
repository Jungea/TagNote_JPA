package net.skhu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.domain.Memo;
import net.skhu.domain.TM;
import net.skhu.domain.Tag;
import net.skhu.domain.User;
import net.skhu.repository.MemoRepository;
import net.skhu.repository.TMRepository;
import net.skhu.repository.TagRepository;
import net.skhu.repository.UserRepository;

@Controller
public class APIController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	MemoRepository memoRepository;
	@Autowired
	TagRepository tagRepository;
	@Autowired
	TMRepository tmRepository;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/login";
	}

	// 로그인 화면에서 로그인버튼 클릭
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, User user, HttpServletRequest request) {
		System.out.println(user.getUserId() + " " + user.getUserPass());
		User u = userRepository.findByUserIdAndUserPass(user.getUserId(), user.getUserPass()).get(0);
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			System.out.println(u);
			return "redirect:list";
		} else
			System.out.println(u);
		return "login/login";
	}

	// 페이지 내의 로그아웃 버튼을 클릭
	@RequestMapping(value = "logout")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:login";
	}

	// 로그인 화면의 회원가입 버튼을 클릭
	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public String membership(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/membership";
	}

	// 회원가입 화면에서 아이디 중복 확인 버튼 클릭
	@RequestMapping(value = "userIdCheck", method = RequestMethod.GET)
	public String child(Model model) {
		return "login/userId_check";
	}

	// 아이디 중복 확인 화면에서 확인 버튼 클릭
	@RequestMapping(value = "userIdCheck", method = RequestMethod.POST)
	public String idCheck(Model model, @RequestParam("userId") String userId) {
		int result = userRepository.countByUserId(userId);
		if (result == 1) { // 이미 사용중인 아이디
			model.addAttribute("userId", "");
			model.addAttribute("refresh", "refresh"); // submit 되었음을 표시하는 input hidden
		} else
			model.addAttribute("userId", userId);

		return "login/userId_check"; // 이후 처리를 자바스크립트로 구현
	}

	// 회원가입 화면 내의 가입 버튼 클릭
	@RequestMapping(value = "membership", method = RequestMethod.POST)
	public String membership(Model model, User user) {
		userRepository.save(user);
		return "redirect:login";
	}

	// 로그인 화면 내의 비밀번호 찾기 글자 클릭
	@RequestMapping(value = "findPassword", method = RequestMethod.GET)
	public String findPassword(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/find_password";
	}

	// 비밀번호 찾기 화면 내의 확인 버튼 클릭
	@RequestMapping(value = "findPassword", method = RequestMethod.POST)
	public String findPassword(Model model, User user, HttpServletRequest request) {
		User u = userRepository.findByUserIdAndPassFindQustAndPassFindAnsr(user.getUserId(), user.getPassFindQust(),
				user.getPassFindAnsr()).get(0);

		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("findPassUser", u);
			return "redirect:changePassword";
		}

		model.addAttribute("user", new User());
		return "login/find_password";

	}

	// 비밀번호 찾기 화면에서 확인버튼 클릭(입력이 맞을 경우)
	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public String changePassword(Model model) {
		return "login/change_password";
	}

	// 비밀번호 변경 화면에서 확인 버튼 클릭
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest request, @RequestParam("userPass") String userPass) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("findPassUser"); // 비밀번호 변경 화면에서 추가한 user 정보
		user.setUserPass(userPass); // user 정보에 비밀번호 변경
		userRepository.save(user); // 비밀번호 업데이트

		return "redirect:login";

	}

	/**
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoRepository.findByUser_UserNumOrderByMemoDateDesc(user.getUserNum());
		System.out.println(memos);
		model.addAttribute("memos", memos);
		return "list";
	}

	@RequestMapping("users")
	public List<User> users() {
		return userRepository.findAll();
	}

	@RequestMapping("user/{id}")
	public User user(@PathVariable("id") int id) {
		return userRepository.findById(id).get();
	}

	@RequestMapping("user/{id}/memos")
	public List<Memo> userMemos(@PathVariable("id") int id) {
		User user = userRepository.findById(id).get();
		return user.getMemos();
	}

	@RequestMapping("user/{id}/tags")
	public List<Tag> userTags(@PathVariable("id") int id) {
		User user = userRepository.findById(id).get();
		return user.getTags();
	}

	@RequestMapping("user/{userId}/memo/{memoId}")
	public List<TM> userMemoTms(@PathVariable("userId") int userId, @PathVariable("memoId") int memoId) {
		User user = userRepository.findById(userId).get();
		List<TM> list = new ArrayList<>();
		for (Memo memo : user.getMemos())
			if (memo.getMemoNum() == memoId)
				for (TM tm : memo.getTms())
					list.add(tm);
		return list;
	}

	@RequestMapping("user/{userId}/tag/{tagId}")
	public List<TM> userTagTms(@PathVariable("userId") int userId, @PathVariable("tagId") int tagId) {
		User user = userRepository.findById(userId).get();
		List<TM> list = new ArrayList<>();
		for (Tag tag : user.getTags())
			if (tag.getTagNum() == tagId)
				for (TM tm : tag.getTms())
					list.add(tm);
		return list;
	}

	@RequestMapping("memos")
	public List<Memo> memos() {
		return memoRepository.findAll();
	}

	@RequestMapping("memo/{id}")
	public Memo memo(@PathVariable("id") int id) {
		return memoRepository.findById(id).get();
	}

	@RequestMapping("tags")
	public List<Tag> tags() {
		return tagRepository.findAll();
	}

	@RequestMapping("tag/{id}")
	public Tag tag(@PathVariable("id") int id) {
		return tagRepository.findById(id).get();
	}

	@RequestMapping("tms")
	public List<TM> tms() {
		return tmRepository.findAll();
	}

	@RequestMapping("tm/{id}")
	public TM tm(@PathVariable("id") int id) {
		return tmRepository.findById(id).get();
	}

//	@RequestMapping("tag/{id}/memos")
//	public List<Memo> tagMemos(@PathVariable("id") int id) {
//		Tag tag = tagRepository.findById(id).get();
//		List<Memo> list = new ArrayList<>();
//		for (TM tm : tag.getTms())
//			list.add(tm.getMemo());
//		return list;
//	}

}
