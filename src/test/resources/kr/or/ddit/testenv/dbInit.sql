\ufeff

select  *
from NOT_EXIST_IN_PRD_DB;
/* \ud68c\uc6d0 */
delete member;

/* \ub9e4\uce6d */
delete matching  ;

/* \uacb0\uc81c */
delete approval  ;

/* \ubcd1\uc6d0 */
delete hospital ;

/* \uc2ec\uc7a5\ubc15\ub3d9 */
delete cardiac ;

/* \ubb34\ub354\uc704\uc27c\ud130 */
delete shelter ;

/* GPS */
delete gps ;
/* \uc124\ubb38 \ucc38\uc5ec */
delete surveyPart ;

/* \uae34\uae09 \ud638\ucd9c \uc694\uccad */
delete sos ;

/* \uc124\ubb38 */
delete survey ;

/* \ubcf4\uace0\uc11c */
delete report ;

/* \uc9c8\ubb38 */
delete question ;

/* \uce74\ud14c\uace0\ub9ac */
delete category ;

/* \ub3d9\uc601\uc0c1 */
delete video ;

/* \ud68c\uc6d0 \ubcd1 */
delete memberDisease ;
/* \uace8\ub4dc \ud68c\uc6d0 */
delete gold ;

/* \ucc44\ud305\uae00 */
delete chatText  ;

/* \ucc44\ud305 \ubc29 */
delete chat  ;

/* \ucd9c\uacb0 */
delete attendance ;

/* \ubcd1\uba85 \uad00\ub9ac */
delete diseaseName ;

/* \ubcf4\uace0\uc11c \ucca8\ubd80\ud30c\uc77c */
delete reportAttach ;

/* \ud3c9\uc810 */
delete grade ;

/* \ubb38\ud654\uc13c\ud130 */
delete culture ;

/* \uc694\uc591\ubcf4\ud638\uc0ac \uc11c\ube44\uc2a4 \ud0c0\uc785 */
delete cwServiceType ;

/* \uc694\uc591\ubcf4\ud638\uc0ac \uc774\ub825 */
delete career  ;

/* \ucc44\ud305 \ud68c\uc6d0 */
delete chatMem ;

/* \ubcd1\uc6d0 \ud0c0\uc785 */
delete hospitalType ;

/* \uac15\uc88c */
delete lecture ;

/* \uc124\ubb38 \uc9c8\ubb38 \ub2f5\ubcc0 */
delete surveyAnswer ;

/* \uc694\uc591\ubcf4\ud638\uc0ac \uc11c\ube44\uc2a4 \uac00\ub2a5\uc694\uc77c */
delete day  ;

/* \ub9e4\uce6d \uc2a4\ucf00\uc974 */
delete schedule ;

/* \uc694\uc591\ubcf4\ud638\uc0ac \uc11c\ube44\uc2a4 \uac00\ub2a5\uc9c0\uc5ed */
delete location   ;

/* \uc11c\ube44\uc2a4 \ud0c0\uc785 */
delete serviceType ;

/* \uac8c\uc2dc\uae00 */
delete post ;

/* \ucca8\ubd80\ud30c\uc77c */
delete attachment ;

/* \ub313\uae00 */
delete reply  ;

