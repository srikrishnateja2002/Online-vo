create database onlinevoting;
use onlinevoting;




create table admins(
admin_name varchar(50),
admin_username varchar(10) unique,
admin_email varchar(50) unique,
admin_orgid varchar(10) unique,
admin_phoneno varchar(15) unique,
admin_pwd varchar(20) unique,
primary key(admin_orgid));


select * from admins;

 
 
create table voters(
voter_name varchar(50),
voter_username varchar(10) unique,
voter_email varchar(50) unique,
voter_gender varchar(10),
voter_orgid varchar(10),
voter_phoneno varchar(15) unique,
voter_pwd varchar(20),
primary key(voter_username),
foreign key(voter_orgid) references admins(admin_orgid)
on update cascade on delete cascade);




select * from voters;




create table participants(
parti_username varchar(10) unique,
parti_orgid varchar(10),
parti_img mediumblob,
parti_file mediumblob,
parti_verify int ,
primary key(parti_username),
foreign key(parti_username) references voters(voter_username)on update cascade on delete cascade,
foreign key(parti_orgid) references admins(admin_orgid)on update cascade on delete cascade);



select * from participants;






create table votingdate(
date_orgid varchar(10),
start_date TIMESTAMP,
end_date TIMESTAMP,
foreign key(date_orgid) references admins(admin_orgid)on update cascade on delete cascade);


select * from votingdate;



create table vote(
orgid varchar(10),
voter varchar(10),
parti varchar(10),
primary key(voter),
foreign key(voter) references voters(voter_username)on update cascade on delete cascade,
foreign key(parti) references participants(parti_username)on update cascade on delete cascade,
foreign key(orgid) references admins(admin_orgid)on update cascade on delete cascade);

select parti,count(voter) from vote group by parti;


select * from vote;