package JewelsShop.Controller.Admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;
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

//	@RequestMapping(value = { "/quan-tri/hop-thu" })
//	public ModelAndView MailBox() {
//
//		mvShare.setViewName("admin/mailbox/mailbox_list");
//		return mvShare;
//	}
}
