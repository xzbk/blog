package blog.xzbk.entity;

import java.util.Arrays;

public class WangEditor {
	private int errno;
	private String[] data;
	public int getErrno() {
		return errno;
	}
	public void setErrno(int errno) {
		this.errno = errno;
	}
	public String[] getData() {
		return data;
	}
	public void setData(String[] data) {
		this.data = data;
	}
	public WangEditor() {
		super();
	}
	public WangEditor(int errno, String[] data) {
		super();
		this.errno = errno;
		this.data = data;
	}
	@Override
	public String toString() {
		return "WangEditor [errno=" + errno + ", data=" + Arrays.toString(data) + "]";
	}
}
