package blog.xzbk.entity;

import java.util.List;

/**
 * 分页。
 * 
 * @author administrator
 *
 * @param <T>
 *            泛型
 */
public class Page<T> {
	// 当前页码；
	private int currentPage;
	// 当前数据；
	private List<T> items;
	// 总记录数；
	private int totalRows;
	// 页面容量；
	private int pageSize;

	/**
	 * 有参构造方法。
	 * 
	 * @param currentPage
	 *            当前页码；
	 * @param items
	 *            当前数据；
	 * @param totalRows
	 *            总记录数；
	 * @param pageSize
	 *            页面容量；
	 */
	public Page(int currentPage, List<T> items, int totalRows, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.items = items;
		this.totalRows = totalRows;
		this.pageSize = pageSize;
	}

	/**
	 * 获取当前页码。
	 * 
	 * @return 当前页码；
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * 获取当前数据。
	 * 
	 * @return 当前数据；
	 */
	public List<T> getItems() {
		return items;
	}

	/**
	 * 获取总记录数。
	 * 
	 * @return 总记录数；
	 */
	public int getTotalRows() {
		return totalRows;
	}

	/**
	 * 获取总页数。
	 * 
	 * @return 总页数。
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 获取总页数。
	 * 
	 * @return
	 */
	public int getTotalPage() {
		// 要不要存起来？
		return (totalRows % pageSize == 0) ? (totalRows / pageSize) : (totalRows / pageSize + 1);
	}

	/**
	 * 判断当前页是否有下一页。
	 * 
	 * @return 是否有下一页；
	 */
	public boolean hasNextPage() {
		return currentPage < getTotalPage();
	}

	/**
	 * 判断当前页是否有上一页。
	 * 
	 * @return 是否有上一页；
	 */
	public boolean hasPreviousPage() {
		return currentPage > 1;
	}

	/**
	 * 获取当前页的上一页的页码；
	 * 
	 * @return 上一页的页码；
	 */
	public int getPreviousPage() {
		return hasPreviousPage() ? currentPage - 1 : 1;
	}

	/**
	 * 获取当前页的下一页的页码；
	 * 
	 * @return 下一页的页码；
	 */
	public int getNextPage() {
		return hasNextPage() ? currentPage + 1 : getTotalPage();
	}

}
