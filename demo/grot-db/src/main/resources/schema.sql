drop table if exists grot;
drop table if exists grot_seq;

create table grot (id integer not null, name varchar(255) not null, primary key (id)) engine=InnoDB;
create table grot_seq (next_val bigint) engine=InnoDB;
insert into grot_seq values ( 1 );
alter table grot add constraint uniqueName unique (name);