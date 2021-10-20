package JewelsShop.Service.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import JewelsShop.Dao.BillDao;
import JewelsShop.Dto.CartDto;
import JewelsShop.Entity.Bill;
import JewelsShop.Entity.BillDetail;

@Service
public class BillServiceImpl implements IBill {
	@Autowired
	private BillDao billDao = new BillDao();

	public int AddBill(Bill bill) {
		return billDao.AddBill(bill);
	}

	public void AddBillDetail(HashMap<Long, CartDto> carts) {
		long idBill = billDao.getIDLastBill();

		for (Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
			BillDetail billDetail = new BillDetail();
			billDetail.setId_bill(idBill);
			billDetail.setId_product(itemCart.getValue().getProduct().getId());
			billDetail.setQuanty(itemCart.getValue().getQuanty());
			billDetail.setTotal(itemCart.getValue().getTotalPrice());

			billDao.AddBillDetail(billDetail);
		}

	}

}
