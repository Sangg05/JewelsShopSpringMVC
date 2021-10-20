package JewelsShop.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Service.User.ProductServiceImpl;


@Controller
public class ProductController extends BaseController  {
	
	@Autowired
	private ProductServiceImpl productService;
	
	@RequestMapping(value = { "/product/{id}"})
	public ModelAndView Index(@PathVariable long id) {
		mvShare.setViewName("user/products/product");
		mvShare.addObject("product", productService.GetProductById(id));
		return mvShare;
	}
}

