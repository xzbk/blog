package blog.xzbk.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 请求参数处理工具类
 * @author Administrator
 *
 */
public class ParamsUtil {
	/**
	 * 批量删除整型数组转换
	 * @param ids 参数形式类似:  "1,2,3,4"---转换后--->[1,2,3,4]
	 */
	public static List<Integer> getIDS(String ids) {
		List<Integer> lst = new ArrayList<Integer>();
		String[] stringIds = ids.split(",");
		for (String s : stringIds) {
			lst.add(Integer.parseInt(s));
		}
		return lst;
	}
}
