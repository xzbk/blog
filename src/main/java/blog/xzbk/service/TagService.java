package blog.xzbk.service;

import java.util.List;

import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;

public interface TagService {
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
	Page<Tag> queryPage(PageMsg pageMsg);
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
	boolean delete(int id);
	/**
	 * 删除一页数据
	 * @param idArray
	 * @return
	 */
	boolean deleteAll(List<Integer> idArray);
	/**
	 * 添加标签
	 * @param tag
	 * @return
	 */
	boolean add(Tag tag);

	/**
	 * 更新标签
	 * @param tag
	 * @return
	 */
	boolean update(Tag tag);
}
