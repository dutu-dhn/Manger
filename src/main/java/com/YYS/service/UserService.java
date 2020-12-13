package com.YYS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.YYS.bean.User;
import com.YYS.bean.UserExample;
import com.YYS.bean.UserExample.Criteria;
import com.YYS.dao.UserMapper;
@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	
	/**
	 * 获取所有用户数据用来显示
	 * @return
	 */
	public List<User> showUsers(){
		return userMapper.selectByExample(null);
	}
	
	/**
	 * 通过id查询用户信息
	 * @param id
	 * @return
	 */
	public User getUser(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public void updUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	public boolean checkUser(String uname) {
		UserExample example =new UserExample();
	    Criteria criteria =  example.createCriteria();
		criteria.andUnameEqualTo(uname);
		long count = userMapper.countByExample(example);
		
		return count==0;
	}

	/**删除
	 * @param id
	 */
	public void delUser(Integer id) {
		userMapper.deleteByPrimaryKey(id);
	}

	public void saveUser(User user) {
		userMapper.insertSelective(user);
		
	}

	public User checkMLogin(User user) {
		return userMapper.selectByUsernamePassword(user);
	}
}
