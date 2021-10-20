package JewelsShop.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import JewelsShop.Dao.UserDao;
import JewelsShop.Entity.User;


@Service
public class AccountServiceImpl implements IAccount {
	@Autowired
	UserDao userDao = new UserDao();

	public int AddAccount(User user) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		
		return userDao.AddAccount(user);
	}

	public User CheckAccount(User user) {
		String password = user.getPassword();
		user = userDao.GetUserByAccount(user); 
		if(user != null) {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return user;
			}
		} 
		return null;
	}

}

