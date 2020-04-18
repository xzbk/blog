package blog.xzbk.service;

import java.util.List;

import blog.xzbk.entity.About;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;

public interface AboutService {
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
	boolean update(About about);
}
