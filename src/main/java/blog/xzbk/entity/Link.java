package blog.xzbk.entity;

public class Link {
	private int id;
	private int uid;
	private String name;
	private String href;
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
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	@Override
	public String toString() {
		return "Link [id=" + id + ", uid=" + uid + ", name=" + name + ", href=" + href + "]";
	}
	
}
