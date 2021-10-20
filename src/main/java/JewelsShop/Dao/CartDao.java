package JewelsShop.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import JewelsShop.Dto.CartDto;
import JewelsShop.Entity.Product;

@Repository
public class CartDao extends BaseDao {
	@Autowired
	ProductDao productDao;

	public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		Product product = productDao.GetProductById(id);
		if (product != null && cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuanty(itemCart.getQuanty() + 1);
			itemCart.setTotalPrice(itemCart.getQuanty() * itemCart.getProduct().getPrice());
		} else {
			itemCart.setProduct(product);
			itemCart.setQuanty(1);
			itemCart.setTotalPrice(product.getPrice());
		}

		cart.put(id, itemCart);
		return cart;
	}

	public HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		if (cart.containsKey(id) && cart != null) {
			itemCart = cart.get(id);
			itemCart.setQuanty(quanty);
			itemCart.setTotalPrice(quanty * itemCart.getProduct().getPrice());
		}
		cart.put(id, itemCart);
		return cart;
	}

	public HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) {

		if (cart.containsKey(id) && cart != null) {
			cart.remove(id);
		}
		return cart;
	}

	public int TotalQuanty(HashMap<Long, CartDto> cart) {
		int total = 0;
		for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			total += itemCart.getValue().getQuanty();
		}
		return total;
	}

	public double TotalPrice(HashMap<Long, CartDto> cart) {
		double total = 0;
		for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			total += itemCart.getValue().getTotalPrice();
		}
		return total;
	}
}
