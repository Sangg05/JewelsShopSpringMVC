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
				helper.setText(HtmlBillEmail(bills, billDetailsBill), true);

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
	String HtmlBillEmail(List<Bill> bills, List<BillDetail> billDetailsBill) {
		String html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + 
				"<head>\r\n" + 
				"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n" + 
				"<meta name=\"x-apple-disable-message-reformatting\" />\r\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n" + 
				"<meta name=\"color-scheme\" content=\"light dark\" />\r\n" + 
				"<meta name=\"supported-color-schemes\" content=\"light dark\" />\r\n" + 
				"<title></title>\r\n" + 
				"<style type=\"text/css\" rel=\"stylesheet\" media=\"all\">\r\n" + 
				"/* Base ------------------------------ */\r\n" + 
				"@import\r\n" + 
				"	url(\"https://fonts.googleapis.com/css?family=Nunito+Sans:400,700&display=swap\")\r\n" + 
				"	;\r\n" + 
				"\r\n" + 
				"body {\r\n" + 
				"	width: 100% !important;\r\n" + 
				"	height: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	-webkit-text-size-adjust: none;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"a {\r\n" + 
				"	color: #3869D4;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"a img {\r\n" + 
				"	border: none;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"td {\r\n" + 
				"	word-break: break-word;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".preheader {\r\n" + 
				"	display: none !important;\r\n" + 
				"	visibility: hidden;\r\n" + 
				"	mso-hide: all;\r\n" + 
				"	font-size: 1px;\r\n" + 
				"	line-height: 1px;\r\n" + 
				"	max-height: 0;\r\n" + 
				"	max-width: 0;\r\n" + 
				"	opacity: 0;\r\n" + 
				"	overflow: hidden;\r\n" + 
				"}\r\n" + 
				"/* Type ------------------------------ */\r\n" + 
				"body, td, th {\r\n" + 
				"	font-family: \"Nunito Sans\", Helvetica, Arial, sans-serif;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h1 {\r\n" + 
				"	margin-top: 0;\r\n" + 
				"	color: #333333;\r\n" + 
				"	font-size: 22px;\r\n" + 
				"	font-weight: bold;\r\n" + 
				"	text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h2 {\r\n" + 
				"	margin-top: 0;\r\n" + 
				"	color: #333333;\r\n" + 
				"	font-size: 16px;\r\n" + 
				"	font-weight: bold;\r\n" + 
				"	text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h3 {\r\n" + 
				"	margin-top: 0;\r\n" + 
				"	color: #333333;\r\n" + 
				"	font-size: 14px;\r\n" + 
				"	font-weight: bold;\r\n" + 
				"	text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"td, th {\r\n" + 
				"	font-size: 16px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p, ul, ol, blockquote {\r\n" + 
				"	margin: .4em 0 1.1875em;\r\n" + 
				"	font-size: 16px;\r\n" + 
				"	line-height: 1.625;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p.sub {\r\n" + 
				"	font-size: 13px;\r\n" + 
				"}\r\n" + 
				"/* Utilities ------------------------------ */\r\n" + 
				".align-right {\r\n" + 
				"	text-align: right;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".align-left {\r\n" + 
				"	text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".align-center {\r\n" + 
				"	text-align: center;\r\n" + 
				"}\r\n" + 
				"/* Buttons ------------------------------ */\r\n" + 
				".button {\r\n" + 
				"	background-color: #3869D4;\r\n" + 
				"	border-top: 10px solid #3869D4;\r\n" + 
				"	border-right: 18px solid #3869D4;\r\n" + 
				"	border-bottom: 10px solid #3869D4;\r\n" + 
				"	border-left: 18px solid #3869D4;\r\n" + 
				"	display: inline-block;\r\n" + 
				"	color: #FFF;\r\n" + 
				"	text-decoration: none;\r\n" + 
				"	border-radius: 3px;\r\n" + 
				"	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);\r\n" + 
				"	-webkit-text-size-adjust: none;\r\n" + 
				"	box-sizing: border-box;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".button--green {\r\n" + 
				"	background-color: #22BC66;\r\n" + 
				"	border-top: 10px solid #22BC66;\r\n" + 
				"	border-right: 18px solid #22BC66;\r\n" + 
				"	border-bottom: 10px solid #22BC66;\r\n" + 
				"	border-left: 18px solid #22BC66;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".button--red {\r\n" + 
				"	background-color: #FF6136;\r\n" + 
				"	border-top: 10px solid #FF6136;\r\n" + 
				"	border-right: 18px solid #FF6136;\r\n" + 
				"	border-bottom: 10px solid #FF6136;\r\n" + 
				"	border-left: 18px solid #FF6136;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"@media only screen and (max-width: 500px) {\r\n" + 
				"	.button {\r\n" + 
				"		width: 100% !important;\r\n" + 
				"		text-align: center !important;\r\n" + 
				"	}\r\n" + 
				"}\r\n" + 
				"/* Attribute list ------------------------------ */\r\n" + 
				".attributes {\r\n" + 
				"	margin: 0 0 21px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".attributes_content {\r\n" + 
				"	background-color: #F4F4F7;\r\n" + 
				"	padding: 16px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".attributes_item {\r\n" + 
				"	padding: 0;\r\n" + 
				"}\r\n" + 
				"/* Related Items ------------------------------ */\r\n" + 
				".related {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 25px 0 0 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".related_item {\r\n" + 
				"	padding: 10px 0;\r\n" + 
				"	color: #CBCCCF;\r\n" + 
				"	font-size: 15px;\r\n" + 
				"	line-height: 18px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".related_item-title {\r\n" + 
				"	display: block;\r\n" + 
				"	margin: .5em 0 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".related_item-thumb {\r\n" + 
				"	display: block;\r\n" + 
				"	padding-bottom: 10px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".related_heading {\r\n" + 
				"	border-top: 1px solid #CBCCCF;\r\n" + 
				"	text-align: center;\r\n" + 
				"	padding: 25px 0 10px;\r\n" + 
				"}\r\n" + 
				"/* Discount Code ------------------------------ */\r\n" + 
				".discount {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 24px;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	background-color: #F4F4F7;\r\n" + 
				"	border: 2px dashed #CBCCCF;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".discount_heading {\r\n" + 
				"	text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".discount_body {\r\n" + 
				"	text-align: center;\r\n" + 
				"	font-size: 15px;\r\n" + 
				"}\r\n" + 
				"/* Social Icons ------------------------------ */\r\n" + 
				".social {\r\n" + 
				"	width: auto;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".social td {\r\n" + 
				"	padding: 0;\r\n" + 
				"	width: auto;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".social_icon {\r\n" + 
				"	height: 20px;\r\n" + 
				"	margin: 0 8px 10px 8px;\r\n" + 
				"	padding: 0;\r\n" + 
				"}\r\n" + 
				"/* Data table ------------------------------ */\r\n" + 
				".purchase {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 35px 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_content {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 25px 0 0 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_item {\r\n" + 
				"	padding: 10px 0;\r\n" + 
				"	color: #51545E;\r\n" + 
				"	font-size: 15px;\r\n" + 
				"	line-height: 18px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_heading {\r\n" + 
				"	padding-bottom: 8px;\r\n" + 
				"	border-bottom: 1px solid #EAEAEC;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_heading p {\r\n" + 
				"	margin: 0;\r\n" + 
				"	color: #85878E;\r\n" + 
				"	font-size: 12px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_footer {\r\n" + 
				"	padding-top: 15px;\r\n" + 
				"	border-top: 1px solid #EAEAEC;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_total {\r\n" + 
				"	margin: 0;\r\n" + 
				"	text-align: right;\r\n" + 
				"	font-weight: bold;\r\n" + 
				"	color: #333333;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".purchase_total--label {\r\n" + 
				"	padding: 0 15px 0 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"body {\r\n" + 
				"	background-color: #F4F4F7;\r\n" + 
				"	color: #51545E;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p {\r\n" + 
				"	color: #51545E;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p.sub {\r\n" + 
				"	color: #6B6E76;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-wrapper {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	background-color: #F4F4F7;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-content {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"}\r\n" + 
				"/* Masthead ----------------------- */\r\n" + 
				".email-masthead {\r\n" + 
				"	padding: 25px 0;\r\n" + 
				"	text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-masthead_logo {\r\n" + 
				"	width: 94px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-masthead_name {\r\n" + 
				"	font-size: 16px;\r\n" + 
				"	font-weight: bold;\r\n" + 
				"	color: #A8AAAF;\r\n" + 
				"	text-decoration: none;\r\n" + 
				"	text-shadow: 0 1px 0 white;\r\n" + 
				"}\r\n" + 
				"/* Body ------------------------------ */\r\n" + 
				".email-body {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 0;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	background-color: #FFFFFF;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-body_inner {\r\n" + 
				"	width: 570px;\r\n" + 
				"	margin: 0 auto;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 570px;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	background-color: #FFFFFF;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-footer {\r\n" + 
				"	width: 570px;\r\n" + 
				"	margin: 0 auto;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 570px;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".email-footer p {\r\n" + 
				"	color: #6B6E76;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".body-action {\r\n" + 
				"	width: 100%;\r\n" + 
				"	margin: 30px auto;\r\n" + 
				"	padding: 0;\r\n" + 
				"	-premailer-width: 100%;\r\n" + 
				"	-premailer-cellpadding: 0;\r\n" + 
				"	-premailer-cellspacing: 0;\r\n" + 
				"	text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".body-sub {\r\n" + 
				"	margin-top: 25px;\r\n" + 
				"	padding-top: 25px;\r\n" + 
				"	border-top: 1px solid #EAEAEC;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content-cell {\r\n" + 
				"	padding: 35px;\r\n" + 
				"}\r\n" + 
				"/*Media Queries ------------------------------ */\r\n" + 
				"@media only screen and (max-width: 600px) {\r\n" + 
				"	.email-body_inner, .email-footer {\r\n" + 
				"		width: 100% !important;\r\n" + 
				"	}\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"@media ( prefers-color-scheme : dark) {\r\n" + 
				"	body, .email-body, .email-body_inner, .email-content, .email-wrapper,\r\n" + 
				"		.email-masthead, .email-footer {\r\n" + 
				"		background-color: #333333 !important;\r\n" + 
				"		color: #FFF !important;\r\n" + 
				"	}\r\n" + 
				"	p, ul, ol, blockquote, h1, h2, h3, span, .purchase_item {\r\n" + 
				"		color: #FFF !important;\r\n" + 
				"	}\r\n" + 
				"	.attributes_content, .discount {\r\n" + 
				"		background-color: #222 !important;\r\n" + 
				"	}\r\n" + 
				"	.email-masthead_name {\r\n" + 
				"		text-shadow: none !important;\r\n" + 
				"	}\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				":root {\r\n" + 
				"	color-scheme: light dark;\r\n" + 
				"	supported-color-schemes: light dark;\r\n" + 
				"}\r\n" + 
				"</style>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"	<span class=\"preheader\">Your trial period for [Product Name] is\r\n" + 
				"		about expired. Is there anything we can do to help?</span>\r\n" + 
				"	<table class=\"email-wrapper\" width=\"100%\" cellpadding=\"0\"\r\n" + 
				"		cellspacing=\"0\" role=\"presentation\">\r\n" + 
				"		<tr>\r\n" + 
				"			<td align=\"center\">\r\n" + 
				"				<table class=\"email-content\" width=\"100%\" cellpadding=\"0\"\r\n" + 
				"					cellspacing=\"0\" role=\"presentation\">\r\n" + 
				"					<tr>\r\n" + 
				"						<td class=\"email-masthead\"><a\r\n" + 
				"							href=\"http://localhost:8080/JewelsShop/\"\r\n" + 
				"							class=\"f-fallback email-masthead_name\"> JewelsShop </a></td>\r\n" + 
				"					</tr>\r\n" + 
				"\r\n" + 
				"					<!-- Email Body -->\r\n" + 
				"					<tr>\r\n" + 
				"						<td class=\"email-body\" width=\"100%\" cellpadding=\"0\"\r\n" + 
				"							cellspacing=\"0\">\r\n" + 
				"							<table class=\"email-body_inner\" align=\"center\" width=\"570\"\r\n" + 
				"								cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\">\r\n" + 
				"								<!-- Body content -->\r\n" + 
				"								<tr>\r\n" + 
				"									<td class=\"content-cell\">\r\n" + 
				"										<div class=\"f-fallback\">\r\n" + 
				"											<h1>Xác nhận thanh toán cho đơn hàng của bạn thành công</h1>\r\n" + 
				"											<p>Cảm ơn bạn đã mua hàng ở JewelsShop, chúng tôi đã nhận\r\n" + 
				"												được đơn đặt hàng.</p>\r\n" + 
				"\r\n" + 
				"											<h1>Đơn hàng của bạn bao gồm:</h1>\r\n" + 
				"											<table class=\"attributes\" width=\"100%\" cellpadding=\"0\"\r\n" + 
				"												cellspacing=\"0\" role=\"presentation\">\r\n" + 
				"												<tr>\r\n" + 
				"													<td class=\"attributes_content\">\r\n" + 
				"														<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
				"															role=\"presentation\">\r\n" + 
				"															<tr>\r\n" + 
				"																<td class=\"attributes_item\">\r\n" + 
				"																	<div class=\"f-fallback\">\r\n" + 
				"																		<strong>ID Bill:</strong> \r\n" + 
				"																		\r\n" + bills.get(0).getId()+
				"																		 <br> <br>\r\n" + 
				"																	</div>\r\n" + 
				"																</td>\r\n" + 
				"															</tr>\r\n" + 
				"															<tr>\r\n" + 
				"																<td class=\"attributes_item\">\r\n" + 
				"																	<div class=\"f-fallback\">\r\n" + 
				"																		<strong>Tổng tiền cần thanh toán:</strong>\r\n" + 
				"																		\r\n đ" + bills.get(0).getTotal() +
				"																		 <br> <br>\r\n" + 
				"																	</div>\r\n" + 
				"																</td>\r\n" + 
				"															</tr>\r\n" + 
				"															\r\n" + 
				"														</table>\r\n" + 
				"													</td>\r\n" + 
				"												</tr>\r\n" + 
				"											</table>\r\n" + 
				"\r\n" + 
				"										</div>\r\n" + 
				"									</td>\r\n" + 
				"								</tr>\r\n" + 
				"							</table>\r\n" + 
				"						</td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td>\r\n" + 
				"							<table class=\"email-footer\" align=\"center\" width=\"570\"\r\n" + 
				"								cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\">\r\n" + 
				"								<tr>\r\n" + 
				"									<td class=\"content-cell\" align=\"center\">\r\n" + 
				"										<p class=\"f-fallback sub align-center\">&copy; 2021\r\n" + 
				"											JewelsShop. All rights reserved.</p>\r\n" + 
				"										<p class=\"f-fallback sub align-center\">\r\n" + 
				"											[JewelsShop, LLC] <br>Q.9, TP HCM <br>Suite 1234\r\n" + 
				"										</p>\r\n" + 
				"									</td>\r\n" + 
				"								</tr>\r\n" + 
				"							</table>\r\n" + 
				"						</td>\r\n" + 
				"					</tr>\r\n" + 
				"				</table>\r\n" + 
				"			</td>\r\n" + 
				"		</tr>\r\n" + 
				"	</table>\r\n" + 
				"</body>\r\n" + 
				"</html>\r\n";
		return html;
	}
		
		


}
