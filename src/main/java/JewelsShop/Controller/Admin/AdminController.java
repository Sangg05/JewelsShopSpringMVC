package JewelsShop.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;

@Controller
public class AdminController extends BaseController {
	@RequestMapping(value = {"/quan-tri/trang-chu" })
	public ModelAndView Index() {
		
		
		mvShare.setViewName("admin/home/home");
		return mvShare;
	}
	
	@RequestMapping(value = {"/quan-tri/brand" })
	public ModelAndView Brand() {
		
		
		mvShare.setViewName("admin/brand_form");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/dang-nhap" })
	public ModelAndView Login() {
	
		
		mvShare.setViewName("admin/loign");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/san-pham" })
	public ModelAndView Product() {
		
		mvShare.setViewName("admin/products/product");
		return mvShare;
	}
	
	@RequestMapping(value = {"/quan-tri/nguoi-dung" })
	public ModelAndView User() {
		
		mvShare.setViewName("admin/user_list");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/hoa-don" })
	public ModelAndView Bill() {
		
		mvShare.setViewName("admin/bills/bill_list");
		return mvShare;
	}
	@RequestMapping(value = {"/quan-tri/hop-thu" })
	public ModelAndView MailBox() {
		
		mvShare.setViewName("admin/mailbox/mailbox_list");
		return mvShare;
	}
}
