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

	public Product GetProductById(long id) {
		Product product = new Product();
		String sql = "select * from products where id = " + id;
		product = _jdbcTemplate.queryForObject(sql, new MapperProduct());
		return product;
	}

	public List<Product> getProductsByName(String key) {
		List<Product> list = new ArrayList<Product>();
		String sql = "select * from products where name LIKE '%" + key + "%'";
		list = _jdbcTemplate.query(sql, new MapperProduct());
		return list;
	}

	public int AddProduct(Product product) {
		String sql = "INSERT INTO " + "products ( " + "id_category, " + "name, " + "price, " + "sale, " + "title, "
				+ "highlight, " + "new_product, " + "detail, " + "create_at, " + "update_at, " + "image) " + "VALUES ("
				+ product.getId_category() + ", " + "'" + product.getName() + "'," + product.getPrice() + "," + 0 + ","
				+ "'" + product.getTitle() + "'," + 1 + "," + 0 + "," + "'" + product.getDetail() + "'," + "'"
				+ "2021-10-12 00:00:00'," + "'2021-10-12 00:00:00'," + "'" + product.getImage() + "')";

		int insert = _jdbcTemplate.update(sql.toString());

		return insert;
	}

	public int EditProduct(Product product) {

		String sql = "";
		if (product.getImage() != null) {
			sql = "UPDATE products " + "SET " + "id_category=" + product.getId_category() + "," + "name='"
					+ product.getName() + "'," + "price=" + product.getPrice() + "," + "sale=0," + "title='"
					+ product.getTitle() + "'," + "highlight=1," + "new_product=0," + "detail='" + product.getDetail()
					+ "'," + "create_at='2021-10-12 00:00:00'," + "update_at='2021-10-12 00:00:00'," + "image='"
					+ product.getImage() + "' " + "WHERE id = " + product.getId();
		} else {
			sql = "UPDATE products " + "SET " + "id_category=" + product.getId_category() + "," + "name='"
					+ product.getName() + "'," + "price=" + product.getPrice() + "," + "sale=0," + "title='"
					+ product.getTitle() + "'," + "highlight=1," + "new_product=0," + "detail='" + product.getDetail()
					+ "'," + "create_at='2021-10-12 00:00:00'," + "update_at='2021-10-12 00:00:00'" + "WHERE id = "
					+ product.getId();
		}

		int edit = _jdbcTemplate.update(sql.toString());

		return edit;
	}

	public int DeleteProduct(long id) {
		String sql = "DELETE FROM products WHERE id = " + id;
		int delete = _jdbcTemplate.update(sql.toString());
		return delete;
	}

}
