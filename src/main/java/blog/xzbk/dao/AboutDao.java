package blog.xzbk.dao;

import blog.xzbk.entity.About;
import blog.xzbk.entity.Tag;

/**
 * aboutdao
 * @author Administrator
 *
 */
public interface AboutDao {
	/**
	 * 通过uid查询
	 * @param uid
	 * @return
	 */
	About queryByUid(int uid);
	/**
	 * 
	 * @param about
	 * @return
	 */
	int update(About about);

}
