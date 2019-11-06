select * from user;
show databases;
create database test;
use test;
CREATE TABLE `user` (
	`user_id` varchar(100) NOT NULL primary key, 
    `password` varchar(100) NOT NULL,
    `enabled` varchar(50) NOT NULL, 
    `authority` varchar(50) NOT NULL
    );
select * from test.user;    
COMMIT;
CREATE TABLE `board` (
   `board_id` bigint NOT NULL AUTO_INCREMENT primary key,
   `view_cnt` int default 0 not null,
   `title` varchar(300) NOT NULL,
   `con` text,
   `writer` varchar(100) NOT NULL,
   `password` varchar(300) NOT NULL
 );
 select * from test.board;
commit;