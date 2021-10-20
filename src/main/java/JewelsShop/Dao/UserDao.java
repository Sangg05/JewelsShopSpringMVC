package JewelsShop.Dao;

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
		sql.append("    '" + user.getEmail() + "', ");
		sql.append("    '" + user.getPassword() + "', ");
		sql.append("    '" + user.getAddress() + "' ");
		sql.append(")");

		int insert = _jdbcTemplate.update(sql.toString());

		return insert;
	}

	public User GetUserByAccount(User user) {

		String sql = "SELECT * FROM user WHERE email = '" + user.getEmail() + "'";
		User result = _jdbcTemplate.queryForObject(sql, new MapperUser());
		return result;
	}
}
