#First create the database
#create database movie_data;

#use the created database
use movie_data;

#1.create the movie table :
drop table movie;
create table movie(
mov_id int primary key, mov_title varchar(50), mov_year int, mov_time int, 
mov_lang varchar(50), mov_dt_rel date, mov_rel_country varchar(5));

#2.create the actor table :
drop table actor;
create table actor( act_id int primary key,
act_fname varchar(20), act_lname varchar(20), act_gender varchar(1));

#3.create the director table :
drop table director;
create table director( dir_id int primary key, dir_fname varchar(20) , dir_lname varchar(20));

#4.create the movie_direction table:
drop table movie_direction;
create table movie_direction( dir_id int , mov_id int,
foreign key (dir_id) references director(dir_id),
foreign key (mov_id) references movie(mov_id));
desc movie_direction;

#5.create the movie_cast table :
drop table movie_cast;
create table movie_cast( act_id int , mov_id int , role varchar(30),
foreign key (act_id) references actor(act_id),
foreign key (mov_id) references movie(mov_id));
desc movie_cast;

#6.create the reviewer table :
drop table reviewer;
create table reviewer( rev_id int primary key , rev_name varchar(30));

#7.create the genres table :
drop table genres;
create table genres( gen_id int primary key , gen_title varchar(20));

#8.create the movie_genres table :
drop table movie_genres;
create table movie_genres( mov_id int , gen_id int,
foreign key (mov_id) references movie(mov_id),
foreign key (gen_id) references genres(gen_id));
desc movie_genres;

#9.create the rating table :
drop table rating;
create table rating( mov_id int , rev_id int , rev_stars decimal(4,2) , num_o_ratings int,
foreign key (mov_id) references movie(mov_id),
foreign key (rev_id) references reviewer(rev_id));

#input the value in 1st table i.e. movie :
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) values
(101,"Avtar",2019,162,"English","2009-12-20","UK"),
(102,"Assassination",2015,140,"Korean","2015-07-22","SK"),
(103,"Seven Samurai",1954,207,"Japanese","1954-04-26","Japan"),
(104,"Parasite",2019,132,"Korean","2019-05-30","SK"),
(105,"777 Charlie",2022,164,"Kannada","2022-06-10","India"),
(106,"3 Idiots",2009,171,"Hindi","2009-12-25","India"),
(107,"Train to Busan",2016,118,"Korean","2016-07-20","SK"),
(108,"The Avengers",2012,143,"English","2012-05-12","US"),
(109,"Transformers",2007,143,"English","2007-07-03","US"),
(110,"The Dark Knight Rises",2012,165,"English","2012-07-12","UK"); 

#To show the created table movie :
select * from movie;

#Input the values in 2nd table actor :
insert into actor(act_id,act_fname,act_lname,act_gender) values
(201,"Zoe","Saldaña","F"),
(202,"Jun-Ho","Joon","M"),
(203,"Toma","Ikuta","M"),
(204,"Ahn","Hyo-seop","M"),
(205,"Rakshit","Shetty","M"),
(206,"Nozomi","Sasaki","F"),
(207,"Hye-jin","Han","F"),
(208,"Amir","Khan","M"),
(209,"Goon","Yoo","M"),
(210,"Robert","Peteson","M");

#To show the created table actor :
select * from actor;

#Input the values in 3rd table director :
insert into director(dir_id,dir_fname,dir_lname) values
(1,"Michael","Cimino"),
(2,"James","Cameron"),
(3,"Kiranraj","K"),
(4,"Yeon","Sang-ho"),
(5,"Bong","Joon-ho"),
(6,"Kim","Jee-woon"),
(7,"Rajkumar","Hirani"),
(8,"Anthony","Russo"),
(9,"Joe","Russo"),
(10,"Hayao","Miyazaki");

#To show the created table director :
select * from director;

#Input the values in 4th table movie_direction :
insert into movie_direction(dir_id,mov_id) values
(2,102),(4,104),(5,105),(7,107),(8,108),(10,110);

#To show the created table movie movie_direction :
select * from movie_direction;

#Input the values in 5th table movie_cast :
insert into movie_cast(act_id,mov_id,role) values
(201,101,"Lead Actress"),
(203,102,"Support Actor"),
(206,105,"Lead Actress"),
(202,107,"Lead Actor"),
(209,109,"Support Actor"),
(205,103,"Leading"),
(210,108,"Support Actor");

#To show the created table movie_cast :
select * from movie_cast;

#Input the values in 6th table reviewer :
insert into reviewer(rev_id,rev_name) values
(2001,"Victor Woeltjen"),
(2002,"Mike Salvati"),
(2003,"Vincent Cadena"),
(2004,"Jack Malvern"),
(2005,"Scott LeBrun"),
(2006,"Alec Shaw"),
(2007,""),
(2008,"Neal Wruck"),
(2009,"Krug Stillo"),
(2010,"");

#To show the created table reviewer :
select * from reviewer;

#Input the values in 7th table genres :
insert into genres(gen_id,gen_title) values
(501,"Action"),
(502,"Comedy"),
(503,"Rom-Com"),
(504,"Thriller"),
(505,"Horror"),
(506,"Dance Film"),
(507,"Boigraphy"),
(508,"Animation"),
(509,"Adventure"),
(510,"Mystery");

#To show the created table genres :
select * from genres;

#Input the values in 8th table movie_genres :
insert into movie_genres(mov_id,gen_id) values
(101,508),(102,501),(103,509),(104,504),(105,507),(106,503),(107,505),(108,501),(109,501),(110,510);

#To show the created table movie_genres :
select * from movie_genres;

