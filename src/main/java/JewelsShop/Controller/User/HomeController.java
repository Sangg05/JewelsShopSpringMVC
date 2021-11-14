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
	
	@RequestMapping(value = { "/form" })
	public ModelAndView UploadFile() {

		mvShare.setViewName("admin/upload");
		return mvShare;
	}


}
