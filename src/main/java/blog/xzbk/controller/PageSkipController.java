package blog.xzbk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import blog.xzbk.entity.Article;
import blog.xzbk.entity.Category;
import blog.xzbk.entity.Tag;
import blog.xzbk.service.ArticleService;
import blog.xzbk.service.CategoryService;
import blog.xzbk.service.TagService;

@Controller
@RequestMapping("/pageskip")
public class PageSkipController {
	@Resource
	private CategoryService categoryService;
	@Resource
	private TagService tagService;
	@Resource
	private ArticleService articleService;
	
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/")
	public String go() {
		return "back/index";
	}
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "back/login";
	}
	/**
	 * 跳转到后台首页
	 * @return
	 */
	@RequestMapping("/goBackIndex")
	public String goBackIndex() {
		return "back/index";
	}
	/**
	 * 跳转到添加连接页面
	 * @return
	 */
	@RequestMapping("/goLinkAdd")
	public String goLinkAdd() {
		return "back/link-add";
	}
	/**
	 * 跳转到添加标签页面
	 * @return
	 */
	@RequestMapping("/goTagAdd")
	public String goTagAdd() {
		return "back/tag-add";
	}
	/**
	 * 跳转到添加分类页面
	 * @return
	 */
	@RequestMapping("/goCategoryAdd")
	public String goCategoryAdd() {
		return "back/category-add";
	}
	/**
	 * 跳转到添加分类页面
	 * @return
	 */
	@RequestMapping("/goAboutList")
	public String goAboutList() {
		return "back/about-list";
	}
	/**
	 * 跳转到添加添加页面
	 * @return
	 */
	@RequestMapping("/goArticleAdd")
	public String goArticleAdd(int uid,Model model) {
		List<Category> categories = categoryService.queryAll(uid);
		List<Tag> tags = tagService.queryAll(uid);
		model.addAttribute("categories", categories);
		model.addAttribute("tags", tags);
		return "back/article-add";
	}
	/**
	 * 跳转到修改文章界面
	 * @return
	 */
	@RequestMapping("/goArticleEdit")
	public String goArticleEdit(Article article,Model model) {
		List<Category> categories = categoryService.queryAll(article.getUid());
		List<Tag> tags = tagService.queryAll(article.getUid());
		article = articleService.queryById(article);
		model.addAttribute("categories", categories);
		model.addAttribute("tags", tags);
		model.addAttribute("article", article);
		return "back/article-edit";
	}

}
