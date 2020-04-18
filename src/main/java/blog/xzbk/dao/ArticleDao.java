package blog.xzbk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import blog.xzbk.entity.Article;
import blog.xzbk.entity.Category;
import blog.xzbk.entity.PageMsg;

/**
 * 文章dao
 * @author Administrator
 *
 */
public interface ArticleDao {
	/**
	 * 查询总记录条数
	 * @return 总记录条数
	 */
	int totalRows(int uid);
	/**
	 * 分页查询文章信息
	 * @param pageMsg
	 * @return
	 */
	List<Article> queryAll(PageMsg pageMsg);
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
	int delete(int id);
	/**
	 * 删除一页数据
	 * @param idArray
	 * @return
	 */
	int deleteAll(@Param("idArray")List<Integer> idArray);
	/**
	 * 添加文章
	 * @param article
	 * @return
	 */
	int add(Article article);
	/**
	 * 更新文章
	 * @param article
	 * @return
	 */
	int update(Article article);

}
