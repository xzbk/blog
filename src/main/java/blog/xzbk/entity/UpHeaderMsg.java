package blog.xzbk.entity;

import java.util.Map;

public class UpHeaderMsg {
	private int code;
	private String msg;
	private Map<String,String> data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, String> getData() {
		return data;
	}
	public void setData(Map<String, String> data) {
		this.data = data;
	}
	public UpHeaderMsg(int code, String msg, Map<String, String> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
}
