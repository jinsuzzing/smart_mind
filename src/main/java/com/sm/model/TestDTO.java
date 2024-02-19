package com.sm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok 라이브러리 : Class의 기본 메소드(생성자, getter/setter) 자동완성

@Data // 기본 메소드 자동완성(getter, setter, toString)
@AllArgsConstructor // 모든 필드를 초기화 하는 생성자 자동완성 
@NoArgsConstructor // 기본 생성자 : 기본 생성자는 반드시 있어야 한다.

public class TestDTO {
    private String memId; // 사용자 ID
    private String testTitle; // 문제 제목
    private String testItem; // 문제 내용
    private String testedAt; // 평가 일자
    private String testScore; // 평가 점수
    private String testPeriod; // 문제 푸는데 걸린 시간
    private String testAnswer; // 문제 정답
    private String memAnswer; // 사용자가 선택한 정답
    private String testCorr; // 정답 여부 ('Y' 또는 'N')
    
}
