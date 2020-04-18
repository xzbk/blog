package blog.xzbk.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传工具类
 * 
 * @author Administrator
 *
 */
public class FileUploadUtil {
	/**
	 * 
	 * @param path 文件绝对路径
	 * @param file 上传的文件
	 * @return 返回文件位置
	 */
	public static String upload(String path, MultipartFile file) {
		// 获取原文件名
		String originFileName = file.getOriginalFilename();
		// 解析文件名
		String sufix = originFileName.substring(originFileName.lastIndexOf("."));
		// 日期转换类
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmmss");
		// 格式化文件名
		String fileName = sdf.format(new Date()) + sufix;
		// 判断路径是否存在，不存在则创建
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		// 判断上传文件是否为空
		if (!file.isEmpty()) {
			try {
				file.transferTo(new File(path + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return path.substring(path.lastIndexOf("\\")+1)+fileName;
	}
}
