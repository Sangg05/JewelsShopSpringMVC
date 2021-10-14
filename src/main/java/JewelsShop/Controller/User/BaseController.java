package JewelsShop.Controller.User;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Service.User.HomeServiceImpl;
@Controller
public class BaseController {
	@Autowired
	HomeServiceImpl homeService;
	public ModelAndView mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init() {
		mvShare.addObject("categories", homeService.GetDataCategories());
		return mvShare;
	}
}
