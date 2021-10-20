package JewelsShop.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Entity.User;
import JewelsShop.Service.User.AccountServiceImpl;

@Controller
public class UserController extends BaseController {

	@Autowired
	private AccountServiceImpl accountService = new AccountServiceImpl();

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView Login() {
		mvShare.setViewName("user/account/login");
		mvShare.addObject("user", new User());
		return mvShare;
	}

	@RequestMapping(value = "/info")
	public ModelAndView Info() {
		
		ModelAndView mv = new ModelAndView("user/account/info_account");
		return mv;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView Register() {
		mvShare.setViewName("user/account/register");
		mvShare.addObject("user", new User());
		return mvShare;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView CreateAccout(@ModelAttribute("user") User user) {
		int count = accountService.AddAccount(user);

		if (count > 0) {
			mvShare.addObject("status", "Đăng ký thành công");
			mvShare.setViewName("redirect:trang-chu");
		} else {
			mvShare.addObject("status", "Đăng ký thất bại");
			mvShare.setViewName("redirect:dang-ky");
		}

		

		return mvShare;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
	public ModelAndView LoginAccout(@ModelAttribute("user") User user, HttpSession session) {

		user = accountService.CheckAccount(user);

		if (user != null) {
			mvShare.setViewName("redirect:trang-chu");
			session.setAttribute("LoginInfo", user);
		} else {
			mvShare.addObject("statusLogin", "Đăng nhập thất bại");
		}
		return mvShare;
	}

	@RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
	public String SignOut(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("LoginInfo");
		return "redirect:" + request.getHeader("Referer");
	}
}
