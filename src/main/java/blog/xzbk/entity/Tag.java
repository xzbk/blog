package blog.xzbk.entity;
/**
 * 文章标签实体类
 * @author Administrator
 *
 */
public class Tag {
	private int id;
	private int uid;
	private String name;
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
	@Override
	public String toString() {
		return "Tag [id=" + id + ", uid=" + uid + ", name=" + name + "]";
	}
	
}
