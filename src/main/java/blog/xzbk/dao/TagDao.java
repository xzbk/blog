package blog.xzbk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;

/**
 * 标签dao
 * @author Administrator
 *
 */
public interface TagDao {
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
	List<Tag> queryAll(int uid);
	/**
	 * 分页查询标签信息
	 * @param pageMsg
	 * @return
	 */
	List<Tag> queryPage(PageMsg pageMsg);
	/**
	 * 通过id查询标签
	 * @param tag
	 * @return
	 */
	Tag queryById(Tag tag);
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
	 * 添加标签
	 * @param tag
	 * @return
	 */
	int add(Tag tag);
	/**
	 * 更新标签
	 * @param tag
	 * @return
	 */
	int update(Tag tag);

}
