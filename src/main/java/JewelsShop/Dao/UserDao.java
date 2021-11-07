package JewelsShop.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import JewelsShop.Entity.MapperUser;
import JewelsShop.Entity.User;

@Repository
public class UserDao extends BaseDao {
	public int AddAccount(User user) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO user ");
		sql.append("( ");
		sql.append("    firstname, ");
		sql.append("    lastname, ");
		sql.append("    email, ");
		sql.append("    password, ");
		sql.append("    address) ");
		sql.append("VALUES ( ");
		sql.append("    '" + user.getFirstname() + "', ");
		sql.append("    '" + user.getLastname() + "', ");
		sql.append("    '" + user.getEmail().toLowerCase() + "', ");
		sql.append("    '" + user.getPassword() + "', ");
		sql.append("    '" + user.getAddress() + "' ");
		sql.append(")");

		int insert = _jdbcTemplate.update(sql.toString());

		return insert;
	}

	public User GetUserByAccount(User user) {
		String sql = "SELECT * FROM user WHERE email = '" + user.getEmail().toLowerCase() + "'";
		List<User> result = _jdbcTemplate.query(sql, new MapperUser());
		
		if (result.isEmpty()) {
	        return null;
	    } else {
	        return result.get(0);
	    }
	}
	
	public List<User> GetAllAccount(){
		String sql = "SELECT * FROM user";
		List<User> result = _jdbcTemplate.query(sql, new MapperUser());
		return result;
	}
}
