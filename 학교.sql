/*
시간표
시간표ID, 과목코드, 요일, 시작교시, 종료교시, 교실, 교사
공지사항
공지ID, 제목, 내용, 작성일, 작성자, 대상(학생/전체 등)
교실
교실ID, 교실번호, 수용인원, 사용 가능 여부, 교실 위치
수강제한
제한ID, 과목코드, 최소학년, 최대학년, 필수선수과목코드, 중복신청허용여부

과거 수강 기록 테이블 (학기별 수강 기록)
학생ID, 과목코드, 수강학기, 수강년도, 학점, 선생님명
현재 수강신청 기록 테이블
학생ID, 과목코드, 신청학기, 신청년도, 신청상태, 신청일, 선생님명, 교실
*/

-- 시간표 (Schedule) 테이블
CREATE TABLE Schedule (
    시간표ID INT AUTO_INCREMENT PRIMARY KEY,
    과목아이디 VARCHAR(20) NOT NULL,
    요일 VARCHAR(20) NOT NULL,
    시작교시 INT NOT NULL,
    종료교시 INT NOT NULL,
    교실ID INT NOT NULL,
    교사ID INT NOT NULL,
);
-- 공지사항 (Notice) 테이블
CREATE TABLE Notice (
    공지ID INT AUTO_INCREMENT PRIMARY KEY,
    제목 VARCHAR(255) NOT NULL,
    내용 TEXT NOT NULL,
    작성일 DATETIME NOT NULL,
    작성자ID INT NOT NULL,
    대상 VARCHAR(20) NOT NULL,
);
-- 교실 (Classroom) 테이블
CREATE TABLE Classroom (
    교실ID INT AUTO_INCREMENT PRIMARY KEY,
    교실번호 VARCHAR(20) NOT NULL,
    수용인원 INT NOT NULL,
    사용가능여부 BOOLEAN NOT NULL,
    교실위치 VARCHAR(255) NOT NULL
);
-- 수강제한 (CourseRestriction) 테이블
 CREATE TABLE CourseRestriction (
    제한ID INT AUTO_INCREMENT PRIMARY KEY,
    과목코드 VARCHAR(20) NOT NULL,
    최소학년 INT NOT NULL,
    최대학년 INT NOT NULL,
    필수선수과목코드 VARCHAR(20),
    중복신청허용여부 BOOLEAN NOT NULL,
);

-- 과거 수강 기록 (PastEnrollment) 테이블
CREATE TABLE PastEnrollment (
    학생ID INT NOT NULL,
    과목코드 VARCHAR(20) NOT NULL,
    수강학기 VARCHAR(10) NOT NULL,
    수강년도 INT NOT NULL,
    학점 DECIMAL(3,2) NOT NULL,
    선생님명 VARCHAR(100) NOT NULL,
);
-- 현재 수강신청 기록 (CurrentEnrollment) 테이블
CREATE TABLE CurrentEnrollment (
    학생ID INT NOT NULL,
    과목코드 VARCHAR(20) NOT NULL,
    신청학기 VARCHAR(10) NOT NULL,
    신청년도 INT NOT NULL,
    신청상태 VARCHAR(20) NOT NULL,
    신청일 DATETIME NOT NULL,
    선생님명 VARCHAR(100) NOT NULL,
    교실ID INT NOT NULL,
    PRIMARY KEY (학생ID, 과목코드, 신청학기, 신청년도)
);