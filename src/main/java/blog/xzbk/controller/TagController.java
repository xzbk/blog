package blog.xzbk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import blog.xzbk.entity.Link;
import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Tag;
import blog.xzbk.service.LinkService;
import blog.xzbk.service.TagService;
import blog.xzbk.utils.ParamsUtil;

@Controller
@RequestMapping("/tag")
public class TagController {
	@Resource
	private TagService tagService;
	@Resource
	private LinkService linkService;

	/**
	 * 后台分页查询标签信息
	 * @param pageMsg
	 * @param model
	 * @return
	 */
	@RequestMapping("/backQueryAll")
	public String backQueryAll(PageMsg pageMsg,Model model) {
		Page<Tag> data = tagService.queryPage(pageMsg);
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("totalPage", totalPage);
		if(pageMsg.getKey()!=null&&!"".equals(pageMsg.getKey())) {
			model.addAttribute("key", pageMsg.getKey());
		}
		return "back/tag-list";
	}
	/**
	 * 前台分页查询标签信息
	 * @param pageMsg
	 * @param model
	 * @return
	 */
	@RequestMapping("/frontQueryAll")
	public String frontQueryAll(PageMsg pageMsg,Model model) {
		Page<Tag> data = tagService.queryPage(pageMsg);
		List<Link> links = linkService.queryAll(pageMsg.getUid());
		int total = tagService.totalRows(pageMsg.getUid());
		model.addAttribute("data", data);
		model.addAttribute("links", links);
		model.addAttribute("total", total);
		return "front/tags";
	}
	/**
	 * 通过id查询标签
	 * @param tag
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryById")
	public String queryById(Tag tag,Model model) {
		tag = tagService.queryById(tag);
		model.addAttribute("tag", tag);
		return "back/tag-edit";
	}
	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		tagService.delete(id);
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
		tagService.deleteAll(idArray);
	}
	/**
	 * 添加标签
	 * @param tag
	 */
	@RequestMapping("/add")
	@ResponseBody
	public void add(Tag tag) {
		tagService.add(tag);
	}
	/**
	 * 更新标签
	 * @param tag
	 */
	@RequestMapping("/update")
	@ResponseBody
	public void update(Tag tag) {
		tagService.update(tag);
	}

}
