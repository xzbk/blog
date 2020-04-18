package blog.xzbk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import blog.xzbk.entity.Category;
import blog.xzbk.entity.Link;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.service.CategoryService;
import blog.xzbk.service.LinkService;
import blog.xzbk.utils.ParamsUtil;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Resource
	private CategoryService categoryService;
	@Resource
	private LinkService linkService;
	
	/**
	 * 后台分页查询分类信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/backQueryAll")
	public String backQueryAll(PageMsg pageMsg,Model model) {
		Page<Category> data = categoryService.queryPage(pageMsg);
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("totalPage", totalPage);
		if(pageMsg.getKey()!=null&&!"".equals(pageMsg.getKey())) {
			model.addAttribute("key", pageMsg.getKey());
		}
		return "back/category-list";
	}
	/**
	 * 前台分页查询分类信息
	 * @param 
	 * @return
	 */
	@RequestMapping("/frontQueryAll")
	public String frontQueryAll(PageMsg pageMsg,Model model) {
		Page<Category> data = categoryService.queryPage(pageMsg);
		List<Link> links = linkService.queryAll(pageMsg.getUid());
		int total = categoryService.totalRows(pageMsg.getUid());
		model.addAttribute("data", data);
		model.addAttribute("links", links);
		model.addAttribute("total", total);
		return "front/categories";
	}
	/**
	 * 通过id查询分类
	 * @param 
	 * @return
	 */
	@RequestMapping("/queryById")
	public String queryById(Category category,Model model) {
		category = categoryService.queryById(category);
		model.addAttribute("category", category);
		return "back/category-edit";
	}
	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		categoryService.delete(id);
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
		categoryService.deleteAll(idArray);
	}
	/**
	 * 添加分类
	 * @param category
	 */
	@RequestMapping("/add")
	@ResponseBody
	public void add(Category category) {
		categoryService.add(category);
	}
	/**
	 * 更新分类
	 * @param category
	 */
	@RequestMapping("/update")
	@ResponseBody
	public void update(Category category) {
		categoryService.update(category);
	}

}
