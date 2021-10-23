package JewelsShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import JewelsShop.Entity.Category;
import JewelsShop.Entity.Product;
import JewelsShop.Entity.Slides;

@Service
public interface IHome {
	@Autowired
	public List<Slides> GetDataSlides();

	@Autowired
	public List<Category> GetDataCategories();

	@Autowired
	public List<Product> GetDataProducts();

	@Autowired
	public List<Product> getProductsByPage(int id);

	@Autowired
	public List<Product> getProductsByName(String key);
}
