create database grot_db;
create user 'springuser'@'%' identified by 'ThePassword';
grant all on grot_db.* to 'springuser'@'%';