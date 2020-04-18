package blog.xzbk.service;

import java.util.List;

import blog.xzbk.entity.Category;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;

public interface CategoryService {
	/**
	 * 查询总记录条数
	 * @return 总记录条数
	 */
	int totalRows(int uid);
	/**
	 * 查询所有标签信息(不分页)
	 * @param uid
	 * @return
	 */
	List<Category> queryAll(int uid);
	/**
	 * 分页查询分类信息
	 * @param pageMsg
	 * @return
	 */
	Page<Category> queryPage(PageMsg pageMsg);
	/**
	 * 通过id查询分类信息
	 * @param tag
	 * @return
	 */
	Category queryById(Category ategory);
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	boolean delete(int id);
	/**
	 * 删除一页数据
	 * @param idArray
	 * @return
	 */
	boolean deleteAll(List<Integer> idArray);
	/**
	 * 添加分分类
	 * @param tag
	 * @return
	 */
	boolean add(Category category);
	/**
	 * 更新分类
	 * @param category
	 * @return
	 */
	boolean update(Category category);
}
