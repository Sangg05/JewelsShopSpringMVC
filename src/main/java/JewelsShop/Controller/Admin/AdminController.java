package JewelsShop.Controller.Admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;
import JewelsShop.Dto.CartDto;
import JewelsShop.Entity.Bill;
import JewelsShop.Entity.BillDetail;
import JewelsShop.Entity.Product;
import JewelsShop.Entity.User;
import JewelsShop.Service.User.AccountServiceImpl;
import JewelsShop.Service.User.BillServiceImpl;
import JewelsShop.Service.User.ProductServiceImpl;

@Controller
public class AdminController extends BaseController {

	@Autowired
	private BillServiceImpl billService = new BillServiceImpl();
	@Autowired
	private ProductServiceImpl productService = new ProductServiceImpl();
	@Autowired
	private AccountServiceImpl accountService = new AccountServiceImpl();
	@Autowired
	JavaMailSender mailer;

	@RequestMapping(value = { "/quan-tri/trang-chu" })
	public ModelAndView Index() {

		mvShare.setViewName("admin/home/home");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/brand" })
	public ModelAndView Brand() {

		mvShare.setViewName("admin/brand_form");
		return mvShare;
	}

	@RequestMapping(value = { "/not-permission" })
	public ModelAndView NotPermission() {

		mvShare.setViewName("layouts/not_permission");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/dang-nhap" })
	public ModelAndView Login() {

		mvShare.setViewName("admin/loign");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/san-pham" })
	public ModelAndView Product() {

		mvShare.setViewName("admin/products/product");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/nguoi-dung" })
	public ModelAndView User() {

		List<User> users = accountService.GetAllAccount();
		List<Integer> countBills = new ArrayList<Integer>();

		for (User user : users) {
			countBills.add(billService.GetCountBill(user.getEmail()));
		}

		mvShare.addObject("countBills", countBills);
		mvShare.addObject("users", users);

		mvShare.setViewName("admin/user_manage/user_list");
		return mvShare;
	}

	@RequestMapping(value = { "/quan-tri/hoa-don" })
	public ModelAndView Bill(HttpSession session) {

		List<Bill> bills = new ArrayList<Bill>();
		List<BillDetail> billDetailsBill = new ArrayList<BillDetail>();
		List<Product> products = new ArrayList<Product>();
		User loginInfo = (User) session.getAttribute("LoginInfo");
		if (loginInfo.getEmail().equals("admin@gmail.com")) {

			bills = billService.GetAllBill();
			if (bills != null) {
				for (Bill bill : bills) {
					List<BillDetail> billDetails = billService.GetBillDetails(bill.getId());
					for (BillDetail billDetail : billDetails) {
						Product product = productService.GetProductById(billDetail.getId_product());

						boolean isAdd = products.stream().anyMatch(o -> o.getId() == billDetail.getId_product());
						if (!isAdd) {
							products.add(product);
						}
					}
					billDetailsBill.addAll(billDetails);
				}
			}
			mvShare.addObject("bills", bills);
			mvShare.addObject("billDetailsBill", billDetailsBill);
			mvShare.addObject("products", products);
		} else {
			mvShare.setViewName("redirect:dang-nhap");
		}
		mvShare.setViewName("admin/bills/bill_list");
		return mvShare;
	}

	@RequestMapping(value = "ApprovedCart/{id}/{email:.+}")
	public String ApprovedBill(HttpServletRequest request, HttpSession session, @PathVariable long id,
			@PathVariable String email) {

		List<Bill> bills = new ArrayList<Bill>();
		List<BillDetail> billDetailsBill = new ArrayList<BillDetail>();
		List<Product> products = new ArrayList<Product>();

		bills = billService.GetBill(email);
		if (bills != null) {
			for (Bill bill : bills) {
				List<BillDetail> billDetails = billService.GetBillDetails(bill.getId());
				for (BillDetail billDetail : billDetails) {
					Product product = productService.GetProductById(billDetail.getId_product());

					boolean isAdd = products.stream().anyMatch(o -> o.getId() == billDetail.getId_product());
					if (!isAdd) {
						products.add(product);
					}
				}
				billDetailsBill.addAll(billDetails);
			}
		}

		int i = billService.ApprovedBill(id);

		String subject = "Xác nhận đơn hàng";
		String body = "<h1>Xác nhận đơn hàng</h1>";

		if (i > 0) {

			try {
				String from = "luongsang010@gmail.com";
				// Tao mail
				MimeMessage mail = mailer.createMimeMessage();
				// Su dung lop tro giup
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);

				helper.setTo(email);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body, true);

				// Gui mail
				mailer.send(mail);
				mvShare.addObject("message", "Gửi mail thành công");

			} catch (Exception e) {
				mvShare.addObject("message", "Gửi mail thất bại!\n" + e.toString());
			}

			System.out.println("Xác nhận hóa đơn thành công!");
			// mvShare.addObject("message", "Xóa sản phẩm thành công!");
		} else {
			System.out.println("Xác nhận hóa đơn thất bại!");
			// mvShare.addObject("message", "Xóa sản phẩm thất bại!");
		}
		return "redirect:" + request.getHeader("Referer");
	}

}
