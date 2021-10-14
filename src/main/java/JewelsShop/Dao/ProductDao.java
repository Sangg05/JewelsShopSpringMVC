package JewelsShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import JewelsShop.Entity.MapperProduct;
import JewelsShop.Entity.Product;

@Repository
public class ProductDao extends BaseDao {

	public List<Product> GetDataProducts() {
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM products";
		list = _jdbcTemplate.query(sql, new MapperProduct());
		return list;
	}

	public List<Product> getProductsByPage(int id) {
		List<Product> list = new ArrayList<Product>();
		String sql = "select * from products where id_category = " + id;
		list = _jdbcTemplate.query(sql, new MapperProduct());
		return list;
	}

}
