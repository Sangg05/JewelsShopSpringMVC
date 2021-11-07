package JewelsShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import JewelsShop.Entity.User;


@Service
public interface IAccount {
	public int AddAccount(User user);
	
	public User CheckAccount(User user);
	
	public List<User> GetAllAccount();
}
