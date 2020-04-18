package blog.xzbk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import blog.xzbk.entity.Link;
import blog.xzbk.entity.PageMsg;
/**
 * linkdao
 * @author Administrator
 *
 */
public interface LinkDao {
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
	List<Link> queryAll(int uid);
	/**
	 * 分页查询标签信息
	 * @param pageMsg
	 * @return
	 */
	List<Link> queryPage(PageMsg pageMsg);
	/**
	 * 通过id查询标签
	 * @param link
	 * @return
	 */
	Link queryById(Link link);
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
	 * @param link
	 * @return
	 */
	int add(Link link);
	/**
	 * 更新标签
	 * @param link
	 * @return
	 */
	int update(Link link);

}
