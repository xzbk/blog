package blog.xzbk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.CategoryDao;
import blog.xzbk.entity.Category;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;
import blog.xzbk.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	private CategoryDao categoryDao;
	
	/**
	 * 查询总记录条数
	 * @return 总记录条数
	 */
	@Override
	public int totalRows(int uid) {
		return categoryDao.totalRows(uid);
	}
	/**
	 * 查询所有标签信息
	 * @param uid
	 * @return
	 */
	@Override
	public List<Category> queryAll(int uid) {
		return categoryDao.queryAll(uid);
	}
	/**
	 * 分页查询分类信息
	 * @param currentPage 当前页码
	 * @param pageSize 每页条数
	 * @return
	 */
	@Override
	public Page<Category> queryPage(PageMsg pageMsg) {
		int currentPage = pageMsg.getCurrentPage();
		int pageSize = pageMsg.getPageSize();
		int totalRows = categoryDao.totalRows(pageMsg.getUid());
		//设置开始行
		pageMsg.setStartRow((currentPage-1)*pageSize);
		//查询
		List<Category> items = categoryDao.queryPage(pageMsg);
		return new Page<Category>(currentPage, items, totalRows, pageSize);
	}
	/**
	 * 通过id查询分类
	 * @param article
	 * @return
	 */
	@Override
	public Category queryById(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.queryById(category);
	}
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	@Override
	public boolean delete(int id) {
		int res = categoryDao.delete(id);
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
		int res = categoryDao.deleteAll(idArray);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 添加分类
	 * @param category
	 * @return
	 */
	@Override
	public boolean add(Category category) {
		int res = categoryDao.add(category);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 更新分类
	 * @param category
	 * @return
	 */
	@Override
	public boolean update(Category category) {
		int res = categoryDao.update(category);
		if(res>0) {
			return true;
		}
		return false;
	}

}
