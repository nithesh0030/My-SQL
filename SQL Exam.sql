select * from movie;

# 1.	Write a query where it should contain all the data of the movies which were released after 1995 
		# having their movie duration greater than 120 and should be including A in their movie title.

		select mov_title,mov_year,mov_time from movie 
		where mov_year > 1995 and mov_time > 120 and mov_title like '%a%'
		group by mov_title,mov_year,mov_time;


# 2. 	 Write an SQL query to find the actors who played a role in the movie 'Chinatown'.  
 		# Fetch all the fields of actor table. (Hint: Use the IN operator)
		
        select * from movie;
        select * from cast;
        select * from actor;
        
        select * from actor 
		where act_id in (select act_id from cast where mov_id in (select mov_id from movie 
																	where mov_title = 'Chinatown' ));
                                                                    
 # 3. Write an SQL query for extracting the data from the ratings table for the movie who got the maximum number of ratings.

		select * from ratings;
        
        select * from ratings 
        where num_o_ratings = (select max(num_o_ratings) from ratings );
        
 # 4.  Write an SQL query to determine the Top 7 movies which were released in United Kingdom. 
	# Sort the data in ascending order of the movie year.
		
        select * from movie;
        select * from ratings;
        
		select mov_id,mov_title,mov_rel_country from movie
        where mov_rel_country = 'UK'
        order by mov_year asc limit 7 offset 16;
	
# 5.  Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese 
	# and their movie year was 2001.

		select * from movie;
        
        update movie set mov_lang = 'Chinese' where mov_lang = 'Japanese' 
			and mov_year = '2001';
            
		select * from movie;

# 6.	Print genre title, maximum movie duration and the count the number of movies in each genre.

        select g.gen_title,
         max(m.mov_time)as max_duration,
         count(m.mov_id) as movie_count
         from genres as g
         join movie_genres as mg on
         g.gen_id = mg.gen_id
         join movie as m on mg.mov_id=
         m.mov_id
         group by g.gen_title;


# 7. 	Create a view which should contain the first name, last name, title of the movie & role played by particular actor
		
        select * from movie;
        select * from actor;
        select * from cast;
        
		create view my_view as
		select act.act_fname,act.act_lname,mv.mov_title,cs.role from actor as act
		inner join cast as cs
		on act.act_id=cs.act_id
		inner join movie as mv
		on cs.mov_id=mv.mov_id;
			  
		select*from my_view;



#8 .	Display the movies that were released before 31st March 1995.
		
        select * from movie;

		select * from movie where mov_dt_rel < '1995/31/3';


#9.		Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
    
		select act.act_fname,act.act_lname,act.act_gender,cs.role from actor as act
		inner join cast as cs
		on act.act_id = cs.act_id
		where act_gender like 'F';
    
    
#10. 	Insert five rows into the cast table where the ids for movie should be 936,939,942,930,941 and 
      # their respective roles should be Darth Vader, Sarah Connor, Ethan Hunt, Travis Bickle, Antoine Doinel 
      # & their actor ids should be set up as 126,140,135,131,144.


		

		insert into cast (act_id,mov_id,role)
		values 
		(126,936,'Darth Vader'),
		(140,939,'Sarah Connor'),
		(135,939,'Ethan Hunt'),
		(131,942,'Travis Bickle'),
		(144,941,'Antoine Doinel');

select * from cast;




