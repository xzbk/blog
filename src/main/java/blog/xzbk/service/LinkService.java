package blog.xzbk.service;

import java.util.List;

import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Link;

public interface LinkService {
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
	 * 分页查询信息
	 * @param pageMsg
	 * @return
	 */
	Page<Link> queryPage(PageMsg pageMsg);
	/**
	 * 通过id查询
	 * @param link
	 * @return
	 */
	Link queryById(Link link);
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
	 * 添加
	 * @param link
	 * @return
	 */
	boolean add(Link link);

	/**
	 * 更新
	 * @param link
	 * @return
	 */
	boolean update(Link link);
}
