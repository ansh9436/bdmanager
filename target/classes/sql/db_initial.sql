/* board type
 *   기본 : 제목, 작성자, 비밀번호, 내용, 첨부 1
 *   갤러리 : 이미지 첨부만 가능, 첨부를 thumbnail로 처리
 *   자료실 : 첨부 5개까지 가능
 *   Q&A : 비밀글 표시 및 비밀번호 검사 후 내용 표시
 *   공지사항 : 글쓰기 버튼 비활성화, 관리자만 쓰기 가능
 *   방명록 : 쓰기, 삭제, 목록보기 기능
 * url    : 링크를 누르면 이동할 페이지의 주소
 * secret : 비밀글 표시 사용 여부
 * read_allow  : 읽기 권한 (all, login, customer, business, admin)
 * write_allow : 쓰기 권한 (all, login, customer, business, admin)
 * reply_allow : 댓글 권한 (all, login, customer, business, admin)
 * modify_allow : 수정 권한 (writer, admin)
 * remove : 삭제 권한 (writer, admin)
 * download : 첨부물 다운로드 권한 (all, login, customer, business, admin)
 * upload : 첨부물 업로드 권한 (all, login, customer, business, admin)
 * nAttach : 첨부 파일 수
 * aSize : 첨부파일 하나의 크기 제약
 * display_format : 게시글목록 보기에서 본문을 보여줄지 여부를 설정 (default 1 : 안보여 주기, 2 : 일부 보여 주기, 3 : 전체 보여주기)
 * nofArticle : 게시글의 갯수 (데이터베이스 테이블에 추가하지 않고, VO로 정의한 후 article 테이블에서 검색하여 사용)
 */

create sequence board_sequence
	increment by 1
	start with 1
	nomaxvalue
	nocycle
	cache 10;

select board_sequence.currval from dual;
select * from user_sequences where sequence_name = 'board_sequence'; 
/* sequence 값을 강제로 - 값으로 변경 */
alter sequence board_sequence increment by -1 minvalue 0;
/* sequence 값이 0이 되도록 만들어 준다. */
select board_sequence.nextval from dual;
/* 다시 증가분을 1로 만들어 준다. */
alter sequence board_sequence increment by 1 minvalue 0;
select board_id, url, board_name from board where board_id > 0 order by board_id desc

/*
 * 테이블의 초기 ID 값을 1부터 시작하게 하는 방법
 * 1. sequence를 생성
 * 2. alter sequence board_sequence increment by -1 minvalue 0; 를 실행하여 nextval을 0으로 만들어 준다.
 * 3. alter sequence board_sequence increment by 1 minvalue 0; 을 실행하여 nextval을 1로 만들어 준다.
 * 4. 이제 데이터를 추가(insert)하면 id가 1인 값으로 추가가 된다.
 */

delete from board where board_id = 1;
drop sequence board_sequence;

create table board (
	board_id number(11) not null primary key,
	board_name varchar2(40) not null,
	board_type varchar2(20) not null,
	url varchar2(100),
	secret char(1) default 'F',
	read_allow varchar2(10),
	write_allow varchar2(10),
	reply_allow varchar2(10),
	modify_allow varchar2(10),
	remove varchar2(10),
	download varchar2(10),
	upload varchar2(10),
	nAttach number(1),
	aSize varchar2(5),
	display_format number(1) default 1,
	creating_date timestamp default current_timestamp,
	board_desc varchar2(100)
);

drop table board;


create sequence article_sequence
	increment by 1
	start with 1
	nomaxvalue
	nocycle
	cache 10;

/*
 * article : 게시글을 저장하는 테이블
 * - article_id : 게시글 ID
 * - board_id : 게시판을 구별하는 ID
 * - writer_name : 게시글 작성자 이름
 * - email : 게시글 작성자의 ID (ID를 email로 사용하는 경우)
 * - title : 게시글 제목
 * - author : 원 저자 (시와 같은 창작물을 게시할 때, 원 저자를 기술)
 * - password : 게시글을 관리(수정, 삭제 등)할 때 필요 (로그인 하지 않은 경우 작성자를 구분하는 방법)
 * - read_count : 게시글을 읽은 횟수
 * - comment_count : 댓글의 수
 * - like_count : 좋아요를 누른 횟수
 * - ref : 게시글과 댓글에 대한 순서를 보장하는데 사용 (보통 게시글 ID)
 * - setp : 댓글에 대한 순서를 나타냄
 * - depth : 댓글에 대한 depth 정보를 저장
 * - createdAt : 게시글 생성 시간
 * - modifiedAt : 게시글을 수정한 시간
 * - content : 게시글 내용
 * - ip : 게시글을 접근하는 사용자의 IP address
 * - secret : 비밀글 여부를 나타냄 (기본 : 'F' 비밀글이 아님)
 */
create table article (
	article_id number(11) not null primary key,
	board_id number(11) default 0,
	writer_name varchar2(30) not null,
	email varchar2(30) not null,
	title varchar2(100) not null,
	author varchar2(30),
	password varchar2(20) not null,
	read_count number(8) default 0 not null,
	comment_count number(4) default 0 not null,
	like_count number(8) default 0 not null,
	ref number(10) default 0 not null,
	step number(3) default 0 not null,
	depth number(3) default 0 not null,
	createdAt timestamp(6) default current_timestamp,
	modifiedAt timestamp(6) default current_timestamp,
	content varchar2(4000) not null,
	ip varchar2(20) not null,
	secret varchar2(2)
);

alter table article add constraint fk_board
foreign key (board_id) references board (board_id);

drop table article;
alter sequence article_sequence increment by -1 minvalue 0;
alter sequence article_sequence increment by 1 minvalue 0;