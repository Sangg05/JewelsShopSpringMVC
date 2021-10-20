package JewelsShop.Service.User;

import org.springframework.stereotype.Service;

import JewelsShop.Entity.User;


@Service
public interface IAccount {
	public int AddAccount(User user);
	
	public User CheckAccount(User user);
}
