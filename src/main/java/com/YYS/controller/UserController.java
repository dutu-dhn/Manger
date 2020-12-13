package com.YYS.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.YYS.bean.Msg;
import com.YYS.bean.User;
import com.YYS.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	/**跳转到登录页面
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView ML() {
			return new ModelAndView("redirect:/MLogin");
	}
	/**
	 * 管理员登录
	 * @param user
	 * @return
	 */
	@RequestMapping("/MLogin")
	public ModelAndView MLogin(User user,HttpServletRequest req) {
		User userinfo= userService.checkMLogin(user);

		if (userinfo!=null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowdate = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
			userinfo.setLogintime(nowdate);
			userService.updUser(userinfo);
			
			HttpSession session = req.getSession();
			session.setAttribute("user", userinfo);
			return new ModelAndView("redirect:/main");
		}else {
			return new ModelAndView("redirect:/MLogin.jsp");
		}
	}
	/**跳转到主页面
	 * @return
	 */
	@RequestMapping("/main")
	public String main(HttpServletRequest req) {
		//判断是否有session,防止通过控制器进入到主页面
		HttpSession session = req.getSession();
		
		if (session.getAttribute("user")!=null) {
			return "index";
		}else {
			return "redirect:/MLogin";
		}
		 
	}
	/**退出登录,销毁session
	 * @param req
	 * @return
	 */
	@RequestMapping("/exit")
	public ModelAndView exit(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return new ModelAndView("redirect:/MLogin.jsp");
	}
	@RequestMapping("/usershow")
	public String usershow(HttpServletRequest req) {
		
		return "usershow";
	}
	@RequestMapping("/usershow2")
	public String usershow2(HttpServletRequest req) {
		
		return "usershow2";
	}
	
	/**
	 * 展示用户信息
	 * 
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/show")
	public Msg show(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		PageHelper.startPage(pn, 8);

		List<User> list = userService.showUsers();

		PageInfo pageInfo = new PageInfo(list);
		return Msg.success().add("pageInfo", pageInfo);
	}

	/**
	 * 编辑模态框显示信息获取单个用户信息
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public Msg getUser(@PathVariable("id") Integer id) {
		User user = userService.getUser(id);
		return Msg.success().add("user", user);
	}
	/**
	 * 修改
	 * @param user
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public Msg updUser(User user, HttpServletRequest request) {
		userService.updUser(user);
		return Msg.success();
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public Msg delUser(@PathVariable("id") Integer id) {
		userService.delUser(id);
		return Msg.success();
	}
	/**
	 * 新增
	 * @param user
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public Msg saveUser(User user, HttpServletRequest request) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowdate = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		user.setRegtime(nowdate);
		
	    long date=System.currentTimeMillis(); String datesString = ""+date; 
	    String datesStringd = datesString.substring(6, datesString.length()); 
	    int id =Integer.parseInt(datesStringd);

		user.setId(id);
		userService.saveUser(user);
		return Msg.success();
	}

	/**
	 * 检查用户名
	 * @param uname
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(@RequestParam("uname") String uname) {
		// 先判断用户名是否合法
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,8})";
		if (!uname.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名格式不对");
		}
		boolean b = userService.checkUser(uname);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名已存在");
		}
	}

	/*
	 * @RequestMapping("/add") public String add() { return "add-user"; }
	 */
	@ResponseBody
	@RequestMapping("/yjian")
	private void publi() {
		// TODO Auto-generated method stub

	}
}
