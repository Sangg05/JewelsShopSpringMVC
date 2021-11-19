package JewelsShop.Dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import JewelsShop.Entity.Bill;
import JewelsShop.Entity.BillDetail;
import JewelsShop.Entity.Category;
import JewelsShop.Entity.MapperBill;
import JewelsShop.Entity.MapperBillDetail;
import JewelsShop.Entity.MapperCategory;
import JewelsShop.Entity.MapperUser;

@Repository
public class BillDao extends BaseDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date();

	// System.out.println(dateFormat.format(date));
	public int AddBill(Bill bill) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO bill ");
		sql.append(" ( ");
		sql.append("  email, ");
		sql.append("  phone, ");
		sql.append("  display_name, ");
		sql.append("  address, ");
		sql.append("  total, ");
		sql.append("  quanty, ");
		sql.append("  date, ");
		sql.append("  status ");
		sql.append(" ) ");
		sql.append(" VALUES ");
		sql.append("            ( ");
		sql.append(" '" + bill.getEmail() + "', ");
		sql.append(" '" + bill.getPhone() + "', ");
		sql.append(" '" + bill.getDisplay_name() + "', ");
		sql.append(" '" + bill.getAddress() + "', ");
		sql.append("  " + bill.getTotal() + " , ");
		sql.append("  " + bill.getQuanty() + " , ");
		sql.append("  '" + dateFormat.format(date) + "' , ");
		sql.append(" '" + bill.getStatus() + "' ");
		sql.append(")");
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}

	public long getIDLastBill() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT MAX(id) FROM bill");
		long id = _jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, Long.class);
		return id;
	}

	public int AddBillDetail(BillDetail billDetail) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO billdetail ");
		sql.append("( ");
		sql.append("id_product, ");
		sql.append("id_bill, ");
		sql.append("quanty, ");
		sql.append("total ");
		sql.append(") VALUES ( ");
		sql.append("" + billDetail.getId_product() + ", ");
		sql.append("" + billDetail.getId_bill() + ", ");
		sql.append("" + billDetail.getQuanty() + ", ");
		sql.append("" + billDetail.getTotal() + " ");
		sql.append(")");
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}

	public List<Bill> GetBill(String email) {
		String sql = "SELECT * FROM bill WHERE email = '" + email.trim() + "'";
		List<Bill> bills = _jdbcTemplate.query(sql, new MapperBill());
		if (bills.isEmpty()) {
			return null;
		} else {
			return bills;
		}
	}

	public int GetCountBill(String email) {
		String sql = "SELECT COUNT(id) FROM bill WHERE email = '" + email.trim() + "'";
		int count = _jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, Integer.class);

		return count;

	}

	public List<BillDetail> GetBillDetails(long id_bill) {
		String sql = "SELECT * FROM billdetail WHERE id_bill = " + id_bill;
		List<BillDetail> list = new ArrayList<BillDetail>();

		list = _jdbcTemplate.query(sql, new MapperBillDetail());
		return list;
	}

	public List<Bill> GetAllBill() {
		String sql = "SELECT * FROM bill";
		List<Bill> bills = _jdbcTemplate.query(sql, new MapperBill());
		if (bills.isEmpty()) {
			return null;
		} else {
			return bills;
		}
	}

	public int ApprovedBill(long id) {
		String sql = "UPDATE `bill` SET `status`='Đã xác nhận' WHERE id = " + id;
		int i = _jdbcTemplate.update(sql.toString());
		return i;
	}

}
