package com.YYS.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.YYS.bean.User;
import com.YYS.dao.UserMapper;

/**
 * 测试dao层
 * @author Lenovo
 *推荐Spring的单元测试,可以自动注入组件
 *1.导入SpringTest模块
 *2.ContextConfiguration指定配置文件位置
 *3.直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	UserMapper userMapper;
	
//	@Autowired
//	SqlSession sqlsession;
	/**
	 * 测试DepartmentMapper
	 */
	@Test
	public void testCRUD() {
//		//创建SpringIOC容器
//		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//		//从容器中获取mapper
//		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
		System.out.println(userMapper);
		
		
//		User user =new User(1,"张三","123456",12345678,"123456@qq.com","123",null);
//		User user1 =new User(2,"张三","123456",12345678,"123456@qq.com","123",null);
//		User user2 =new User(3,"张三","123456",12345678,"123456@qq.com","123",null);
//		userMapper.insertSelective(user);
//		userMapper.insertSelective(user1);
//		userMapper.insertSelective(user2);
		//userMapper.deleteByPrimaryKey(1);
		List<User> uList = userMapper.selectByExample(null);
		for (User user : uList) {
			System.out.println(user);
		}
		System.out.println("1");
		//批量插入多个员工;可以使用批量操作的sqlSession
//		userMapper mapper = sqlSession.getMapper(userMapper.class);
//		for (int i = 0; i <1000; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Emplovee(null,uid,"M",uid+"@qq.com",1));
//		}
//		System.out.println("批量完成");
		
	}
	
}
