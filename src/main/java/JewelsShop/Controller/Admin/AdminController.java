package JewelsShop.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value = {"/quan-tri/trang-chu" })
	public ModelAndView Index() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/home/home");
		return mvShare;
	}
	
	@RequestMapping(value = {"/quan-tri/brand" })
	public ModelAndView Brand() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/brand_form");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/dang-nhap" })
	public ModelAndView Login() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/loign");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/san-pham" })
	public ModelAndView Product() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/products/product");
		return mvShare;
	}
	
	@RequestMapping(value = {"/quan-tri/nguoi-dung" })
	public ModelAndView User() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/user_list");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/hoa-don" })
	public ModelAndView Bill() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/bills/bill_list");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/hop-thu" })
	public ModelAndView MailBox() {
		ModelAndView mvShare = new ModelAndView();
		
		mvShare.setViewName("admin/mailbox/mailbox_list");
		return mvShare;
	}
}