SET DEFINE OFF;
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('dkskqk00','\uc624\ub3c4\uc544','94/09/22`','F','dkskqk00','010-2114-2539','\ub300\uc804','\uc911\uad6c','30585','dkskqk00@naver.ver','0','N',null,null,null,null,null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('aha','\ub300\uc0c1\uc790','94/09/22','F','1234','010-2222-3333','\ub300\uc804','\uc911\uad6c','30585','aha@naver.com','1','N','o','o',null,null,null,null,null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('brown','\ube0c\ub77c\uc6b4','19/07/21','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','brown@naver.com','1','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('yumi','\uc720\ubbf8','19/07/21','F','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','yumi@naver.com','1','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('deft','\ub370\ud504\ud2b8','19/07/21','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','deft@naver.com','1','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ruler','\ub8f0\ub7ec','19/07/21','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','ruler@naver.com','1','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('cw','\uc694\uc591\ubcf4\ud638\uc0ac','19/07/22','F','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','cw@naver.com','1','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ahri','\uc544\ub9ac','19/07/22','F','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','ahri@naver.com','2','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('sona','\uc18c\ub098','19/07/22','F','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','sona@naver.com','2','N','\u3147','\u3147','\uc544\ub4e4','\ub9c8\ubbf8',null,'Y',null);
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('jin','\uc9c4','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','jin@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('twich','\ud2b8\uc704\uce58','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','twich@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('heimerdinger','\ud558\uc774\uba38\ub529\uac70','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','heimerdinger@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('anni','\uc560\ub2c8','19/07/22','F','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','anni@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('jiggs','\uc9c1\uc2a4','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','jiggs@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('ronaldo','\ud638\ub0a0\ub450','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','ronaldo@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');
Insert into MEMBER (MEM_ID,MEM_NM,MEM_BIRTH,MEM_GENDER,MEM_PASS,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_ZIPCD,MEM_MAIL,MEM_GRADE,MEM_DEL,MEM_PHOTO_PATH,MEM_PHOTO_NM,PRO_RELATION,PRO_NM,PRO_PHONE,CW_DRIVER,CW_LIC) values ('trumph','\ud2b8\ub7fc\ud504','19/07/22','M','1234','010-1111-1111','\ub300\uc804','\uc911\uad6c','30585','trumph@naver.com','3','N','\u3147','\u3147',null,null,'010-1111-1111','Y','34-3434-34');

SET DEFINE OFF;
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (1,'\ucc44\ud305\ubc291',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (2,'\ucc44\ud305\ubc292',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (3,'\ucc44\ud305\ubc293',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (4,'\ucc44\ud305\ubc294',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (5,'\ucc44\ud305\ubc295',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (6,'\ucc44\ud305\ubc296',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (7,'\ucc44\ud305\ubc297',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (8,'\ucc44\ud305\ubc298',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (9,'\ucc44\ud305\ubc299',to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CHAT (CHAT_ID,CHAT_NM,CHAT_DT,CHAT_MEM_ID) values (10,'\ucc44\ud305\ubc2910',to_date('19/07/21','RR/MM/DD'),'brown');

SET DEFINE OFF;
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (1,'\ubcd1\uc6d0\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (2,'\ubc29\ubb38\uac04\ud638');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (3,'\ubc29\ubb38\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (4,'\ubcd1\uc6d0\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (5,'\ubc29\ubb38\uac04\ud638');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (6,'\ubc29\ubb38\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (7,'\ubcd1\uc6d0\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (8,'\ubc29\ubb38\uac04\ud638');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (9,'\ubc29\ubb38\uac04\ubcd1');
Insert into SERVICETYPE (SER_TYPE_ID,SER_TYPE) values (10,'\ubcd1\uc6d0\uac04\ubcd1');

SET DEFINE OFF;
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (1,1,'brown','\uc548\ub1551',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (2,1,'brown','\uc548\ub1552',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (3,1,'brown','\uc548\ub1553',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (4,1,'brown','\uc548\ub1554',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (5,1,'brown','\uc548\ub1555',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (6,1,'brown','\uc548\ub1556',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (7,1,'brown','\uc548\ub1557',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (8,1,'brown','\uc548\ub1558',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (9,1,'brown','\uc548\ub1559',to_date('19/07/22','RR/MM/DD'));
Insert into CHATTEXT (CHATTEXT_ID,CHAT_ID,MEM_ID,CHATTEXT_CONT,CHATTEXT_TIME) values (10,1,'brown','\uc548\ub15510',to_date('19/07/22','RR/MM/DD'));

SET DEFINE OFF;
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (5,'\uc120\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (6,'\ub300\uc804\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (7,'\uc0c8\ubbf8\ub798\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (8,'\uc544\uc0b0\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (9,'\ucda9\ub0a8\ub300\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (10,'\uc744\uc9c0\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (11,'\uc911\uc559\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (12,'\uce74\ud1a8\ub9ad\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (13,'\uc131\ubaa8\ubcd1\uc6d0','\ub300\uc804','000-000-0000');
Insert into HOSPITAL (HOS_ID,HOS_NM,HOS_ADD,HOS_PHONE) values (14,'\uc120\ubcd1\uc6d0','\ub300\uc804','000-000-0000');

SET DEFINE OFF;
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (1,'\ud314\uc774 \uc548\uc88b\uc73c\uc2e0 \ud658\uc790\ub97c \uac04\ubcd1\ud588\uc2b5\ub2c8\ub2e4.',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (2,'\ub2e4\ub9ac\uac00 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (3,'\ud5c8\ub9ac\uac00 \uc548\uc88b\uc73c\uc2e0 \ub178\uc778 \uac04\ubcd1',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (4,'\uba38\ub9ac\uac00 \uc544\ud504\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (5,'\ud314\uc774 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (6,'\uc190\uac00\ub77d\uc774 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (7,'\ub208\uc774 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (8,'\ucf54\uac00 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (9,'\ud5c8\ubc85\uc9c0\uac00 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1
',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into CAREER (CW_CAREER_ID,CAREER_CONT,CAREER_ST_DT,CAREER_END_DT,MEM_ID,HOS_ID) values (10,'"\ubc1c\ubc14\ub2e5\uc774 \uc548\uc88b\uc73c\uc2e0 \uc5b4\ub974\uc2e0 \uac04\ubcd1',to_date('19/07/21','RR/MM/DD'),to_date('19/07/22','RR/MM/DD'),'brown',5);

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

Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (1,null,'\uc790\uc720\uac8c\uc2dc\ud310','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (2,null,'qna\uac8c\uc2dc\ud310','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (3,null,'\uacf5\uc9c0\uc0ac\ud56d','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (4,null,'\ubb34\ub354\uc704\uc27c\ud130','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (5,null,'\ubb38\ud654\uc13c\ud130','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (6,null,'\ubb38\ud654\uc13c\ud130','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');
Insert into CATEGORY (CATE_ID,CATE_PAERENT_ID,CATE_TITLE,CATE_USAGE,CATE_SORTNUM,CATE_DATE,MEM_ID) values (7,null,'\ubb38\ud654\uc13c\ud130','Y',1,to_date('19/07/21','RR/MM/DD'),'brown');


Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (1,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae001','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (2,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae002','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (3,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae003','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (4,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae004','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (5,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae005','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (6,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae006','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (7,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae007','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (8,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae008','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (9,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae009','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (10,0,to_date('19/07/21','RR/MM/DD'),'\uac8c\uc2dc\uae0010','Y',0,'brown',1,null);
Insert into POST (POST_ID,POST_CNT,POST_TIME,POST_NM,POST_USAGE,POST_GROUP,MEM_ID,CATE_ID,POST_PAR) values (11,0,to_date('19/07/23','RR/MM/DD'),'nm','Y',11,'brown',1,null);

Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (1,'\ud30c\uc77c1\uacbd\ub85c','\ud30c\uc77c1',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (2,'\ud30c\uc77c2\uacbd\ub85c','\ud30c\uc77c2',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (3,'\ud30c\uc77c3\uacbd\ub85c','\ud30c\uc77c3',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (4,'\ud30c\uc77c4\uacbd\ub85c','\ud30c\uc77c4',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (5,'\ud30c\uc77c5\uacbd\ub85c','\ud30c\uc77c5',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (6,'\ud30c\uc77c6\uacbd\ub85c','\ud30c\uc77c6',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (7,'\ud30c\uc77c7\uacbd\ub85c','\ud30c\uc77c7',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (8,'\ud30c\uc77c8\uacbd\ub85c','\ud30c\uc77c8',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (9,'\ud30c\uc77c9\uacbd\ub85c','\ud30c\uc77c9',1);
Insert into ATTACHMENT (ATT_ID,ATT_PATH,ATT_NM,POST_ID) values (10,'\ud30c\uc77c10\uacbd\ub85c','\ud30c\uc77c10',1);

Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (1,'\ub9e4\uce6d1','\ub9e4\uce6d1\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','brown','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (2,'\ub9e4\uce6d2','\ub9e4\uce6d2\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','ahri','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (3,'\ub9e4\uce6d3','\ub9e4\uce6d3\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','sona','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (4,'\ub9e4\uce6d4','\ub9e4\uce6d4\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','jin','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (5,'\ub9e4\uce6d5','\ub9e4\uce6d5\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','twich','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (6,'\ub9e4\uce6d6','\ub9e4\uce6d6\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','heimerdinger','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (7,'\ub9e4\uce6d7','\ub9e4\uce6d7\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','anni','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (8,'\ub9e4\uce6d8','\ub9e4\uce6d8\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','jiggs','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (9,'\ub9e4\uce6d9','\ub9e4\uce6d9\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','ronaldo','ahri');
Insert into MATCHING (MAT_ID,MAT_TITLE,MAT_CONT,MAT_ST,MAT_END,MAT_BC,MAT_TC,MAT_ALLDAY,MAT_TYPE,MEM_ID,CW_MEM_ID) values (10,'\ub9e4\uce6d10','\ub9e4\uce6d10\ub0b4\uc6a9','19/07/22','19/08/21','#D25565','#D25565','N','\uc6b4\ub3d9\ub3c4\uc6c0','trumph','ahri');

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

Insert into SURVEY (SUR_ID,SUR_NM) values (1,'\ud14c\uc2a4\ud2b81');
Insert into SURVEY (SUR_ID,SUR_NM) values (2,'\ud14c\uc2a4\ud2b82');
Insert into SURVEY (SUR_ID,SUR_NM) values (3,'\ud14c\uc2a4\ud2b83');
Insert into SURVEY (SUR_ID,SUR_NM) values (4,'\ud14c\uc2a4\ud2b84');
Insert into SURVEY (SUR_ID,SUR_NM) values (5,'\ud14c\uc2a4\ud2b85');
Insert into SURVEY (SUR_ID,SUR_NM) values (6,'\ud14c\uc2a4\ud2b86');
Insert into SURVEY (SUR_ID,SUR_NM) values (7,'\ud14c\uc2a4\ud2b87');
Insert into SURVEY (SUR_ID,SUR_NM) values (8,'\ud14c\uc2a4\ud2b88');
Insert into SURVEY (SUR_ID,SUR_NM) values (9,'\ud14c\uc2a4\ud2b89');
Insert into SURVEY (SUR_ID,SUR_NM) values (10,'\ud14c\uc2a4\ud2b810');

Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (1,'\ub3d9\uc601\uc0c11\uacbd\ub85c','\ub3d9\uc601\uc0c11',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (2,'\ub3d9\uc601\uc0c12\uacbd\ub85c','\ub3d9\uc601\uc0c12',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (3,'\ub3d9\uc601\uc0c13\uacbd\ub85c','\ub3d9\uc601\uc0c13',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (4,'\ub3d9\uc601\uc0c14\uacbd\ub85c','\ub3d9\uc601\uc0c14',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (5,'\ub3d9\uc601\uc0c15\uacbd\ub85c','\ub3d9\uc601\uc0c15',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (6,'\ub3d9\uc601\uc0c16\uacbd\ub85c','\ub3d9\uc601\uc0c16',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (7,'\ub3d9\uc601\uc0c17\uacbd\ub85c','\ub3d9\uc601\uc0c17',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (8,'\ub3d9\uc601\uc0c18\uacbd\ub85c','\ub3d9\uc601\uc0c18',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (9,'\ub3d9\uc601\uc0c19\uacbd\ub85c','\ub3d9\uc601\uc0c19',1);
Insert into VIDEO (VIDEO_ID,VIDEO_PATH,VIDEO_NM,SUR_ID) values (10,'\ub3d9\uc601\uc0c110\uacbd\ub85c','\ub3d9\uc601\uc0c110',1);

Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (1,'1\ubc88\uc9c8\ubb38','1\ubc88\ub2f5',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (2,'2\ubc88\uc9c8\ubb38','2\ubc88\ub2f5',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (3,'3\ubc88\uc9c8\ubb38','3\ubc88\ub2f5',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (4,'4\ubc88\uc9c8\ubb38','4\ubc88\ub2f5',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (5,'5\ubc88\uc9c8\ubb38','5\ubc88\ub2f5',1);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (6,'1\ubc88\uc9c8\ubb38','1\ubc88\ub2f5',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (7,'2\ubc88\uc9c8\ubb38','2\ubc88\ub2f5',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (8,'3\ubc88\uc9c8\ubb38','3\ubc88\ub2f5',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (9,'4\ubc88\uc9c8\ubb38','4\ubc88\ub2f5',2);
Insert into QUESTION (QUES_ID,QUES,ANS,SUR_ID) values (10,'5\ubc88\uc9c8\ubb38','5\ubc88\ub2f5',2);

Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (1,1,'brown');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (2,1,'ahri');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (3,1,'sona');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (4,1,'jin');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (5,1,'twich');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (6,1,'heimerdinger');
Insert into SURVEYPART (SUR_PART_ID,SUR_ID,MEM_ID) values (7,1,'anni');

Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,1,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,2,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,3,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,4,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,5,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,6,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,7,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,8,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,9,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));
Insert into SURVEYANSWER (SUR_PART_ID,QUES_ID,SUR_ANS_CONT,SUR_ANS_TIME) values (1,10,'\ub2f5\ubcc01',to_date('19/07/22','RR/MM/DD'));

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

Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (1,'\ub300\uc804','\ubb38\ud654\uc2dc\uc1241','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (2,'\ub300\uad6c','\ubb38\ud654\uc2dc\uc1242','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (3,'\ubd80\uc0b0','\ubb38\ud654\uc2dc\uc1243','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (4,'\uc11c\uc6b8','\ubb38\ud654\uc2dc\uc1244','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (5,'\uc778\ucc9c','\ubb38\ud654\uc2dc\uc1245','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (6,'\uc6cc\uc2f1\ud134','\ubb38\ud654\uc2dc\uc1246','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (7,'\ub274\uc695','\ubb38\ud654\uc2dc\uc1247','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (8,'\uc624\uc0ac\uce74','\ubb38\ud654\uc2dc\uc1248','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (9,'\uc0c1\ud558\uc774','\ubb38\ud654\uc2dc\uc1249','010-2341-2344',1);
Insert into CULTURE (CULTURE_ID,CULTURE_ADD,CULTURE_TYPE,CULTURE_PHONE,CATE_ID) values (10,'\ud558\uc640\uc774','\ubb38\ud654\uc2dc\uc12410','010-2341-2344',1);

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

Insert into DISEASENAME (DIS_ID,DIS_NM) values (1,'\uc911\ud48d');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (2,'\uc2ec\ubd80\uc804\uc99d');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (3,'\ub2f9\ub1e8');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (4,'\uace0\ud608\uc555');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (5,'\uce58\ub9e4');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (6,'\ud30c\ud0a8\uc2a8');
Insert into DISEASENAME (DIS_ID,DIS_NM) values (7,'\ubd80\uc815\ub9e5');

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

Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (1,'brown','\ub300\ud765\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (2,'ahri','\uc1a1\uac15\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (3,'sona','\ub178\uc740\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (4,'jin','\ubc18\uc11d\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (5,'twich','\uc678\uc0bc\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (6,'heimerdinger','\uad00\ud3c9\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (7,'anni','\uc9c0\uc871\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (8,'jiggs','\uc0ac\ub2f9\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (9,'ronaldo','\uac08\ub9c8\ub3d9');
Insert into LOCATION (LOC_ID,MEM_ID,LOC_DONG) values (10,'trumph','\uc720\ucc9c\ub3d9');

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

Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (1,'\ub313\uae001','N',to_date('19/07/22','RR/MM/DD'),'brown',1);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (2,'\ub313\uae002','N',to_date('19/07/22','RR/MM/DD'),'brown',2);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (3,'\ub313\uae003','N',to_date('19/07/22','RR/MM/DD'),'brown',3);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (4,'\ub313\uae004','N',to_date('19/07/22','RR/MM/DD'),'brown',4);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (5,'\ub313\uae005','N',to_date('19/07/22','RR/MM/DD'),'brown',5);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (6,'\ub313\uae006','N',to_date('19/07/22','RR/MM/DD'),'brown',6);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (7,'\ub313\uae007','N',to_date('19/07/22','RR/MM/DD'),'brown',7);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (8,'\ub313\uae008','N',to_date('19/07/22','RR/MM/DD'),'brown',8);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (9,'\ub313\uae009','N',to_date('19/07/22','RR/MM/DD'),'brown',9);
Insert into REPLY (REPLY_ID,REPLY_CONT,REPLY_DEL,REPLY_TIME,MEM_ID,POST_ID) values (10,'\ub313\uae0010','N',to_date('19/07/22','RR/MM/DD'),'brown',10);

Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (1,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c1',1);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (2,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c2',2);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (3,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c3',3);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (4,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c4',4);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (5,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c5',5);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (6,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c6',6);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (7,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c7',7);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (8,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c8',8);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (9,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c9',9);
Insert into REPORT (REP_ID,REP_TIME,REP_TITLE,MAT_ID) values (10,to_date('19/07/22','RR/MM/DD'),'\ubcf4\uace0\uc11c10',10);

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

Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (1,1,'\uad6d\uc5b4','\uc624\ub3c4\uc544',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),10000,'\uc6d4');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (2,1,'\uc601\uc5b4','\uc774\uad11\ud638',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),20000,'\ud654');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (3,1,'\uc218\ud559','\uc815\uc694\ud55c',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),30000,'\uc218');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (4,1,'\uc0ac\ud68c','\uc591\ud55c\uc194',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),40000,'\uc6d4,\uc218');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (5,1,'\uacfc\ud559','\uc774\uc7ac\uaddc',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),50000,'\uc6d4,\uc218,\uae08');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (6,1,'\uc2a4\ud504\ub9c1','\uc131\ubbfc\ucc3d',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),60000,'\uc6d4');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (7,1,'\uc774\ud074\ub9bd\uc2a4','\uc720\ub2e4\uc5f0',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),70000,'\ud1a0');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (8,1,'\uc790\ubc14','\ubc15\uc11c\uacbd',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),80000,'\uc77c');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (9,1,'\uc77c\ubcf8\uc5b4','\uc190\uc601\ud558',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),90000,'\ud654,\ubaa9');
Insert into LECTURE (LEC_ID,CULTURE_ID,LEC_NM,LEC_TEA,LEC_ST_DT,LEC_END_DT,LEC_ST_TIME,LEC_END_TIME,LEC_FEE,LEC_DAY) values (10,1,'\uc911\uad6d\uc5b4','\uc720\uc2b9\uc9c4',to_date('19/07/22','RR/MM/DD'),to_date('19/08/21','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),to_date('19/07/01','RR/MM/DD'),100000,'\uc6d4,\uc218,\ud1a0');

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
