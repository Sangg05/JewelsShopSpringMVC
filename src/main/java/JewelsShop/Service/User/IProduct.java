package JewelsShop.Service.User;

import org.springframework.stereotype.Service;

import JewelsShop.Entity.Product;

@Service
public interface IProduct {
	public Product GetProductById(long id);
	
	public int EditProduct(Product product);
}
