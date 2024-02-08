package com.sm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok 라이브러리 : Class의 기본 메소드(생성자, getter/setter) 자동완성

@Data // 기본 메소드 자동완성(getter, setter, toString)
@AllArgsConstructor // 모든 필드를 초기화 하는 생성자 자동완성 
@NoArgsConstructor // 기본 생성자 : 기본 생성자는 반드시 있어야 한다.

public class MemberDTO {
	
//	반드시 테이블의 컬럼명과 필드 변수명이 같아야한다.
	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_birthdate;
	private String mem_gender;
	private String mem_type;
	private String mem_joined_at;

}
