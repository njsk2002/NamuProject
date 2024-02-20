

=====회원 관리 테이블 =======================================
CREATE TABLE namu_member(
    name    VARCHAR(20)    NOT NULL,
    id      VARCHAR(20)    PRIMARY KEY,
    pw      VARCHAR(20)    NOT NULL,
    gender  VARCHAR(3) DEFAULT '남' NOT NULL,
    addr    VARCHAR(200),
	email   VARCHAR(50)    NOT NULL,     
    post    VARCHAR(7),
	filename varchar(100),
    filepath varchar(300),
    admin   VARCHAR(1)     DEFAULT 'N'
);

insert into namu_member(name,id,pw,email) values('김테스트','njsk2002','0000','njsk2002@gmail.com');
select * from namu_member;

=====게시판 테이블 =======================================
drop table namu_board;
CREATE TABLE namu_board(
	bno	INT AUTO_INCREMENT PRIMARY KEY,
    bid VARCHAR(20) NOT NULL,
	title VARCHAR(300)	NOT NULL,
	content	VARCHAR(4000)	NOT NULL,
	writer	VARCHAR(100)	NOT NULL,
	writedate DATETIME DEFAULT current_timestamp,
	readcnt	bigint(5) DEFAULT 0,
	filename VARCHAR(300),
	filepath VARCHAR(300),
    FOREIGN KEY (bid) REFERENCES namu_member(id)
    ON DELETE CASCADE
);

select * from namu_board;
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트13','테스트입니다.','njsk2002'); 
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트14','테스트입니다.','njsk2002'); 
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트15','테스트입니다.','njsk2002'); 
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트16','테스트입니다.','njsk2002'); 
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트17','테스트입니다.','njsk2002'); 
insert into namu_board(bid,title,content,writer) values('njsk2002','테스트18','테스트입니다.','njsk2002');  


==게시판 댓글========================================================
DROP table namu_bcomment;
CREATE TABLE namu_bcomment (
    cno	INT AUTO_INCREMENT PRIMARY KEY,
	bno INT  NOT NULL,  /* 원글의 아이디 */
	writer VARCHAR(20) NOT NULL, /* 댓글 작성자 아이디 */
	content VARCHAR(4000) NOT NULL,
    writedate DATETIME DEFAULT current_timestamp,
    FOREIGN KEY (bno) REFERENCES namu_board(bno)
    ON DELETE CASCADE,
	FOREIGN KEY (writer) REFERENCES namu_member(id)
    ON DELETE CASCADE
);
