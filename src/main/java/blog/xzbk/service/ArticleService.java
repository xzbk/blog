package blog.xzbk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import blog.xzbk.entity.Article;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;

public interface ArticleService {
	/**
	 * 分页查询文章信息
	 * @param pageMsg
	 * @return
	 */
	Page<Article> queryAll(PageMsg pageMsg);
	/**
	 * 通过id查询文章
	 * @param article
	 * @return
	 */
	Article queryById(Article article);

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
	 * 添加文章
	 * @param article
	 * @return
	 */
	boolean add(Article article);
	/**
	 * 更新文章
	 * @param article
	 * @return
	 */
	boolean update(Article article);
}
