package jdbc.dao.impl;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class SpringTestDao {

	
	public int sum(int a, int b){
		return a + b;
	}
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		SpringTestDao springTestDao = (SpringTestDao) ac.getBean("springTestDao");
		System.out.println(springTestDao.sum(3, 5));
	}
}
