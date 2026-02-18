delete from grot;
update grot_seq set next_val = 1;

insert into grot values ((select next_val as id from grot_seq), 'Happy Grot');
update grot_seq set next_val = next_val + 1;

insert into grot values ((select next_val as id from grot_seq), 'Adventurous Grot');
update grot_seq set next_val = next_val + 1;

insert into grot values ((select next_val as id from grot_seq), 'Creative Grot');
update grot_seq set next_val = next_val + 1;

insert into grot values ((select next_val as id from grot_seq), 'Authentic Grot');
update grot_seq set next_val = next_val + 1;