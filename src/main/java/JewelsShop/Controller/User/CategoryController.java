package JewelsShop.Controller.User;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController extends BaseController {
	@RequestMapping(value = "/category/{id}")
	public ModelAndView Category(HttpServletRequest request, @PathVariable String id) {
        mvShare.addObject("cate", homeService.getProductsByPage(Integer.parseInt(id)));
        
        PagedListHolder pagedListHolder = new PagedListHolder(homeService.getProductsByPage(Integer.parseInt(id)));
        int page1 = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page1);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(8);
		mvShare.addObject("pagedListHolder", pagedListHolder);
		mvShare.setViewName("user/products/category");
		return mvShare;
	}

	
}
