package JewelsShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import JewelsShop.Dao.CategoryDao;
import JewelsShop.Dao.ProductDao;
import JewelsShop.Dao.SlidesDao;
import JewelsShop.Entity.Category;
import JewelsShop.Entity.Product;
import JewelsShop.Entity.Slides;

@Service
public class HomeServiceImpl implements IHome {
	@Autowired
	private SlidesDao slidesDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;

	public List<Slides> GetDataSlides() {
		return slidesDao.GetDataSlides();
	}

	public List<Category> GetDataCategories() {
		return categoryDao.GetDataCategories();
	}

	public List<Product> GetDataProducts() {
		return productDao.GetDataProducts();
	}

	public List<Product> getProductsByPage(int id) {
		return productDao.getProductsByPage(id);
	}

	public List<Product> getProductsByName(String key) {
		
		return productDao.getProductsByName(key);
	}

}
