package blog.xzbk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import blog.xzbk.dao.LinkDao;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Link;
import blog.xzbk.service.LinkService;

@Service
public class LinkServiceImpl implements LinkService {
	@Resource
	private LinkDao linkDao;

	/**
	 * 查询总记录条数
	 * @return 总记录条数
	 */
	@Override
	public int totalRows(int uid) {
		return linkDao.totalRows(uid);
	}
	/**
	 * 查询所有信息
	 * @param uid
	 * @return
	 */
	@Override
	public List<Link> queryAll(int uid) {
		return linkDao.queryAll(uid);
	}
	/**
	 * 分页查询信息
	 * @param pageMsg 分页信息
	 * @return
	 */
	@Override
	public Page<Link> queryPage(PageMsg pageMsg) {
		int currentPage = pageMsg.getCurrentPage();
		int pageSize = pageMsg.getPageSize();
		int totalRows = linkDao.totalRows(pageMsg.getUid());
		//设置开始行
		pageMsg.setStartRow((currentPage-1)*pageSize);
		//查询
		List<Link> items = linkDao.queryPage(pageMsg);
		return new Page<Link>(currentPage, items, totalRows, pageSize);
	}
	/**
	 * 通过id查询
	 * @param link
	 * @return
	 */
	@Override
	public Link queryById(Link link) {
		return linkDao.queryById(link);
	}
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 */
	@Override
	public boolean delete(int id) {
		int res = linkDao.delete(id);
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
		int res = linkDao.deleteAll(idArray);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 添加标签
	 * @param link
	 * @return
	 */
	@Override
	public boolean add(Link link) {
		int res = linkDao.add(link);
		if(res>0) {
			return true;
		}
		return false;
	}
	/**
	 * 更新标签
	 * @param link
	 * @return
	 */
	@Override
	public boolean update(Link link) {
		int res = linkDao.update(link);
		if(res>0) {
			return true;
		}
		return false;
	}

}
