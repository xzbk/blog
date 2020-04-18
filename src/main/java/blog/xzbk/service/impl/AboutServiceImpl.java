package blog.xzbk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.AboutDao;
import blog.xzbk.entity.About;
import blog.xzbk.entity.Tag;
import blog.xzbk.service.AboutService;

@Service
public class AboutServiceImpl implements AboutService {
	@Resource
	private AboutDao aboutDao;

	/**
	 * 通过id查询标签
	 * @param article
	 * @return
	 */
	@Override
	public About queryByUid(int uid) {
		return aboutDao.queryByUid(uid);
	}
	/**
	 * 更新
	 * @param about
	 * @return
	 */
	@Override
	public boolean update(About about) {
		int res = aboutDao.update(about);
		if(res>0) {
			return true;
		}
		return false;
	}

}
