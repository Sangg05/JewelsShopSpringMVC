package JewelsShop.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Entity.Bill;
import JewelsShop.Entity.BillDetail;
import JewelsShop.Entity.Product;
import JewelsShop.Entity.User;
import JewelsShop.Service.User.AccountServiceImpl;
import JewelsShop.Service.User.BillServiceImpl;
import JewelsShop.Service.User.ProductServiceImpl;

@Controller
public class UserController extends BaseController {

	@Autowired
	private AccountServiceImpl accountService = new AccountServiceImpl();
	@Autowired
	private BillServiceImpl billService = new BillServiceImpl();
	@Autowired
	private ProductServiceImpl productService = new ProductServiceImpl();

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView Login() {
		mvShare.setViewName("user/account/login");
		mvShare.addObject("user", new User());
		return mvShare;
	}

	@RequestMapping(value = "/info")
	public ModelAndView Info(HttpSession session) {

		List<Bill> bills = new ArrayList<Bill>();
		List<BillDetail> billDetailsBill = new ArrayList<BillDetail>();
		List<Product> products = new ArrayList<Product>();
		User loginInfo = (User) session.getAttribute("LoginInfo");
		if (loginInfo != null && !loginInfo.getEmail().equals("admin@gmail.com")) {
			
			bills = billService.GetBill(loginInfo.getEmail());
			if (bills != null) {
				for (Bill bill : bills) {
					List<BillDetail> billDetails = billService.GetBillDetails(bill.getId());
					for (BillDetail billDetail : billDetails) {
						Product product = productService.GetProductById(billDetail.getId_product());
						products.add(product);
					}
					billDetailsBill.addAll(billDetails);
				}
			}
			mvShare.addObject("bills", bills);
			mvShare.addObject("billDetailsBill", billDetailsBill);
			mvShare.addObject("products", products);
		} else if(loginInfo != null && loginInfo.getEmail().equals("admin@gmail.com")) { 
			mvShare.setViewName("redirect:quan-tri/trang-chu");
		}else {
			mvShare.setViewName("redirect:dang-nhap");
		}
		mvShare.setViewName("user/account/info_account");
		return mvShare;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView Register() {
		mvShare.setViewName("user/account/register");
		mvShare.addObject("user", new User());
		return mvShare;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView CreateAccout(@ModelAttribute("user") User user) {

		if (user.getFirstname().trim().isEmpty() || user.getLastname().trim().isEmpty()
				|| user.getEmail().trim().isEmpty() || user.getPassword().trim().isEmpty()) {
			mvShare.setViewName("user/account/register");
			mvShare.addObject("status", "Vui lòng điền đầy đủ thông tin!");
		} else {
			int count = accountService.AddAccount(user);

			if (count > 0) {
				mvShare.setViewName("redirect:dang-nhap");
			} else if (count == -1) {

				mvShare.setViewName("user/account/register");
				mvShare.addObject("status", "User đã tồn tại!");
			}

			else {
				mvShare.addObject("status", "Đăng ký thất bại");
				mvShare.setViewName("redirect:dang-ky");
			}
		}

		return mvShare;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
	public ModelAndView LoginAccout(@ModelAttribute("user") User user, HttpSession session) {

		user = accountService.CheckAccount(user);

		if (user != null) {
			
			if(user.getRole() == 0) {
				mvShare.setViewName("redirect:/quan-tri/trang-chu");
			} else {
				mvShare.setViewName("redirect:trang-chu");
			}
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
