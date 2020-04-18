package blog.xzbk.dao;

import blog.xzbk.entity.User;
/**
 * 用户dao
 * @author Administrator
 *
 */
public interface UserDao {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	User login(User user);
	/**
	 * 通过id查询用户信息
	 * @param id
	 * @return
	 */
	User queryById(int id);
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	int update(User user);

}
