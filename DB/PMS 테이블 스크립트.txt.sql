--인적자원관리 ********************************************************************************************************************************************************

-- tb_mbr 시작------------------------------------------------------------------------------------------------------------------------------
-- DBMS_CRYPTO 권한 부여
conn sys as sysdba;
grant execute on dbms_crypto to hr;

CREATE OR REPLACE PACKAGE HR.ENCRYPTION_AES
IS
    FUNCTION ENC_AES (INPUT_STRING IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION DEC_AES (INPUT_STRING IN VARCHAR2) RETURN VARCHAR2;
END ENCRYPTION_AES;
/

CREATE OR REPLACE PACKAGE BODY HR.ENCRYPTION_AES
IS
    FUNCTION ENC_AES(INPUT_STRING IN VARCHAR2) RETURN VARCHAR2
    IS
        V_ORIGINAL_RAW RAW(130); -- 암호화 전 데이터
        V_KEY_DATA_RAW RAW(64); -- 키 값
        ENCRYTED_RAW RAW(320); -- 암호화 후 데이터
        CONVERTED_STRING VARCHAR2(320); -- 형변환 데이터
    BEGIN
        V_ORIGINAL_RAW:=UTL_I18N.STRING_TO_RAW(INPUT_STRING,'AL32UTF8'); -- VARCHAR2 -> RAW 형변환
        V_KEY_DATA_RAW:=UTL_I18N.STRING_TO_RAW('AKDKEKDKFKGKEKSD','AL32UTF8'); -- 키값 RAW 형변환
        ENCRYTED_RAW:=DBMS_CRYPTO.ENCRYPT(SRC=>V_ORIGINAL_RAW,
                                                TYP=>DBMS_CRYPTO.ENCRYPT_AES128+
                                                DBMS_CRYPTO.CHAIN_CBC+
                                                DBMS_CRYPTO.PAD_PKCS5,
                                                KEY=>V_KEY_DATA_RAW);
        CONVERTED_STRING:=UTL_RAW.cast_to_varchar2(utl_encode.base64_encode(ENCRYTED_RAW));
        -- RAW 타입 -> BASE64_ENCODE() -> (ENCODING) -> VARCHAR2 형변환
        -- VARCHAR2 형변환 수행 X -> ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error 발생
        RETURN CONVERTED_STRING;
    END ENC_AES;
    /******************************************************************************암호화 완료******************************************************************************/
    
    /******************************************************************************복호화 시작******************************************************************************/
    FUNCTION DEC_AES(INPUT_STRING IN VARCHAR2) RETURN VARCHAR2
    IS  
        V_KEY_DATA_RAW RAW(64); -- 키값
        DECRYPTED_RAW RAW(320); -- 복호화값
        CONVERTED_STRING VARCHAR2(320); -- 형변환 데이터
    BEGIN
        V_KEY_DATA_RAW:=UTL_I18N.STRING_TO_RAW('AKDKEKDKFKGKEKSD','AL32UTF8');
        DECRYPTED_RAW :=DBMS_CRYPTO.DECRYPT(SRC=>utl_encode.base64_decode(utl_raw.cast_to_raw(INPUT_STRING)),
        -- VARCHAR2 -> RAW 형변환 -> (DECODING)
        -- RAW 형변환 수행 X -> ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error 발생
                                                TYP=>DBMS_CRYPTO.ENCRYPT_AES128+
                                                DBMS_CRYPTO.CHAIN_CBC+
                                                DBMS_CRYPTO.PAD_PKCS5,
                                                KEY=>V_KEY_DATA_RAW);
        CONVERTED_STRING:=UTL_I18N.RAW_TO_CHAR(DECRYPTED_RAW,'AL32UTF8'); -- RAW -> VARCHAR2 형변환 -> RETURN
        RETURN CONVERTED_STRING;
    END DEC_AES;
/******************************************************************************복호화 완료******************************************************************************/
END ENCRYPTION_AES;
/

-- tb_mbr 시작------------------------------------------------------------------------------------------------------------------------------
--시퀀스
create sequence seq_mbr_idx;
create sequence seq_mbr_sn start with 100;

--테이블
create table tb_mbr (
    idx number not null,
    mbr_sn varchar2(20) not null,
    mbr_nm varchar2(50) not null,
    mbr_tel varchar2(200), 
    mbr_phone varchar2(200) not null,
    mbr_em varchar2(200),
    mbr_addr_bx varchar2(200) not null,
    mbr_addr_dtl varchar2(200),
    mbr_addr_post varchar2(10) not null,
    mbr_dep_cd varchar2(6) not null,
    mbr_hired_d date,
    mbr_id varchar2(50) not null,
    mbr_pw varchar2(200) not null,
    mbr_cls_cd varchar2(6),
    rgtr_id varchar2(50),
    rgtr_dt date,
    mdfr_id varchar2(50),
    mdfr_dt date
    );

--테이블 제약조건
alter table tb_mbr add constraint tb_mbr_pk primary key (idx, mbr_nm);
alter table tb_mbr add constraint tb_mbr_sn_uk unique(mbr_sn);

--데이터삽입
insert into tb_mbr values (seq_mbr_idx.nextval, '20200907'||seq_mbr_sn.nextval, '오종환', '7400', ENCRYPTION_AES.ENC_AES('010-6678-2273'), 'ojh22@naver.com', 
                           '서울특별시 서초구 논현로27길 29', ENCRYPTION_AES.ENC_AES('양재동, 경희빌딩'), '13789', 
                           'GENAFF', '2020/09/07', 'testid', ENCRYPTION_AES.ENC_AES('whdghks4268'), 'GAAM01', 'administrator', '2020/09/05', null, null);
insert into tb_mbr values (seq_mbr_idx.nextval, '20200908'||seq_mbr_sn.nextval, '테스트1', '7400', ENCRYPTION_AES.ENC_AES('010-0000-2273'), 'test1@naver.com', 
                           '대구광역시 북구', ENCRYPTION_AES.ENC_AES('침산동'), '00089', 
                           'GENAFF', '2020/09/08', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트2', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test2@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트3', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test3@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트4', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test4@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);                             
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트5', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test5@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트6', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test6@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트7', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test7@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트8', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test8@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트9', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test9@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);                             
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트10', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test10@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트11', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test11@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);                             
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트12', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test12@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);  
insert into tb_mbr values (seq_mbr_idx.nextval, '20200909'||seq_mbr_sn.nextval, '테스트13', '7400', ENCRYPTION_AES.ENC_AES('010-0000-0000'), 'test13@naver.com', 
                           '대구광역시 남구', ENCRYPTION_AES.ENC_AES('봉덕동'), '13700', 
                           'GENAFF', '2020/09/09', 'testid', ENCRYPTION_AES.ENC_AES('1234'), 'GAAM01', 'administrator', '2020/09/05', null, null);                             
--데이터조회
select * from tb_mbr;
delete from tb_mbr;

commit;
show user;

 -- tb_atd 시작------------------------------------------------------------------------------------------------------------------------------
-- idx 및 사번용 시퀀스
create sequence seq_atd_idx
start with 1
increment by 1;

-- 출퇴근 시간을 위한 날짜 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy/MM/dd HH24:MI:SS';

create sequence seq_atd_sn
start with 300
increment by 1;

create table tb_atd (
    idx         number      not null,
    atd_nm      varchar2(50) not null,
    atd_sn      varchar2(20),
    atd_gw      date,
    atd_lw      date,
    atd_bt      char(1),
    atd_bt_dt   varchar2(25),
    atd_bt_ct   varchar2(10),
    atd_dp      char(1),
    atd_dp_dt   varchar2(25),
    atd_dp_ct   varchar2(10),
    spare1       varchar2(255),
    spare2       varchar2(255),
    spare3       varchar2(255),
    rgtr_id      varchar2(64),
    rgtr_dt      date,
    mdfr_id      varchar2(64),
    mdfr_dt      date
);

-- pk
alter table tb_atd
add constraint tb_atd_pk primary key(idx);

-- 시퀀스 초기화용
drop sequence seq_atd_idx;
drop sequence seq_atd_sn;


-- 매퍼 테스트용 데이터 삽입 (사번은 || CONCAT 사용)
insert into tb_atd values
(seq_atd_idx.nextval, 'test1', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test2', '20200418'||seq_atd_sn.nextval, sysdate, sysdate, 'Y', '2022/09/18~2022/10/21', '대구', 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test3', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test4', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test5', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test6', '20200418'||seq_atd_sn.nextval, sysdate, sysdate, 'Y', '2022/09/18~2022/10/21', '부산', 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test7', '20200418'||seq_atd_sn.nextval, sysdate, sysdate, 'Y', '2022/09/30~2022/10/3', '대구', 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test8', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test9', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test10', '20220918'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test11', '20200418'||seq_atd_sn.nextval, sysdate, sysdate, 'Y', '2022/09/30~2022/10/3', '대구', 'N', null, null, null, null, null, 'admin', sysdate, null, null);
insert into tb_atd values
(seq_atd_idx.nextval, 'test12', '20200418'||seq_atd_sn.nextval, sysdate, sysdate, 'N', null, null, 'Y', '2022/03/20~2023/03/21', null, null, null, null, 'admin', sysdate, null, null);


-- 테이블 확인 및 초기화용
select * from tb_atd;
delete from tb_atd;

-- COMMIT 필수
commit;

 -- tb_vac 시작------------------------------------------------------------------------------------------------------------------------------
-- idx 및 사번용 시퀀스
create sequence seq_vac_idx
start with 1
increment by 1;

create sequence seq_vac_sn
start with 300
increment by 1;

create table tb_vac (
    idx          number      not null,
    vac_nm       varchar2(50) not null,
    vac_sn       varchar2(20),
    vac_str      date,
    vac_end      date,
    vac_type     varchar2(10),
    vac_cnt      number,
    spare1       varchar2(255),
    spare2       varchar2(255),
    spare3       varchar2(255),
    spare4       varchar2(255),
    rgtr_id      varchar2(64),
    rgtr_dt      date,
    mdfr_id      varchar2(64),
    mdfr_dt      date
);

-- pk
alter table tb_vac
add constraint tb_vac_pk primary key(idx);

-- 출퇴근 시간을 위한 날짜 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy/MM/dd HH24:MI:SS';

-- 매퍼 테스트용 데이터 삽입 (사번은 || CONCAT 사용)
insert into tb_vac values
(seq_atd_idx.nextval, 'test1', '20220918'||seq_vac_sn.nextval, '20220920', '20220923', '연차', 4, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test2', '20220223'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test3', '20220918'||seq_vac_sn.nextval, '20220920', '20220923', '연차', 4, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test4', '20220708'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test5', '20220918'||seq_vac_sn.nextval, '20220920', '20220923', '연차', 4, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test6', '20220223'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test7', '20220918'||seq_vac_sn.nextval, '20220920', '20220923', '연차', 4, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test8', '20220708'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test9', '20220918'||seq_vac_sn.nextval, '20221020', '20221021', '연차', 2, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test10', '20220223'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test11', '20220918'||seq_vac_sn.nextval, '20220921', '20220923', '공가', 3, null, null, null, null, 'admin', sysdate, null, null);

insert into tb_vac values
(seq_atd_idx.nextval, 'test12', '20220708'||seq_vac_sn.nextval, null, null, null, null, null, null, null, null, 'admin', sysdate, null, null);

-- 테이블 확인 및 초기화용
select * from tb_vac;
delete from tb_vac;

-- COMMIT 필수
commit;

--물적자원관리 ********************************************************************************************************************************************************

--장비-----------------------------------------
--테이블 생성
create table tb_eqm(
    idx number not null,
    eqm_nm varchar2(100) not null,
    eqm_use_dep varchar2(50) not null,
    eqm_man_dep varchar2(50) not null,
    eqm_num varchar2(100),
    eqm_com varchar2(50),
    eqm_buy_date date,
    eqm_ins_date date,
    eqm_tel varchar2(20),
    eqm_rep_req_date date,
    eqm_rep_com_date date,
    eqm_amount number,
    eqm_price number,
    spare1 varchar2(255),
    spare2 varchar2(255),
    spare3 varchar2(255)
);
-- 테이블 조회, 삭제
drop table tb_eqm;
select * from tb_eqm;
-- PK 등록
alter table tb_eqm
add constraint tb_eqm_pk primary key(idx);
-- 시퀀스 생성, 삭제
drop sequence seq_eqm_idx;
create sequence seq_eqm_idx
start with 1
increment by 1;
--DB 데이터 삽입 코드 
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '컴퓨터', '총무', '전산','sjt-17865','LG',sysdate,sysdate,'070-1234-1234', '2022-04-06','2022-05-11',7,14000000,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '노트북', '총무', '전산','NT900X5N-X58','SAMSUNG',sysdate,sysdate,'02-789-1234', '2022-05-03','2022-06-12',5,907100,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '모니터', '인사', '전산','G25-10,65FEGAC2KR','DELL',sysdate,sysdate,'070-1234-1234', '','',6,6045000,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '키보드', '기획', '전산','vsf-17865','',sysdate,sysdate,'053-668-4567', '','',5,250000,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '책장', '개발1', '자재','qrwer-17865','iloom',sysdate,sysdate,'053-259-5942', '2022-09-06','2022-09-08',1,700000,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '의자', '개발2', '자재','dfFD56','desker',sysdate,sysdate,'010-2562-0080', '2022-09-27','',3,3789000,'','','');
insert into tb_eqm VALUES(seq_eqm_idx.nextval, '책상', '기획', '자재','dfd5fe','LG',sysdate,sysdate,'010-3698-1754', '','',5,5580000,'','','');

