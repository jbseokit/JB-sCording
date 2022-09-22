package com.yh2.db.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.yh2.db.model.ResultModel;
import com.yh2.db.model.FraudModel;

@Mapper
public interface DbMapper {
	// 파일 정보 삽입
	@Insert("INSERT INTO FILEINFO VALUES(fseq.nextval, #{fileowner}, #{filename}, #{filetype}, #{filetime})")
	void insertFileinfo(FraudModel fraudmodel);
	
	// 사기여부 결과 삽입
	@Insert("INSERT INTO PREDICT VALUES(pseq.nextval, #{resultcode})")
	void insertPredict(ResultModel resultmodel);
}
