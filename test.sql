create database if not exists baseball_league;

use baseball_league;

create table`baseball_league`.`teams` (
   team_id int,
    name varchar(100),
    city varchar(100),
    founded_year year
);

create table `baseball_league`.`players`(
   player_id int,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수')    
);

alter table `players`add column birth_date date;

desc teams;
desc players;


drop table players;
drop table if exists games;

drop database baseball_league;



use example;

create table `example`.`product_info`(
   product_id int,
    product_name varchar(100),
    category char(10),
    price decimal(10, 2),
    in_stock boolean,
    release_date date,
    color enum('red', 'green', 'blue')
);

insert into `product_info`
values(1, 'Galaaxy Watch', 'Device', 299.99, true, '2024-06-01', 'green');

select * from `product_info`;
