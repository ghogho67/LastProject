select * from not_exists_in_prd_db;



   drop SEQUENCE  "AD_ID"   ;

   drop SEQUENCE  "APP_ID"  ;


   drop SEQUENCE  "ATT_ID"   ;


   drop SEQUENCE  "CAR_ID"  ;


   drop SEQUENCE  "CATE_ID"  ;


   drop SEQUENCE  "CHAT_ID"  ;


   drop SEQUENCE  "CHATTEXT_ID"  ;


   drop SEQUENCE  "CULTURE_ID"  ;


   drop SEQUENCE  "CW_CAREER_ID"   ;


   drop SEQUENCE  "DIS_ID" ;


   drop SEQUENCE  "GPS_ID" ;


   drop SEQUENCE  "HOS_ID" ;


   drop SEQUENCE  "MAT_ID" ;


   drop SEQUENCE  "MEM_DIS_ID"  ;


   drop SEQUENCE  "POST_ID"   ;


   drop SEQUENCE  "QUES_ID"   ;


   drop SEQUENCE  "REP_ATT_ID"   ;


   drop SEQUENCE  "REP_ID"  ;


   drop SEQUENCE  "SER_TYPE_ID"  ;


   drop SEQUENCE  "SUR_PART_ID"  ;


   drop SEQUENCE  "VIDEO_ID"  ;
   
   
   
   

   CREATE SEQUENCE  "AD_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "APP_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 41 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "ATT_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CAR_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 186 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CATE_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CHAT_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CHATTEXT_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CULTURE_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "CW_CAREER_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "DIS_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;

   CREATE SEQUENCE  "GPS_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 41 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "HOS_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "MAT_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "MEM_DIS_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "POST_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 13 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUES_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "REP_ATT_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "REP_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "SER_TYPE_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "SUR_PART_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "VIDEO_ID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;



delete approval  ;

delete attendance ;

delete attachment ;



delete shelter ;



delete reportAttach ;

delete report ;

delete sos ;

delete gps ;


delete video ;


delete reply  ;




delete chatText  ;

delete chat  ;


delete diseaseName ;


delete hospitalType ;


delete serviceType ;

----------------------------------------



delete cardiac ;


delete surveyAnswer ;

delete surveyPart ;

delete question ;


delete memberDisease ;
delete gold ;


delete grade ;


delete lecture ;

delete culture ;

delete cwServiceType ;

delete career  ;

delete hospital ;

delete chatMem ;



delete day  ;

delete schedule ;

delete location   ;

delete survey ;