--데이터 대량 삽입, 확인 
insert into tb_eqm (IDX, eqm_nm, eqm_use_dep, eqm_man_dep, eqm_num, eqm_com, eqm_buy_date, eqm_ins_date, eqm_tel, eqm_rep_req_date, eqm_rep_com_date, eqm_amount, eqm_price)
(select SEQ_EQM_IDX.NEXTVAL, eqm_nm, eqm_use_dep, eqm_man_dep, eqm_num, eqm_com, eqm_buy_date, eqm_ins_date, eqm_tel, eqm_rep_req_date, eqm_rep_com_date, eqm_amount, eqm_price from TB_EQM);

select count(*) from tb_EQM;


commit;


--S/W-----------------------------------------------------------------------------------------
--테이블 생성
create table tb_sw(
    idx number not null,
    sw_nm varchar2(100) not null,
    sw_use_dep varchar2(50) not null,
    sw_man_dep varchar2(50) not null,
    sw_num varchar2(100),
    sw_com varchar2(50),
    sw_buy_date date,
    sw_ins_date date,
    sw_renew_date date,
    sw_tel varchar2(20),
    sw_amount number,
    sw_price number,
    spare1 varchar2(255),
    spare2 varchar2(255),
    spare3 varchar2(255)
);
-- 테이블 조회, 삭제
drop table tb_sw;
select * from tb_sw;
-- PK값 등록
alter table tb_sw
add constraint tb_sw_pk primary key(idx);
-- 시퀀스 생성, 삭제
drop sequence seq_sw_idx;
create sequence seq_sw_idx
start with 1
increment by 1;

