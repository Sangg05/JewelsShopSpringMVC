package JewelsShop.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Dto.CartDto;
import JewelsShop.Entity.Bill;
import JewelsShop.Entity.User;
import JewelsShop.Service.User.BillServiceImpl;
import JewelsShop.Service.User.CartServiceImpl;

@Controller
public class CartController extends BaseController {
	@Autowired
	private CartServiceImpl cartService = new CartServiceImpl();
	@Autowired
	private BillServiceImpl billService = new BillServiceImpl();

	@RequestMapping(value = "gio-hang")
	public ModelAndView Index() {
//		mvShare.addObject("slides", homeService.GetDataSlide());
//		mvShare.addObject("categories", homeService.GetDataCategories());
//		mvShare.addObject("new_products", homeService.GetDataNewProducts());
//		mvShare.addObject("highlight_products", homeService.GetDataHighlightProducts());
		mvShare.setViewName("user/cart/list_cart");
		return mvShare;
	}

	@RequestMapping(value = "AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.AddCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "EditCart/{id}/{quanty}")
	public String EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id,
			@PathVariable int quanty) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.EditCart(id, quanty, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.DeleteCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public ModelAndView CheckOut(HttpServletRequest request, HttpSession session) {
		mvShare.setViewName("user/bill/checkout");
		Bill bill = new Bill();
		User loginInfo = (User) session.getAttribute("LoginInfo");
		if (loginInfo != null) {
			bill.setAddress(loginInfo.getAddress());
			bill.setDisplay_name(loginInfo.getLastname());
			bill.setEmail(loginInfo.getEmail());
		}
		mvShare.addObject("bill", bill);
		return mvShare;
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String CheckOutBill(HttpServletRequest request, HttpSession session, @ModelAttribute("bill") Bill bill) {
		bill.setQuanty(Integer.parseInt(session.getAttribute("TotalQuantyCart").toString()));
		bill.setTotal(Double.parseDouble(session.getAttribute("TotalPriceCart").toString()));
		if (billService.AddBill(bill) > 0) {
			HashMap<Long, CartDto> carts = (HashMap<Long, CartDto>) session.getAttribute("Cart");
			billService.AddBillDetail(carts);
		}
		session.removeAttribute("Cart");
		return "redirect:info";
	}
}
