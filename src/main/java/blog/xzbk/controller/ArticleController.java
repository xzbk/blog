package blog.xzbk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import blog.xzbk.entity.Article;
import blog.xzbk.entity.Category;
import blog.xzbk.entity.Link;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;
import blog.xzbk.entity.WangEditor;
import blog.xzbk.service.ArticleService;
import blog.xzbk.service.CategoryService;
import blog.xzbk.service.LinkService;
import blog.xzbk.service.TagService;
import blog.xzbk.utils.FileUploadUtil;
import blog.xzbk.utils.ParamsUtil;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Resource
	private ArticleService articleService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private TagService tagService;
	@Resource
	private LinkService linkService;
	
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
		String src = FileUploadUtil.upload(path + "/" + uid + "/article/", file);
		String[] data = {"/blog/"+src};
		//返回图片地址
		return new WangEditor(0,data);
	}
	/**
	 * 后台分页查询文章信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/backQueryAll")
	public String backQueryAll(PageMsg pageMsg,Model model) {
		Page<Article> data = articleService.queryAll(pageMsg);
		int totalPage = data.getTotalPage();
		List<Category> categories = categoryService.queryAll(pageMsg.getUid());
		List<Tag> tags = tagService.queryAll(pageMsg.getUid());
		model.addAttribute("data", data);
		model.addAttribute("categories", categories);
		model.addAttribute("tags", tags);
		model.addAttribute("totalPage", totalPage);
		System.out.println(pageMsg.getTagId());
		if(pageMsg.getTagId()!=0) {
			if(pageMsg.getKey()!=null&&!"".equals(pageMsg.getKey())) {
				model.addAttribute("key", pageMsg.getKey());
			}
			model.addAttribute("tagId", pageMsg.getTagId());
			model.addAttribute("categoryId", pageMsg.getCategoryId());
		}
		return "back/article-list";
	}
	/**
	 * 前台分页查询文章信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/frontQueryAll")
	public String frontQueryAll(PageMsg pageMsg,Model model) {
		Page<Article> data = articleService.queryAll(pageMsg);
		List<Link> links = linkService.queryAll(pageMsg.getUid());
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("links", links);
		model.addAttribute("totalPage", totalPage);
		return "front/index";
	}
	/**
	 * 通过id查询文章
	 * @param 
	 * @return
	 */
	@RequestMapping("/queryById")
	public String queryById(Article article,Model model) {
		article = articleService.queryById(article);
		model.addAttribute("article", article);
		return "front/article";
	}
	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(int id) {
		articleService.delete(id);
		System.out.println(1);
	}
	/**
	 * 删除一页数据
	 * @param ids
	 */
	@RequestMapping("/deleteAll")
	@ResponseBody
	public void delete(String ids) {
		//参数转换
		List<Integer> idArray = ParamsUtil.getIDS(ids);
		articleService.deleteAll(idArray);
	}
	/**
	 * 添加文章
	 * @param article
	 */
	@RequestMapping("/add")
	public String add(Article article) {
		System.out.println(article);
		articleService.add(article);
		return "redirect:/article/backQueryAll?uid="+article.getUid();
	}
	/**
	 * 更新文章
	 * @param article
	 */
	@RequestMapping("/update")
	public String update(Article article) {
		articleService.update(article);
		System.out.println(article);
		return "redirect:/article/backQueryAll?uid="+article.getUid();
	}
	/**
	 * 前台通过tagid分页查询文章信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/queryAllByTagId")
	public String queryAllByTagId(PageMsg pageMsg,Model model) {
		Page<Article> data = articleService.queryAll(pageMsg);
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("tagId", pageMsg.getTagId());
		return "front/tags-detail";
	}
	/**
	 * 前台通过categoryid分页查询文章信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/queryAllByCategoryId")
	public String queryAllByCategoryId(PageMsg pageMsg,Model model) {
		Page<Article> data = articleService.queryAll(pageMsg);
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("categoryId", pageMsg.getCategoryId());
		return "front/categories-detail";
	}

}
