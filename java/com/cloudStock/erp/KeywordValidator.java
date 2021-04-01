package com.cloudStock.erp;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
// KeywordDTO 객체에 저장된 데이터의 유효성 체크할 KeywordValidator 클래스 선언하기
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
public class KeywordValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return KeywordDTO.class.isAssignableFrom(arg0);  
	}
	
	@Override
	public void validate(
		Object obj          // DTO 객체 저장 매개변수
		, Errors errors     // 유효성 검사 시 발생하는 에러를 관리하는 Errors 객체 저장 매개변수
	){
		
		try {
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// 유효성 체크할 DTO 객체 얻기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnna
			KeywordDTO dto = (KeywordDTO)obj;

			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			//		KeywordDTO 객체의 속성변수명 writer 이 비거나 공백으로 구성되어 있으면
			//		경고 메시지를 Errors 객체에 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "key_name"                   // KeywordDTO 객체의 속성변수명
				, "제목 입력요망"        // KeywordDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// KeywordDTO 객체의 속성변수명 "key_name" 저장된 데이터의 길이가 10자 보다 크면
			// Errors 객체에 속성변수명 "key_name" 과 경고 메시지 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			String key_name = dto.getKey_name();
			if( key_name!=null && key_name.length()>30 ) {
				errors.rejectValue( "key_name",	"제목은 30자이하 입니다.");
			}


			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			//		KeywordDTO 객체의 속성변수명 key_content 이 비거나 공백으로 구성되어 있으면
			//		경고 메시지를 Errors 객체에 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "key_content"                   // KeywordDTO 객체의 속성변수명
				, "내용 입력요망"         // KeywordDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// KeywordDTO 객체의 속성변수명 "key_content" 저장된 데이터의 길이가 30자 보다 크면
			// Errors 객체에 속성변수명 "key_content" 과 경고 메시지 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			String key_content = dto.getKey_content();
			if( key_content!=null && key_content.length() >3000) {
				errors.rejectValue("key_content", "내용은 3000자이하 입니다.");
			}

		}catch(Exception ex) {
			System.out.println( "KeywordValidator.validate 메소드 실행 시 예외발생!" );
		}
	}
}
  
