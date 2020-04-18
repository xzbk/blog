package blog.xzbk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.UserDao;
import blog.xzbk.entity.User;
import blog.xzbk.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	/**
	 * 用户登录
	 */
	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	/**
	 * 通过id查询用户信息
	 */
	@Override
	public User queryById(int id) {
		return userDao.queryById(id);
	}
	/**
	 * 更新用户信息
	 */
	@Override
	public boolean update(User user) {
		int res = userDao.update(user);
		if(res>0) {
			return true;
		}
		return false;
	}

}
