package JewelsShop.Dao;

import org.springframework.stereotype.Repository;

import JewelsShop.Entity.Bill;
import JewelsShop.Entity.BillDetail;

@Repository
public class BillDao extends BaseDao {
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
		sql.append("  note ");
		sql.append(" ) ");
		sql.append(" VALUES ");
		sql.append("            ( ");
		sql.append(" '" + bill.getEmail() + "', ");
		sql.append(" '" + bill.getPhone() + "', ");
		sql.append(" '" + bill.getDisplay_name() + "', ");
		sql.append(" '" + bill.getAddress() + "', ");
		sql.append("  " + bill.getTotal() + " , ");
		sql.append("  " + bill.getQuanty() + " , ");
		sql.append(" '" + bill.getNote() + "' ");
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
}
