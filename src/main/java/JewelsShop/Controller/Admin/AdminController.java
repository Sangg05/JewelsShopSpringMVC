package JewelsShop.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value = {"/quan-tri/index" })
	public ModelAndView Index() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/content");
		return mvShare;
	}
	
	@RequestMapping(value = {"/quan-tri/brand" })
	public ModelAndView Brand() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/brand_form");
		return mvShare;
	}
}