--DB 데이터 삽입 
insert into tb_sw values(seq_sw_idx.nextval, 'windows10', '회계','전산','s7gh-k7h3-t2y9-y9p6','microsoft','2021-05-04','2021-05-04','2023-09-15','070-0000-0000',1 ,250000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'windows10', '영업','전산','T87-KE7-008-EY0','microsoft','2023-09-15','2023-09-15','2024-09-15','070-0000-0000', 1,300000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'intellij', '인재','지원','M2K345','JetBrains','2021-06-03','2021-06-03','2022-07-03','070-846-8888', 1,600000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'intellij', '전산','지원','INF2546','JetBrains','2022-05-04','2022-05-04','2025-09-06','070-846-8888', 1,600000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'SqlDeveloper', '회계','전산','k7h3','ORACLE','2022-09-27','','2023-09-15','070-0000-0000', 3,300000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'Adobe Premiere Pro', '디자인','지원','SGR7805FE3','Adobe','2021-05-04','2023-09-15','','', 1,1520000,'','','');
insert into tb_sw values(seq_sw_idx.nextval, 'VisualStudioCode', '디자인','지원','s7gh-k7h3-t2y9-y9p6','microsoft','2021-05-04','2023-09-15','','', 2,800000,'','','');

-- 데이터 대량 삽입, 조회
insert into tb_SW (IDX, sw_nm,sw_use_dep,sw_man_dep,sw_num,sw_com,sw_buy_date,sw_ins_date,sw_renew_date,sw_tel,sw_amount,sw_price)
(select SEQ_SW_IDX.NEXTVAL, sw_nm,sw_use_dep,sw_man_dep,sw_num,sw_com,sw_buy_date,sw_ins_date,sw_renew_date,sw_tel,sw_amount,sw_price from TB_SW);