#Input thr values in 9th table rating :
insert into rating(mov_id,rev_id,rev_stars,num_o_ratings) values
(101,2002,8.6,202567),
(102,2001,9.2,5013445),
(103,2005,8.2,101876),
(104,2004,9.1,408765),
(106,2007,8.9,60987),
(105,2003,9.1,113451),
(108,2002,6.0,63874),
(107,2009,8.4,108764);

#TO show the created table rating
select * from rating;

#To show the joining between tables :
select * from movie join rating where movie.mov_id = rating.mov_id;

select * from actor,movie,movie_cast join rating where actor.act_id=movie_cast.act_id and 
movie.mov_id=movie_cast.mov_id and movie.mov_id=rating.mov_id;

select actor.act_id,actor.act_fname,actor.act_lname,movie.mov_title,
movie.mov_year,movie.mov_time,movie.mov_lang,movie_cast.role,rating.rev_stars,rating.num_o_ratings
from actor,movie,movie_cast join rating where actor.act_id=movie_cast.act_id 
and movie.mov_id=movie_cast.mov_id and movie.mov_id=rating.mov_id;

select movie.mov_title,genres.gen_title from movie_genres join movie,genres 
where movie.mov_id=movie_genres.mov_id and genres.gen_id=movie_genres.gen_id;

#right outer join
select actor.act_id,actor.act_fname,actor.act_lname,actor.act_gender,movie_cast.role
from actor right outer join movie_cast on actor.act_id=movie_cast.act_id;

#left outer join
select actor.act_id,actor.act_fname,actor.act_lname,actor.act_gender,movie_cast.role
from actor left outer join movie_cast on actor.act_id=movie_cast.act_id;

#String function :
select concat(act_fname," ",act_lname) as actor_full_name from actor;
select concat(upper(act_fname)," ",upper(act_lname)) as actor_full_name from actor;
select concat(length(act_fname),length(act_lname)) as actor_full_name from actor;

select concat(dir_fname," ",dir_lname) as dir_full_name from director;
select concat(lower(dir_fname)," ",lower(dir_lname)) as dir_full_name from director;
select concat(length(dir_fname),length(dir_lname)) as dir_full_name from director;

#Select the movie with rating >8.6 :
select actor.act_id,actor.act_fname,actor.act_lname,movie.mov_title,
movie.mov_year,movie.mov_time,movie.mov_lang,movie_cast.role,rating.rev_stars,rating.num_o_ratings
from actor,movie,movie_cast join rating where actor.act_id=movie_cast.act_id and
movie.mov_id=movie_cast.mov_id and movie.mov_id=rating.mov_id group by rev_stars having sum(rev_stars)>=8.6;

#select the movies with >10000 number of rating :
select actor.act_id,concat(actor.act_fname," ",actor.act_lname) as act_full_name,movie.mov_title,
movie.mov_year,movie.mov_time,movie.mov_lang,movie_cast.role,rating.rev_stars,rating.num_o_ratings,
concat(director.dir_fname," ",director.dir_lname) as dir_full_name 
from actor,movie,movie_cast,director,movie_direction join rating where actor.act_id=movie_cast.act_id and
director.dir_id=movie_direction.dir_id and movie_direction.mov_id=movie.mov_id and
movie.mov_id=movie_cast.mov_id and movie.mov_id=rating.mov_id group by num_o_ratings having sum(num_o_ratings)>10000;

#arrange the movie with min to max as per rating :
select movie.mov_id, movie.mov_title, movie.mov_lang, movie.mov_rel_country,rating.rev_stars,rating.num_o_ratings
from movie join rating where movie.mov_id=rating.mov_id group by rev_stars having min(rev_stars);

#arrang the movie with min to max as per number of rating :
select movie.mov_id, movie.mov_title, movie.mov_lang, movie.mov_rel_country,rating.rev_stars,rating.num_o_ratings
from movie join rating where movie.mov_id=rating.mov_id group by num_o_ratings having sum(rev_stars)>9;

#Arrange in Alphabetical order :
select movie.mov_id, movie.mov_title, movie.mov_lang, movie.mov_rel_country,rating.rev_stars,rating.num_o_ratings
from movie join rating where movie.mov_id=rating.mov_id group by mov_title;

#select the first letter from name :
select actor.act_id,actor.act_fname,actor.act_lname, actor.act_gender,
movie_cast.role, movie.mov_title, movie.mov_lang, movie.mov_dt_rel, movie.mov_time from actor,movie join 
movie_cast where actor.act_id=movie_cast.act_id and movie.mov_id=movie_cast.mov_id group by act_fname,act_lname having 
act_fname like "R%";

#Adding the columns in rating table :
alter table rating add rev_2_stars decimal(4,2);
insert into rating(rev_2_stars) values(8.9),(9.5),(8.7),(9.4),(9.0),(9.2),(8.5),(8.8);
desc rating;
alter table rating drop column rev_2_stars;

#Date function :
select * from movie where mov_year=2012;
select mov_title,mov_lang, extract(day from mov_dt_rel) as mov_date from movie group by mov_title;
select mov_title,mov_lang, extract(month from mov_dt_rel) as mov_month from movie;
select mov_title,mov_lang, extract(month from mov_dt_rel) as mov_month from movie;
select mov_title,date_format(mov_dt_rel,"%D") as release_date,date_format(mov_dt_rel,"%M") as release_month,
mov_year from movie;

#Maths Functions :
select length(num_o_ratings) from rating;
select ceil(rev_stars) from rating;
select floor(rev_stars) from rating;
select round(rev_stars) from rating;
select truncate(rev_stars,2) from rating;
select sqrt(rev_stars) from rating;
select power(rev_stars,2) from rating;

select now();