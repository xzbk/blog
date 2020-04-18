package blog.xzbk.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章实体
 * @author Administrator
 *
 */
public class Article implements Serializable{
	private int id;
	private int uid;
	private String name;
	private String content;
	private Date time;
	private Tag tag;
	private Category category;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Tag getTag() {
		return tag;
	}
	public void setTag(Tag tag) {
		this.tag = tag;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", uid=" + uid + ", name=" + name + ", content=" + content + ", time=" + time
				+ ", tag=" + tag + ", category=" + category + "]";
	}
}
