package blog.xzbk.entity;
/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User {
	private int id;
	private String name;
	private String password;
	private String header;
	private String signature;
	private String github;
	private String weibo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getGithub() {
		return github;
	}
	public void setGithub(String github) {
		this.github = github;
	}
	public String getWeibo() {
		return weibo;
	}
	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", header=" + header + ", github="
				+ github + ", weibo=" + weibo + "]";
	}
	public User() {
		super();
	}
	public User(String header) {
		super();
		this.header = header;
	}
}
