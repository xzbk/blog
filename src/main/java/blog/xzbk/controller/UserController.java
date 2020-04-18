package blog.xzbk.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import blog.xzbk.entity.UpHeaderMsg;
import blog.xzbk.entity.User;
import blog.xzbk.service.UserService;
import blog.xzbk.utils.FileUploadUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	/**
	 * 图片上传
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	@ResponseBody
	public UpHeaderMsg upload(MultipartFile file, User user ,HttpServletRequest request ) {
		String path = request.getServletContext().getRealPath("/upload");
		// 文件上传
		String src = FileUploadUtil.upload(path + "/" + user.getId() + "/header/", file);
		Map<String,String> data = new HashMap<String,String>();
		data.put("src", "/blog/"+src);
		//更新用户头像
		user.setHeader(src);
		userService.update(user);
		user = userService.queryById(user.getId());
		request.getSession().setAttribute("user", user);
		return new UpHeaderMsg(0, "", data);
	}
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request) {
		user = userService.login(user);
		if(user!=null) {
			request.getSession().setAttribute("user", user);
			return "redirect:/article/frontQueryAll?uid="+user.getId();
		}else {
			request.getSession().setAttribute("msg", "登录失败,请重试");
			return "back/error";
		}
	}
	/**
	 * 用户退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "back/login";
	}
	/**
	 * 查询用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping("/queryById")
	public String queryById(int id) {
		User user = userService.queryById(id);
		return "back/index";
	}
	
	/**
	 * 查询用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping("/update")
	public String queryById(User user,HttpSession session) {
		userService.update(user);
		user = userService.queryById(user.getId());
		session.setAttribute("user", user);
		return "back/info";
	}

}
