package com.sm.model;

import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sm.database.SqlSessionManager;


public class DAO {

	// 1) SqlSession을 가져올 수 있는 SqulSessionFactory 생성
	SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberDTO dto) {
		// 1) 연결객체(sqlsession, connection) 빌려오기
		SqlSession sqlSession = factory.openSession();
		// 2) 연결객체를 사용해서 sql 구문을 실행
		//	  sql구문 : MemberMapper.xml 파일 안에 있음
		int row = sqlSession.insert("join", dto);
		// 3) 연결객체 반납
		sqlSession.close();
		System.out.println("DAO join메소드 : "+row);
		return row;
	}
	
	// 로그인 메소드
	public MemberDTO login(MemberDTO dto) {
		// 1. 연결 객체 빌려오기
		SqlSession sqlSession = factory.openSession();
		// 2. 연결객체 사용해서 sql 구문 실행
		// sql구문 --> mapper.xml
		MemberDTO result = sqlSession.selectOne("login", dto);
		// 3. 연결객체 반납
		sqlSession.close();
		return result;
	}
	
	// 전체 회원 조회 메소드
	public List<MemberDTO> selectAll() {
		// 1. splsession 빌려오기
		SqlSession sqlSession = factory.openSession();
		// 2. sqlsession 사용해서 sql 쿼리문 실행
		//	 쿼리문 --> mapper.xml
		List<MemberDTO> resultList = sqlSession.selectList("selectAll");
		// MemberDTO --> 한명에 대한 정보를 표현 할 수 있는 type
		// 여러명의 정보를 하나로 묶어서 표현해야 함.
		// 1) 객체 배열 2) ArrayList
		// : 크기가 가변적인 ArrayList 사용했었음
		// : ArrayList의 부모 클라스 격인 List 형태로 리턴을 받아옴!
		
		// 3. 연결객체 반납
		sqlSession.close();
		// 4. 조회한 결과값 반환
		return resultList;
	}
	
	public int update (MemberDTO dto) {
		
		// 1. 연결 객체 불러오기
		SqlSession sqlSession = factory.openSession(true);
		
		// 2. sql쿼리문 실행
		int row = sqlSession.update("update", dto);
		
		// 3. 연결 객체 반납
		sqlSession.close();
		
		// 4. 실행결과 리턴해주기
		return row;
		
		
	}
	

}
