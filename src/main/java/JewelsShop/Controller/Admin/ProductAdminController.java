package JewelsShop.Controller.Admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;
import JewelsShop.Service.User.HomeServiceImpl;
import JewelsShop.Service.User.ProductServiceImpl;

@Controller
public class ProductAdminController  extends BaseController{

	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	HomeServiceImpl homeService;
	
	@RequestMapping(value = { "quan-tri/category" })
	public ModelAndView Category() {
		mvShare.addObject("categories", homeService.GetDataCategories());
		mvShare.setViewName("admin/products/product_list");
		return mvShare;
	}
	
	@RequestMapping(value = "quan-tri/category/{id}")
	public ModelAndView Category(HttpServletRequest request, @PathVariable String id) {
        mvShare.addObject("cate", homeService.getProductsByPage(Integer.parseInt(id)));
        
        PagedListHolder pagedListHolder = new PagedListHolder(homeService.getProductsByPage(Integer.parseInt(id)));
        int page1 = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page1);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(8);
		mvShare.addObject("pagedListHolder", pagedListHolder);
		mvShare.setViewName("admin/products/product_list");
		return mvShare;
	}
	
	@RequestMapping(value = { "quan-tri/product/{id}" })
	public ModelAndView Product(@PathVariable long id) {
		ModelAndView mvShare = new ModelAndView();
		mvShare.setViewName("admin/products/product");
		mvShare.addObject("product", productService.GetProductById(id));
		mvShare.addObject("categories", homeService.GetDataCategories());
		return mvShare;
	}
}