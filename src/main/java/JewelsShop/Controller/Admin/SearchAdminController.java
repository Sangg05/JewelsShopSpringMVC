package JewelsShop.Controller.Admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;
import JewelsShop.Service.User.HomeServiceImpl;

@Controller
public class SearchAdminController extends BaseController {
	@Autowired
	HomeServiceImpl homeService;

	@RequestMapping(value = "/quan-tri/search")
	public ModelAndView Register(HttpServletRequest request) {
		String key = request.getParameter("query");
		mvShare.addObject("query", key);
		mvShare.addObject("cate", homeService.getProductsByName(key.toUpperCase()));

		PagedListHolder pagedListHolder = new PagedListHolder(homeService.getProductsByName(key));
		int page1 = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page1);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(8);
		mvShare.addObject("pagedListHolder", pagedListHolder);
		mvShare.setViewName("admin/search/search");
		return mvShare;
	}

}
