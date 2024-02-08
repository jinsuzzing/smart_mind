package com.sm.database;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/sm/database/mybatis-config_xml.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// sqlSessionFactory라는 객체를 리턴해주는 메소드
	// sqlSessionFactory == connection pool
	// sqlSession == Connection
	
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
	
}


