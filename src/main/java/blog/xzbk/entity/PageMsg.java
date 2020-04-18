package blog.xzbk.entity;
/**
 * 分页信息
 * @author Administrator
 *
 */
public class PageMsg {
	private int uid;
	private int currentPage=1;
	private int pageSize=5;
	private int startRow;
	private int tagId;
	private int categoryId;
	private String key;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getTagId() {
		return tagId;
	}
	public void setTagId(int tagId) {
		this.tagId = tagId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	@Override
	public String toString() {
		return "PageMsg [uid=" + uid + ", currentPage=" + currentPage + ", pageSize=" + pageSize + ", startRow="
				+ startRow + ", tagId=" + tagId + ", categoryId=" + categoryId + ", key=" + key + "]";
	}
}
