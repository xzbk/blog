package blog.xzbk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.ArticleDao;
import blog.xzbk.entity.Article;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Resource
	private ArticleDao articleDao;

	/**
	 * 分页查询文章信息
	 * @param currentPage 当前页码
	 * @param pageSize 每页条数
	 * @return
	 */
	@Override
	public Page<Article> queryAll(PageMsg pageMsg) {
		int currentPage = pageMsg.getCurrentPage();
		int pageSize = pageMsg.getPageSize();
		int totalRows = articleDao.totalRows(pageMsg.getUid());
		//设置开始行
		pageMsg.setStartRow((currentPage-1)*pageSize);
		//查询
		List<Article> items = articleDao.queryAll(pageMsg);
		return new Page<Article>(currentPage, items, totalRows, pageSize);
	}
	/**
	 * 通过id查询文章
	 * @param article
	 * @return
	 */
	@Override
	public Article queryById(Article article) {
		return articleDao.queryById(article);
	}
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	@Override
	public boolean delete(int id) {
		int res = articleDao.delete(id);
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
		int res = articleDao.deleteAll(idArray);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 添加文章
	 * @param article
	 * @return
	 */
	@Override
	public boolean add(Article article) {
		int res = articleDao.add(article);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 更新文章
	 * @param article
	 * @return
	 */
	@Override
	public boolean update(Article article) {
		int res = articleDao.update(article);
		if(res>0) {
			return true;
		}
		return false;
	}

}
