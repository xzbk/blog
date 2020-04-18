package blog.xzbk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import blog.xzbk.entity.Category;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;

/**
 * 分类dao
 * @author Administrator
 *
 */
public interface CategoryDao {
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
	List<Category> queryPage(PageMsg pageMsg);
	/**
	 * 通过id查询分类
	 * @param tag
	 * @return
	 */
	Category queryById(Category category);
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	int delete(int id);
	/**
	 * 删除一页数据
	 * @param idArray
	 * @return
	 */
	int deleteAll(@Param("idArray")List<Integer> idArray);
	/**
	 * 添加分类
	 * @param tag
	 * @return
	 */
	int add(Category category);
	/**
	 * 更新分类
	 * @param category
	 * @return
	 */
	int update(Category category);

}