select count(*) from tb_SW;

commit;

            
--시설-------------------------------------------------------------------------------
--테이블 생성
create table tb_fct(
    idx number not null,
    fct_nm VARCHAR(20),
    fct_user_sn VARCHAR(20),
    fct_str date,
    fct_end date,
    spare1 varchar2(255),
    spare2 varchar2(255),
    spare3 varchar2(255)
 );
--테이블 조회, 삭제
drop table tb_fct;
select * from tb_fct;
-- PK값 생성
alter table tb_fct
add constraint tb_fct_pk primary key(idx);
--시퀀스 생성, 삭제
DROP SEQUENCE SEQ_FCT_IDX;
create sequence seq_fct_idx
start with 1
increment by 1;

--DB 데이터 삽입
insert into tb_fct VALUES(seq_fct_idx.nextval, '회의실1', 'QEX789', '2022/09/20','2022/09/20','','','');
insert into tb_fct VALUES(seq_fct_idx.nextval, '세미나실1', 'QEX789', '2022/09/23','2022/09/23','','','');
insert into tb_fct VALUES(seq_fct_idx.nextval, '회의실2', 'QEW500', '2022/07/20','2022/07/20','','','');
insert into tb_fct VALUES(seq_fct_idx.nextval, '회의실2', 'MER258', '2022/09/21','2022/09/21','','','');
insert into tb_fct VALUES(seq_fct_idx.nextval, '세미나실2', 'BRW023', '2022/08/19','2022/08/20','','','');
insert into tb_fct VALUES(seq_fct_idx.nextval, '접견실', 'BRW011', '2022/08/12','2022/08/13','','','');
--대량 삽입, 조회
insert into tb_FCT (IDX, FCT_NM, FCT_USER_SN, FCT_STR, FCT_END)
(select SEQ_FCT_IDX.NEXTVAL, FCT_NM, FCT_USER_SN, FCT_STR, FCT_END from TB_FCT);

