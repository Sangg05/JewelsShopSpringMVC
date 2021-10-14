package JewelsShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import JewelsShop.Entity.Category;
import JewelsShop.Entity.MapperCategory;

@Repository
public class CategoryDao extends BaseDao {
	
	public List<Category> GetDataCategories() {
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT * FROM categories";
		list = _jdbcTemplate.query(sql, new MapperCategory());
		return list;
	}
}