delete post ;
delete category ;
delete matching  ;
delete member;


Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('dkskqk00','오도아','94/09/22`','F','dkskqk00','010-2114-2539','대전','중구','30585','dkskqk00@naver.ver','0','N',null,null,null,null,null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('aha','대상자','94/09/22','F','1234','010-2222-3333','대전','중구','30585','aha@naver.com','1','N','o','o',null,null,null,null,null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('brown','브라운','19/07/21','M','1234','010-1111-1111','대전','중구','30585','brown@naver.com','1','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('yumi','유미','19/07/21','F','1234','010-1111-1111','대전','중구','30585','yumi@naver.com','1','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('deft','데프트','19/07/21','M','1234','010-1111-1111','대전','중구','30585','deft@naver.com','1','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ruler','룰러','19/07/21','M','1234','010-1111-1111','대전','중구','30585','ruler@naver.com','1','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('cw','요양보호사','19/07/22','F','1234','010-1111-1111','대전','중구','30585','cw@naver.com','1','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ahri','아리','19/07/22','F','1234','010-1111-1111','대전','중구','30585','ahri@naver.com','2','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('sona','소나','19/07/22','F','1234','010-1111-1111','대전','중구','30585','sona@naver.com','2','N','ㅇ','ㅇ','아들','마미',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('jin','진','19/07/22','M','1234','010-1111-1111','대전','중구','30585','jin@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('twich','트위치','19/07/22','M','1234','010-1111-1111','대전','중구','30585','twich@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('heimerdinger','하이머딩거','19/07/22','M','1234','010-1111-1111','대전','중구','30585','heimerdinger@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('anni','애니','19/07/22','F','1234','010-1111-1111','대전','중구','30585','anni@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('jiggs','직스','19/07/22','M','1234','010-1111-1111','대전','중구','30585','jiggs@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ronaldo','호날두','19/07/22','M','1234','010-1111-1111','대전','중구','30585','ronaldo@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('trumph','트럼프','19/07/22','M','1234','010-1111-1111','대전','중구','30585','trumph@naver.com','3','N','ㅇ','ㅇ',null,null,'010-1111-1111','Y','34-3434-34');

Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (1,'채팅방1',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (2,'채팅방2',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (3,'채팅방3',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (4,'채팅방4',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (5,'채팅방5',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (6,'채팅방6',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (7,'채팅방7',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (8,'채팅방8',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (9,'채팅방9',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (10,'채팅방10',to_date('19/07/21','RR/MM/DD'),'brown');

Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (1,'병원간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (2,'방문간호');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (3,'방문간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (4,'병원간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (5,'방문간호');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (6,'방문간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (7,'병원간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (8,'방문간호');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (9,'방문간병');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (10,'병원간병');

Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (5,'선병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (6,'대전병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (7,'새미래병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (8,'아산병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (9,'충남대병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (10,'을지병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (11,'중앙병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (12,'카톨릭병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (13,'성모병원','대전','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (14,'선병원','대전','000-000-0000');

Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (1,'팔이 안좋으신 환자를 간병했습니다.',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (2,'다리가 안좋으신 어르신 간병',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (3,'허리가 안좋으신 노인 간병',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (4,'머리가 아프신 어르신 간병',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (5,'팔이 안좋으신 어르신 간병',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (6,'손가락이 안좋으신 어르신 간병
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (7,'눈이 안좋으신 어르신 간병
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (8,'코가 안좋으신 어르신 간병
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (9,'허벅지가 안좋으신 어르신 간병
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (10,'"발바닥이 안좋으신 어르신 간병',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);

Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (1,10000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (2,20000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (3,30000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (4,40000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (5,50000,to_date('19/07/21','RR/MM/DD'),'1','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (6,60000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (7,70000,to_date('19/07/21','RR/MM/DD'),'1','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (8,80000,to_date('19/07/21','RR/MM/DD'),'0','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (9,90000,to_date('19/07/21','RR/MM/DD'),'1','brown');
Insert into APPROVAL (APP_ID,APP_PAY,APP_TIME,APP_TYPE,MEM_ID) values (10,100000,to_date('19/07/21','RR/MM/DD'),'0','brown');

Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (1,null,'자유게시판','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (2,null,'qna게시판','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (3,null,'공지사항','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (4,null,'무더위쉼터','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (5,null,'문화센터','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (6,null,'문화센터','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (7,null,'문화센터','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');


Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (1,0,to_date('19/07/21','RR/MM/DD'),'게시글1','게시글1','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (2,0,to_date('19/07/21','RR/MM/DD'),'게시글2','게시글2','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (3,0,to_date('19/07/21','RR/MM/DD'),'게시글3','게시글3','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (4,0,to_date('19/07/21','RR/MM/DD'),'게시글4','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (5,0,to_date('19/07/21','RR/MM/DD'),'게시글5','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (6,0,to_date('19/07/21','RR/MM/DD'),'게시글6','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (7,0,to_date('19/07/21','RR/MM/DD'),'게시글7','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (8,0,to_date('19/07/21','RR/MM/DD'),'게시글8','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (9,0,to_date('19/07/21','RR/MM/DD'),'게시글9','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (10,0,to_date('19/07/21','RR/MM/DD'),'게시글10','게시글4','N',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,post_cont,POST_del,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (11,0,to_date('19/07/23','RR/MM/DD'),'nm','게시글4','N',11,'brown',1,null);

Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (1,'파일1경로','파일1',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (2,'파일2경로','파일2',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (3,'파일3경로','파일3',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (4,'파일4경로','파일4',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (5,'파일5경로','파일5',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (6,'파일6경로','파일6',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (7,'파일7경로','파일7',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (8,'파일8경로','파일8',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (9,'파일9경로','파일9',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (10,'파일10경로','파일10',1);

Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (1,'매칭1','매칭1내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','brown','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (2,'매칭2','매칭2내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','ahri','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (3,'매칭3','매칭3내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','sona','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (4,'매칭4','매칭4내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','jin','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (5,'매칭5','매칭5내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','twich','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (6,'매칭6','매칭6내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','heimerdinger','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (7,'매칭7','매칭7내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','anni','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (8,'매칭8','매칭8내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','jiggs','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (9,'매칭9','매칭9내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','ronaldo','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (10,'매칭10','매칭10내용','19/07/22','19/08/21','#D25565','#D25565','N','운동도움','trumph','ahri');

Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (1,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (2,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (3,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (4,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (5,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (6,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (7,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (8,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (9,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);
Insert into ATTENDANCE (AD_ID,AD_ST,AD_END,MAT_ID) values (10,to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),1);

Insert into SURVEY (SUR_ID,SUR_NM) values (1,'테스트1');
Insert into SURVEY (SUR_ID,SUR_NM) values (2,'테스트2');
Insert into SURVEY (SUR_ID,SUR_NM) values (3,'테스트3');
Insert into SURVEY (SUR_ID,SUR_NM) values (4,'테스트4');
Insert into SURVEY (SUR_ID,SUR_NM) values (5,'테스트5');
Insert into SURVEY (SUR_ID,SUR_NM) values (6,'테스트6');
Insert into SURVEY (SUR_ID,SUR_NM) values (7,'테스트7');
Insert into SURVEY (SUR_ID,SUR_NM) values (8,'테스트8');
Insert into SURVEY (SUR_ID,SUR_NM) values (9,'테스트9');
Insert into SURVEY (SUR_ID,SUR_NM) values (10,'테스트10');

Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (1,'동영상1경로','동영상1',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (2,'동영상2경로','동영상2',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (3,'동영상3경로','동영상3',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (4,'동영상4경로','동영상4',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (5,'동영상5경로','동영상5',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (6,'동영상6경로','동영상6',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (7,'동영상7경로','동영상7',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (8,'동영상8경로','동영상8',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (9,'동영상9경로','동영상9',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (10,'동영상10경로','동영상10',1);

Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (1,'1번질문','1번답',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (2,'2번질문','2번답',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (3,'3번질문','3번답',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (4,'4번질문','4번답',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (5,'5번질문','5번답',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (6,'1번질문','1번답',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (7,'2번질문','2번답',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (8,'3번질문','3번답',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (9,'4번질문','4번답',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (10,'5번질문','5번답',2);

Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (1,1,'brown');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (2,1,'ahri');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (3,1,'sona');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (4,1,'jin');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (5,1,'twich');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (6,1,'heimerdinger');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (7,1,'anni');

Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,1,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,2,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,3,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,4,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,5,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,6,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,7,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,8,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,9,'답변1',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,10,'답변1',to_date('19/07/22','RR/MM/DD'));

Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('brown',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('yumi',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('ahri',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('trumph',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('anni',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('sona',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('heimerdinger',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('deft',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('ruler',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));
Insert into GOLD (MEM_ID,GOLD_ST,GOLD_END) values ('ronaldo',to_date('19/07/21','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'));

Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (1,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (2,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (3,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (4,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (5,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (6,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (7,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (8,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (9,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));
Insert into CARDIAC (CAR_ID,MEM_ID,GOLD_ST,CAR_BPM,CAR_TIME) values (10,'brown',to_date('19/07/21','RR/MM/DD'),23,to_date('19/07/21','RR/MM/DD'));

Insert into CHATMEM (MEM_ID,CHAT_ID) values ('ahri',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('anni',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('brown',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('deft',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('heimerdinger',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('ronaldo',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('ruler',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('sona',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('trumph',1);
Insert into CHATMEM (MEM_ID,CHAT_ID) values ('yumi',1);

Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (1,'대전','문화시설1','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (2,'대구','문화시설2','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (3,'부산','문화시설3','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (4,'서울','문화시설4','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (5,'인천','문화시설5','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (6,'워싱턴','문화시설6','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (7,'뉴욕','문화시설7','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (8,'오사카','문화시설8','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (9,'상하이','문화시설9','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (10,'하와이','문화시설10','010-2341-2344',1);

Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',1);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',2);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',3);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',4);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',5);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',6);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',7);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',8);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',9);
Insert into CWSERVICETYPE (MEM_ID,SER_TYPE_ID) values ('brown',10);

Insert into DAY (MEM_ID,CW_DAY) values ('brown',0);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',1);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',2);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',3);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',4);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',5);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',6);
Insert into DAY (MEM_ID,CW_DAY) values ('brown',7);

Insert into DISEASENAME (DIS_ID,DIS_NM) values (1,'중풍');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (2,'심부전증');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (3,'당뇨');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (4,'고혈압');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (5,'치매');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (6,'파킨슨');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (7,'부정맥');

Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (1,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (2,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (3,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (4,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (5,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (6,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (7,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (8,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (9,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);
Insert into GPS (GPS_ID,MEM_ID,GOLD_ST,GPS_TIME,GPS_LO,GPS_LA) values (10,'brown',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),234234234,234234234);

Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (1,3,to_date('19/07/22','RR/MM/DD'),1);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (2,3,to_date('19/07/22','RR/MM/DD'),2);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (3,3,to_date('19/07/22','RR/MM/DD'),3);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (4,3,to_date('19/07/22','RR/MM/DD'),4);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (5,3,to_date('19/07/22','RR/MM/DD'),5);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (6,3,to_date('19/07/22','RR/MM/DD'),6);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (7,3,to_date('19/07/22','RR/MM/DD'),7);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (8,3,to_date('19/07/22','RR/MM/DD'),8);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (9,3,to_date('19/07/22','RR/MM/DD'),9);
Insert into GRADE (GRADE_ID,GRADE,GRADE_TIME,MAT_ID) values (10,3,to_date('19/07/22','RR/MM/DD'),10);

Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (1,'brown','대흥동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (2,'ahri','송강동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (3,'sona','노은동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (4,'jin','반석동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (5,'twich','외삼동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (6,'heimerdinger','관평동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (7,'anni','지족동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (8,'jiggs','사당동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (9,'ronaldo','갈마동');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (10,'trumph','유천동');

Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (1,5);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (1,6);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (1,7);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (1,8);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,8);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,9);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,10);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,11);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,12);
Insert into HOSPITALTYPE (SER_TYPE_ID,HOS_ID) values (2,13);

Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (1,'댓글1','N',to_date('19/07/22','RR/MM/DD'),'brown',1);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (2,'댓글2','N',to_date('19/07/22','RR/MM/DD'),'brown',2);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (3,'댓글3','N',to_date('19/07/22','RR/MM/DD'),'brown',3);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (4,'댓글4','N',to_date('19/07/22','RR/MM/DD'),'brown',4);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (5,'댓글5','N',to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (6,'댓글6','N',to_date('19/07/22','RR/MM/DD'),'brown',6);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (7,'댓글7','N',to_date('19/07/22','RR/MM/DD'),'brown',7);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (8,'댓글8','N',to_date('19/07/22','RR/MM/DD'),'brown',8);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (9,'댓글9','N',to_date('19/07/22','RR/MM/DD'),'brown',9);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (10,'댓글10','N',to_date('19/07/22','RR/MM/DD'),'brown',10);

Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (1,to_date('19/07/22','RR/MM/DD'),'보고서1','보고서1',1);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (2,to_date('19/07/22','RR/MM/DD'),'보고서2','보고서1',2);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (3,to_date('19/07/22','RR/MM/DD'),'보고서3','보고서1',3);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (4,to_date('19/07/22','RR/MM/DD'),'보고서4','보고서1',4);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (5,to_date('19/07/22','RR/MM/DD'),'보고서5','보고서1',5);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (6,to_date('19/07/22','RR/MM/DD'),'보고서6','보고서1',6);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (7,to_date('19/07/22','RR/MM/DD'),'보고서7','보고서1',7);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (8,to_date('19/07/22','RR/MM/DD'),'보고서8','보고서1',8);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (9,to_date('19/07/22','RR/MM/DD'),'보고서9','보고서1',9);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,REP_cont,MAT_ID) values (10,to_date('19/07/22','RR/MM/DD'),'보고서10','보고서1',10);

Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (1,'apath','a',1);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (2,'bpath','b',2);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (3,'cpath','c',3);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (4,'dpath','d',4);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (5,'eepath','e',5);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (6,'fpath','f',6);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (7,'gpath','g',7);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (8,'hpath','h',8);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (9,'ipath','i',9);
Insert into REPORTATTACH (REP_ATT_ID,REP_ATT_PATH,REP_ATT_NM,REP_ID) values (10,'jpath','j',10);

Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (1,'brown',1);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (2,'brown',2);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (3,'brown',3);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (4,'brown',4);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (5,'brown',5);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (6,'yumi',1);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (7,'yumi',2);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (8,'yumi',3);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (9,'yumi',4);
Insert into MEMBERDISEASE (MEM_DIS_ID,MEM_ID,DIS_ID) values (10,'yumi',5);

Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (1,1,'국어','오도아',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),10000,'월');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (2,1,'영어','이광호',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),20000,'화');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (3,1,'수학','정요한',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),30000,'수');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (4,1,'사회','양한솔',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),40000,'월,수');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (5,1,'과학','이재규',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),50000,'월,수,금');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (6,1,'스프링','성민창',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),60000,'월');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (7,1,'이클립스','유다연',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),70000,'토');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (8,1,'자바','박서경',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),80000,'일');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (9,1,'일본어','손영하',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),90000,'화,목');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (10,1,'중국어','유승진',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),100000,'월,수,토');

Insert into SOS (SOS_ID,GPS_ID) values (1,1);
Insert into SOS (SOS_ID,GPS_ID) values (2,2);
Insert into SOS (SOS_ID,GPS_ID) values (3,3);
Insert into SOS (SOS_ID,GPS_ID) values (4,4);
Insert into SOS (SOS_ID,GPS_ID) values (5,5);
Insert into SOS (SOS_ID,GPS_ID) values (6,6);
Insert into SOS (SOS_ID,GPS_ID) values (7,7);
Insert into SOS (SOS_ID,GPS_ID) values (8,8);
Insert into SOS (SOS_ID,GPS_ID) values (9,9);
Insert into SOS (SOS_ID,GPS_ID) values (10,10);


Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (1,1,'brown','안녕1',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (2,1,'brown','안녕2',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (3,1,'brown','안녕3',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (4,1,'brown','안녕4',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (5,1,'brown','안녕5',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (6,1,'brown','안녕6',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (7,1,'brown','안녕7',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (8,1,'brown','안녕8',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (9,1,'brown','안녕9',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (10,1,'brown','안녕10',to_date('19/07/22','RR/MM/DD'));