commit;


--프로젝트 자원 관리 ********************************************************************************************************************************************************

--프로젝트 정보관리 테이블 작성
create table prj_info_tb (
 idx number NOT NULL,
 prjinfo_prjnm varchar(50) not null,
 prjinfo_ef varchar(200),
 prjinfo_cp varchar(100),
 prjinfo_task varchar(200),
 prjinfo_req varchar(200),
 prjinfo_sales varchar(200),
 prjinfo_tool varchar(200),
 prjinfo_cpmanager varchar(30),
 prjinfo_cptel varchar(50),
 prjinfo_cpfax varchar(50)
 );
 

--테이블 삭제 및 조회
DROP TABLE PRJ_INFO_TB;
SELECT * FROM PRJ_INFO_TB;

--프로젝트 정보관리 Primary key 작성
alter table prj_info_tb add constraint TB_PRJINFO_PK
primary key (idx);

--프로젝트 정보관리 IDX 시퀀스 작성
create sequence SEQ_PRJINFO_IDX
start with 1
increment by 1;
--DROP SEQUENCE SEQ_PRJINFO_IDX;

--프로젝트 정보관리 데이터삽입
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjkit','사무작업에 용이함','ETU','PMS제작','편리한 툴 제작','300,000,000','Eclipse','서장훈','053-281-1590','053-109-9090');
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjkit',NULL,'KITE',NULL,NULL,'',NULL,NULL,'010-9090-8080',NULL);
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjkit','새로운 작업에 용이함',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjkit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjetu','기대효과','ETU','수행과제','요청사항','1,200,000,000','eclipse','박지성','053-998-0000','053-104-1390');
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjetu',NULL,NULL,NULL,'요청사항2',NULL,'spring',NULL,NULL,NULL);
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjetu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into prj_info_tb values
(SEQ_PRJINFO_IDX.nextval, 'prjsb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


--데이터 대량 삽입
INSERT INTO PRJ_INFO_TB (IDX, PRJINFO_PRJNM, PRJINFO_EF,PRJINFO_CP,PRJINFO_TASK,PRJINFO_REQ,PRJINFO_SALES,PRJINFO_TOOL,PRJINFO_CPMANAGER,PRJINFO_CPTEL,PRJINFO_CPFAX)
(SELECT SEQ_PRJINFO_IDX.nextval, PRJINFO_PRJNM, PRJINFO_EF,PRJINFO_CP,PRJINFO_TASK,PRJINFO_REQ,PRJINFO_SALES,PRJINFO_TOOL,PRJINFO_CPMANAGER,PRJINFO_CPTEL,PRJINFO_CPFAX FROM PRJ_INFO_TB);

select count(*) from PRJ_INFO_TB;

COMMIT;


--프로젝트 인원관리 테이블 작성
create table prj_mbr_tb(
	idx number not null,
	prjmbr_prjnm varchar(50) not null,
	prjmbr_total number,
	prjmbr_lev varchar(30) not null,
	prjmbr_mbrnm varchar(30) not null,
	prjmbr_mbrtask varchar(30) not null
);

DROP TABLE PRJ_MBR_TB;
SELECT * FROM PRJ_MBR_TB;
 
--프로젝트 인원관리 PRIMARY KEY 작성
alter table prj_mbr_tb add constraint TB_PRJMBR_PK
primary key (idx);

--프로젝트 인원관리 IDX 시퀀스 작성
create sequence SEQ_PRJMBR_IDX
start with 1
increment by 1;

--프로젝트 인원관리 시퀀스 삭제
DROP SEQUENCE SEQ_PRJMBR_IDX;

--프로젝트 인원관리 데이터삽입
insert into prj_mbr_tb values
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀장','손흥민','총괄');
insert into prj_mbr_tb values
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','부팀장','나상호','디자인');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','황의조','디자인');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','정우영','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','황희찬','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','이재성','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','김승규','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjkit','8','팀원','김영권','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','팀장','여준석','총괄');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','부팀장','이승현','디자인');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','팀원','양홍석','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','팀원','이현중','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','팀원','김낙현','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjetu','6','팀원','전성현','제작');

