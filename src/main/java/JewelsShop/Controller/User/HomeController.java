package JewelsShop.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {

	@RequestMapping(value = { "/", "/trang-chu" })
	public ModelAndView Index() {

		mvShare.addObject("slides", homeService.GetDataSlides());
		mvShare.addObject("products", homeService.GetDataProducts());
		mvShare.setViewName("user/index");
		return mvShare;
	}

	@RequestMapping(value = "/product")
	public ModelAndView Product() {
		ModelAndView mv = new ModelAndView("user/products/product");
		return mv;
	}

	@RequestMapping(value = "/login")
	public ModelAndView Login() {
		ModelAndView mv = new ModelAndView("user/account/login");
		return mv;
	}

	@RequestMapping(value = "/register")
	public ModelAndView Regiater() {
		ModelAndView mv = new ModelAndView("user/account/register");
		return mv;
	}
}
