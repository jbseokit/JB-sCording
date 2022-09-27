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
        V_ORIGINAL_RAW RAW(130); -- 암호화전 데이타
        V_KEY_DATA_RAW RAW(64); -- 키 값
        ENCRYTED_RAW RAW(320); -- 암호화된 데이타
        CONVERTED_STRING VARCHAR2(320); -- 형변환 데이타
    BEGIN
        V_ORIGINAL_RAW:=UTL_I18N.STRING_TO_RAW(INPUT_STRING,'AL32UTF8'); -- VARCHAR2 -> RAW타입으로 변경(변경이유는아래에..)
        V_KEY_DATA_RAW:=UTL_I18N.STRING_TO_RAW('AKDKEKDKFKGKEKSD','AL32UTF8'); -- 키 값 RAW타입으로 변경.
        ENCRYTED_RAW:=DBMS_CRYPTO.ENCRYPT(SRC=>V_ORIGINAL_RAW,
                                                TYP=>DBMS_CRYPTO.ENCRYPT_AES128+
                                                DBMS_CRYPTO.CHAIN_CBC+
                                                DBMS_CRYPTO.PAD_PKCS5,
                                                KEY=>V_KEY_DATA_RAW);
        CONVERTED_STRING:=UTL_RAW.cast_to_varchar2(utl_encode.base64_encode(ENCRYTED_RAW));
        -- 중요!!! raw타입을 base64_encode()를 이용하여 encoding후 varchar2타입으로 변환해야한다!! 해주지않으면
        -- ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error 이러한 에러를 볼 수 있을것이다.
        RETURN CONVERTED_STRING;
    END ENC_AES;
    /******************************************************************************암호화끝******************************************************************************/
    
    /******************************************************************************복호화******************************************************************************/
    FUNCTION DEC_AES(INPUT_STRING IN VARCHAR2) RETURN VARCHAR2
    IS  
        V_KEY_DATA_RAW RAW(64); -- 키값
        DECRYPTED_RAW RAW(320); -- 복호화값
        CONVERTED_STRING VARCHAR2(320); -- 형변환데이타
    BEGIN
        V_KEY_DATA_RAW:=UTL_I18N.STRING_TO_RAW('AKDKEKDKFKGKEKSD','AL32UTF8');
        DECRYPTED_RAW :=DBMS_CRYPTO.DECRYPT(SRC=>utl_encode.base64_decode(utl_raw.cast_to_raw(INPUT_STRING)),
        -- 중요!!! varchar2타입의 데이타를 raw타입으로 변환 후 decoding해야한다!! 해주지않으면
        -- ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error 이러한 에러를 볼 수 있을것이다.
                                                TYP=>DBMS_CRYPTO.ENCRYPT_AES128+
                                                DBMS_CRYPTO.CHAIN_CBC+
                                                DBMS_CRYPTO.PAD_PKCS5,
                                                KEY=>V_KEY_DATA_RAW);
        CONVERTED_STRING:=UTL_I18N.RAW_TO_CHAR(DECRYPTED_RAW,'AL32UTF8'); -- RAW -> CHAR타입으로 변환하여 RETURN
        RETURN CONVERTED_STRING;
    END DEC_AES;
/******************************************************************************복호화끝******************************************************************************/
END ENCRYPTION_AES;
/

SELECT ENCRYPTION_AES.ENC_AES('010-6678-2273') from tb_mbr;
select idx, mbr_nm, mbr_phone from tb_mbr;
select encryption_aes.dec_aes('abYaPXP0QBjqZ1cfJ7vVVQ==') from tb_mbr;

insert into tb_mbr (
    idx, mbr_sn, mbr_nm, mbr_enm,
    mbr_tel, mbr_phone, mbr_em,
    mbr_addr_bx, mbr_addr_post,
    mbr_dep_cd, mbr_hired_d,
    mbr_id, mbr_pw, mbr_cls_cd,
    rgtr_id, rgtr_dt) values 
    (seq_mbr_idx.nextval, '20200907'||seq_mbr_sn.nextval, '오종환', 'OhJongHwan',
    '7400', ENCRYPTION_AES.ENC_AES('010-6678-2273'), 'ojh22@naver.com', 
    '서울특별시 서초구 논현로27길 29(양재동, 경희빌딩)', '137-890',
    'GENAFF', '2020/09/07', 
    'dhwhdghks', 'whdghks4268', 'GAAM01',
    'administrator', '2020/09/05'
    );
    
    select encryption_aes.dec_aes ( ENCRYPTION_AES.ENC_AES('010-6678-2273') ) from tb_mbr where idx=4;