insert into prj_mbr_tb values 
(SEQ_PRJMBR_IDX.nextval, 'prjsb','1','팀장','문성곤','임시');


--프로젝트 인원관리 데이터 대량삽입 쿼리
INSERT INTO PRJ_MBR_TB(IDX,PRJMBR_PRJNM,PRJMBR_TOTAL,PRJMBR_LEV,PRJMBR_MBRNM,PRJMBR_MBRTASK)
(SELECT SEQ_PRJMBR_IDX.nextval,PRJMBR_PRJNM,PRJMBR_TOTAL,PRJMBR_LEV,PRJMBR_MBRNM,PRJMBR_MBRTASK FROM PRJ_MBR_TB);

select count(*) from PRJ_MBR_TB;

COMMIT;


 --프로젝트 일정관리 테이블 작성
create table prj_sche_tb(
	idx number not null,
	prjsche_prjnm varchar(50) not null,
	prjsche_sdate date,
	prjsche_edate date
);
 
--테이블 조회, 삭제
drop table PRJ_SCHE_TB;
select * from PRJ_SCHE_TB; 

--프로젝트 일정관리 PRIMARY KEY 작성
alter table prj_sche_tb add constraint TB_PRJSCHE_PK
primary key (idx);

--시퀀스 초기화용
DROP SEQUENCE SEQ_PRJSCHE_IDX;

--프로젝트 일정관리 IDX 시퀀스 작성
create sequence SEQ_PRJSCHE_IDX
start with 1
increment by 1;

--프로젝트 일정관리 데이터삽입
insert into prj_sche_tb values 
(SEQ_PRJSCHE_IDX.nextval, 'prjkit','2022-09-16','2022-09-28');

insert into prj_sche_tb values 
(SEQ_PRJSCHE_IDX.nextval, 'prjetu','2022-08-10','2022-10-29');

insert into prj_sche_tb values 
(SEQ_PRJSCHE_IDX.nextval, 'prjsb','2022-09-30','2022-12-31');

INSERT INTO PRJ_SCHE_TB(IDX,PRJSCHE_PRJNM,PRJSCHE_SDATE,PRJSCHE_EDATE)
(SELECT SEQ_PRJSCHE_IDX.NEXTVAL,PRJSCHE_PRJNM,PRJSCHE_SDATE,PRJSCHE_EDATE FROM PRJ_SCHE_TB);

select count(*) from PRJ_SCHE_TB;

COMMIT;

