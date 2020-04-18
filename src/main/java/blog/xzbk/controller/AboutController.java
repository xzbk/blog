package blog.xzbk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import blog.xzbk.entity.About;
import blog.xzbk.entity.Article;
import blog.xzbk.entity.WangEditor;
import blog.xzbk.service.AboutService;
import blog.xzbk.utils.FileUploadUtil;

@Controller
@RequestMapping("/about")
public class AboutController {
	@Resource
	private AboutService aboutService;
	/**
	 * 图片上传
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	@ResponseBody
	public WangEditor upload(MultipartFile file, int uid ,HttpServletRequest request ) {
		String path = request.getServletContext().getRealPath("/upload");
		// 文件上传
		String src = FileUploadUtil.upload(path + "/" + uid + "/about/", file);
		String[] data = {"/blog/"+src};
		//返回图片地址
		return new WangEditor(0,data);
	}
	/**
	 * 通过uid查询
	 * @param 
	 * @return
	 */
	@RequestMapping("/frontQuery")
	public String frontQuery(int uid,Model model) {
		About about = aboutService.queryByUid(uid);
		model.addAttribute("about", about);
		return "front/about";
	}
	/**
	 * 通过uid查询
	 * @param 
	 * @return
	 */
	@RequestMapping("/backQuery")
	public String backQuery(int uid,Model model) {
		About about = aboutService.queryByUid(uid);
		model.addAttribute("about", about);
		return "back/about-list";
	}
	/**
	 * 更新文章
	 * @param article
	 */
	@RequestMapping("/update")
	public String update(About about) {
		aboutService.update(about);
		return "redirect:/about/queryByUid?uid="+about.getUid();
	}

}
