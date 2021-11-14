package JewelsShop.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import JewelsShop.Dao.ProductDao;
import JewelsShop.Entity.Product;

@Service
public class ProductServiceImpl implements IProduct {

	@Autowired
	private ProductDao productsDao = new ProductDao();

	public Product GetProductById(long id) {

		return productsDao.GetProductById(id);
	}
	
	public int AddProduct(Product product) {

		return productsDao.AddProduct(product);
	}

}
