package JewelsShop.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBill implements RowMapper<Bill>{

	public Bill mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bill bill = new Bill();
		bill.setId(rs.getLong("id"));
		bill.setEmail(rs.getString("email"));
		bill.setPhone(rs.getString("phone"));
		bill.setDisplay_name(rs.getString("display_name"));
		bill.setAddress(rs.getString("address"));
		bill.setTotal(rs.getDouble("total"));
		bill.setQuanty(rs.getInt("quanty"));
		bill.setNote(rs.getString("note"));

		return bill;
	}

}
