package blog.xzbk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.TagDao;
import blog.xzbk.entity.Article;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;
import blog.xzbk.service.TagService;

@Service
public class TagServiceImpl implements TagService {
	@Resource
	private TagDao tagDao;

	/**
	 * 查询总记录条数
	 * @return 总记录条数
	 */
	@Override
	public int totalRows(int uid) {
		return tagDao.totalRows(uid);
	}
	/**
	 * 查询所有标签信息
	 * @param uid
	 * @return
	 */
	@Override
	public List<Tag> queryAll(int uid) {
		return tagDao.queryAll(uid);
	}
	/**
	 * 分页查询标签信息
	 * @param currentPage 当前页码
	 * @param pageSize 每页条数
	 * @return
	 */
	@Override
	public Page<Tag> queryPage(PageMsg pageMsg) {
		int currentPage = pageMsg.getCurrentPage();
		int pageSize = pageMsg.getPageSize();
		int totalRows = tagDao.totalRows(pageMsg.getUid());
		//设置开始行
		pageMsg.setStartRow((currentPage-1)*pageSize);
		//查询
		List<Tag> items = tagDao.queryPage(pageMsg);
		return new Page<Tag>(currentPage, items, totalRows, pageSize);
	}
	/**
	 * 通过id查询标签
	 * @param article
	 * @return
	 */
	@Override
	public Tag queryById(Tag tag) {
		return tagDao.queryById(tag);
	}
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	@Override
	public boolean delete(int id) {
		int res = tagDao.delete(id);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 删除一页数据
	 * @param idArray
	 * @return
	 */
	@Override
	public boolean deleteAll(List<Integer> idArray) {
		int res = tagDao.deleteAll(idArray);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 添加标签
	 * @param tag
	 * @return
	 */
	@Override
	public boolean add(Tag tag) {
		int res = tagDao.add(tag);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 更新标签
	 * @param tag
	 * @return
	 */
	@Override
	public boolean update(Tag tag) {
		int res = tagDao.update(tag);
		if(res>0) {
			return true;
		}
		return false;
	}

}
