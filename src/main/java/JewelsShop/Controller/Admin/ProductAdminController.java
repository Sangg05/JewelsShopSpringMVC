package JewelsShop.Controller.Admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import JewelsShop.Controller.User.BaseController;
import JewelsShop.Entity.Product;
import JewelsShop.Service.User.HomeServiceImpl;
import JewelsShop.Service.User.ProductServiceImpl;

@Controller
public class ProductAdminController extends BaseController {

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

	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.GET)
	public ModelAndView AddProductGet(HttpServletRequest request, HttpSession session) {
		Product product = new Product();

		mvShare.addObject("product", product);
		mvShare.setViewName("admin/products/add_product");
		return mvShare;
	}

	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.POST)
	public ModelAndView AddProductPost(HttpServletRequest request, HttpSession session,
			@ModelAttribute("product") Product product, @RequestParam("file") CommonsMultipartFile file)
			throws IOException {

		// Get the file name file.getOriginalFilename()
		String uploadFileName = file.getOriginalFilename();
		if ("".equals(uploadFileName)) {
			mvShare.addObject("message", "Upload faile!");
			return mvShare;
		}
		System.out.println("Upload file name: " + uploadFileName);
		String path = request.getServletContext().getRealPath("/assets/user/images/product");
		System.out.println("path: " + path);
		File realPath = new File(path);
		if (!realPath.exists()) {
			realPath.mkdir();
		}
		System.out.println("Upload file storage address:" + realPath);
		// File input stream
		InputStream is = file.getInputStream();
		// File output stream
		OutputStream os = new FileOutputStream(new File(realPath, uploadFileName));
		// IO operation
		int len = 0;
		byte[] buffer = new byte[1024];
		while ((len = is.read(buffer)) != -1) {
			os.write(buffer, 0, len);
			os.flush();
		}
		os.close();
		is.close();
		mvShare.addObject("image", "/assets/user/images/product/" + file.getOriginalFilename());
		//////////////////
		product.setImage(file.getOriginalFilename());

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dt = dateFormat.format(date);
		try {
			product.setCreate_at(dateFormat.parse(dt));
			product.setUpdate_at(dateFormat.parse(dt));

			System.out.println(dateFormat.parse(dt));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int i = productService.AddProduct(product);

		if (i > 0) {
			mvShare.addObject("message", "Thêm sản phẩm mới thành công!");
		} else {
			mvShare.addObject("message", "Thêm sản phẩm mới thất bại!");
		}

		mvShare.setViewName("admin/products/add_product");
		return mvShare;
	}

	@RequestMapping(value = "/quan-tri/sua-san-pham/{id}", method = RequestMethod.GET)
	public ModelAndView EditProductGet(HttpServletRequest request, HttpSession session, @PathVariable String id) {
		Product product = productService.GetProductById(Integer.parseInt(id));

		mvShare.addObject("product", product);
		mvShare.setViewName("admin/products/edit_product");
		return mvShare;
	}

	@RequestMapping(value = "/quan-tri/sua-san-pham/{id}", method = RequestMethod.POST)
	public ModelAndView EditProductPost(HttpServletRequest request, HttpSession session,
			@ModelAttribute("product") Product product, @RequestParam("file") CommonsMultipartFile file,
			@PathVariable String id) throws IOException {

		product.setId(Long.parseLong(id));

		// Get the file name file.getOriginalFilename()
		String uploadFileName = file.getOriginalFilename();
		if ("".equals(uploadFileName)) {
			mvShare.addObject("message", "Upload faile!");
			return mvShare;
		}
		System.out.println("Upload file name: " + uploadFileName);
		String path = request.getServletContext().getRealPath("/assets/user/images/product");
		System.out.println("path: " + path);
		File realPath = new File(path);
		if (!realPath.exists()) {
			realPath.mkdir();
		}
		System.out.println("Upload file storage address:" + realPath);
		// File input stream
		InputStream is = file.getInputStream();
		// File output stream
		OutputStream os = new FileOutputStream(new File(realPath, uploadFileName));
		// IO operation
		int len = 0;
		byte[] buffer = new byte[1024];
		while ((len = is.read(buffer)) != -1) {
			os.write(buffer, 0, len);
			os.flush();
		}
		os.close();
		is.close();
		mvShare.addObject("image", "/assets/user/images/product/" + file.getOriginalFilename());
		//////////////////
		product.setImage(file.getOriginalFilename());

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dt = dateFormat.format(date);
		try {
			product.setCreate_at(dateFormat.parse(dt));
			product.setUpdate_at(dateFormat.parse(dt));

			System.out.println(dateFormat.parse(dt));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int i = productService.EditProduct(product);

		if (i > 0) {
			mvShare.addObject("message", "Sửa sản phẩm thành công!");
		} else {
			mvShare.addObject("message", "Sửa sản phẩm thất bại!");
		}

		mvShare.setViewName("admin/products/edit_product");
		return mvShare;
	}

	@RequestMapping(value = { "quan-tri/xoa-san-pham/{id}" })
	public ModelAndView DeleteProduct(@PathVariable long id) {
		ModelAndView mvShare = new ModelAndView();
		int i = productService.DeleteProduct(id);

		if (i > 0) {
			System.out.println("Xóa sản phẩm thành công!");
			// mvShare.addObject("message", "Xóa sản phẩm thành công!");
		} else {
			System.out.println("Xóa sản phẩm thất bại!");
			// mvShare.addObject("message", "Xóa sản phẩm thất bại!");
		}
		mvShare.setViewName("admin/home/home");
		return mvShare;
	}
}