--TABLE 데이터 초기화용
TRUNCATE TABLE PRJ_INFO_TB;
TRUNCATE TABLE PRJ_MBR_TB;
TRUNCATE TABLE PRJ_SCHE_TB;


--자유게시판/공지사항/자료실 ********************************************************************************************************************************************************


--DROP TABLE TB_COMMUNITY;
--DROP TABLE TB_POST;
--DROP TABLE TB_REFERENCEROOM;
-- 자유 게시판
CREATE TABLE TB_COMMUNITY(
    IDX NUMBER(20) NOT NULL, -- 인덱스
    CUM_TITLE VARCHAR2(255) NOT NULL, -- 제목
    CUM_CONTENTS VARCHAR2(3000) NOT NULL, -- 내용
    CUM_WRITER VARCHAR2(255) NOT NULL, -- 작성자
    CUM_REGISTER_TIME DATE -- 시간
);
ALTER TABLE TB_COMMUNITY
ADD CONSTRAINT TB_COMMUNITY_PK PRIMARY KEY(IDX);

--공지사항
CREATE TABLE TB_POST(
    IDX NUMBER(20) NOT NULL, --인덱스
    POST_TITLE VARCHAR2(100) NOT NULL, -- 제목
    POST_CONTENT VARCHAR2(3000) NOT NULL, -- 내용
    POST_WRITER  VARCHAR2(20) NOT NULL, -- 작성자
    POST_REGISTER_TIME DATE -- 시간
);
ALTER TABLE TB_POST
ADD CONSTRAINT TB_POST_PK PRIMARY KEY(IDX);


-- idx 및 사번용 시퀀스
CREATE SEQUENCE TB_COMMUNITY_IDX
START WITH 1
INCREMENT BY 1;

-- idx 및 사번용 시퀀스
CREATE SEQUENCE TB_POST_IDX
START WITH 1
INCREMENT BY 1;


-- 시퀀스 초기화용
--DROP SEQUENCE TB_COMMUNITY_IDX;
--DROP SEQUENCE TB_POST_IDX;
--DROP SEQUENCE TB_REFERENCEROOM_IDX;

-- 날짜 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-MM-dd';


--
SELECT * FROM TB_COMMUNITY;
SELECT * FROM TB_POST;
--SELECT * FROM TB_REFERENCEROOM;


DESC TB_COMMUNITY;
DESC TB_POST;

insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'빨간휴지줄까','파란휴지줄까','화장실귀신');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'오늘의 점심은','돈까스','스윙스');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'농구는','역시','마이클조던');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'월드컵','4강신화','안정환');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'정글차이','0킬5데스','야스오');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'바밤바','밤맛나는','바밤바');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'스타크래프트','20년째','초보방');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'우리팀','서폿','애쉬');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'설탕을','싫어해유','백종원');
insert into tb_community (IDX, CUM_TITLE,CUM_CONTENTS,CUM_WRITER) values (TB_COMMUNITY_IDX.NEXTVAL,'동물농장','아저씨는','신동엽');

insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER ) values (TB_POST_IDX.NEXTVAL,'빨간휴지줄까','파란휴지줄까','화장실귀신');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'오늘의 점심은','돈까스','스윙스');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'농구는','역시','마이클조던');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'월드컵','4강신화','안정환');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'정글차이','0킬5데스','야스오');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'바밤바','밤맛이나는','바밤바');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'스타크래프트','테란황제','임요환');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'우리팀','미드','마이');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'겨울에','맛있는','붕어빵');
insert into tb_post (IDX,POST_TITLE,POST_CONTENT,POST_WRITER) values (TB_POST_IDX.NEXTVAL,'시장은','역시국밥','국회의원');

insert into tb_community (IDX, CUM_TITLE, CUM_CONTENTS, CUM_WRITER, CUM_REGISTER_TIME)
(select TB_COMMUNITY_IDX.NEXTVAL, CUM_TITLE, CUM_CONTENTS, CUM_WRITER, SYSDATE from TB_COMMUNITY);

insert into tb_post (IDX, POST_TITLE, POST_CONTENT, POST_WRITER, POST_REGISTER_TIME)
(select TB_POST_IDX.NEXTVAL, POST_TITLE, POST_CONTENT, POST_WRITER, SYSDATE from TB_POST);

COMMIT;

desc tb_mbr;

select count(*) from tb_fct;