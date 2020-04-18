package blog.xzbk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import blog.xzbk.entity.Page;
import blog.xzbk.entity.PageMsg;
import blog.xzbk.entity.Link;
import blog.xzbk.service.LinkService;
import blog.xzbk.utils.ParamsUtil;

@Controller
@RequestMapping("/link")
public class LinkController {
	@Resource
	private LinkService linkService;

	/**
	 * 后台分页查询信息
	 * @param pageMsg
	 * @param model
	 * @return
	 */
	@RequestMapping("/backQueryAll")
	public String backQueryAll(PageMsg pageMsg,Model model) {
		Page<Link> data = linkService.queryPage(pageMsg);
		int totalPage = data.getTotalPage();
		model.addAttribute("data", data);
		model.addAttribute("totalPage", totalPage);
		if(pageMsg.getKey()!=null&&!"".equals(pageMsg.getKey())) {
			model.addAttribute("key", pageMsg.getKey());
		}
		return "back/link-list";
	}
	/**
	 * 前台查询所有
	 * @param pageMsg
	 * @param model
	 * @return
	 */
	@RequestMapping("/frontQueryAll")
	public String frontQueryAll(PageMsg pageMsg,Model model) {
		Page<Link> data = linkService.queryPage(pageMsg);
		int total = linkService.totalRows(pageMsg.getUid());
		model.addAttribute("data", data);
		model.addAttribute("total", total);
		return "front/links";
	}
	/**
	 * 通过id查询
	 * @param Link
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryById")
	public String queryById(Link link,Model model) {
		link = linkService.queryById(link);
		model.addAttribute("link", link);
		return "back/link-edit";
	}
	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		linkService.delete(id);
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
		linkService.deleteAll(idArray);
	}
	/**
	 * 添加标签
	 * @param link
	 */
	@RequestMapping("/add")
	@ResponseBody
	public void add(Link link) {
		linkService.add(link);
	}
	/**
	 * 更新标签
	 * @param link
	 */
	@RequestMapping("/update")
	@ResponseBody
	public void update(Link link) {
		linkService.update(link);
	}

}
