#################
###PRIMARY KEY NO 1
#################

#creates movie table with movie id being primary key, as there can be no two movies having same unique id
create table Movie(id int NOT NULL,title varchar(100) NOT NULL,year int,rating varchar(10),company varchar(50), 
PRIMARY KEY(id))
 ENGINE = INNODB;
 
#################
###PRIMARY KEY NO 2
###CHECK NO 1
#################

#creates actor table with actor id being primary key, as there can be no two actor having same unique id
create table Actor(id int NOT NULL,last varchar(20),first varchar(20),sex varchar(6),dob date NOT NULL,dod date,
PRIMARY KEY(id),
CHECK(dob < dod)) ENGINE = INNODB;

#################
###PRIMARY KEY NO 3
###CHECK NO 2
#################
#creates director table with director id being primary key, as there can be no two directors having same unique id
create table Director(id int NOT NULL,last varchar(20),first varchar(20),dob date NOT NULL,dod date,
PRIMARY KEY(id),
CHECK(dob<dod)) ENGINE = INNODB;

#################
###PRIMARY KEY NO 4
###FOREIGN KEY NO 1
#################
#creates moviegenre table with movie id(mid) being foreign key as if a movie doesnt exist in the movie table, there no point writing
#information about it in the moviegenre table
create table MovieGenre(mid int NOT NULL,genre varchar(20),
PRIMARY KEY(mid, genre),
FOREIGN KEY(mid) REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE) ENGINE = INNODB;

#################
###PRIMARY KEY NO 5
###FOREIGN KEY NO 2,3
#################
#creates moviedirector table with movie id(mid) being foreign key as if a movie doesnt exist in the movie table, there no point writing
#information about it in the moviedirector table
#Also director id is a foreign key as if the director doesnt exist in the director table, he cant be a director of a movie
create table MovieDirector(mid int,did int,
PRIMARY KEY(mid, did),
FOREIGN KEY(mid)  REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE, 
FOREIGN KEY(did)  REFERENCES Director(id)
ON DELETE CASCADE 
ON UPDATE CASCADE
) ENGINE = INNODB;

#################
###PRIMARY KEY NO 6
###FOREIGN KEY NO 4,5
###CHECK NO 3
#################
#creates movieactor table with movie id(mid) being foreign key as if a movie doesnt exist in the movie table, there no point writing
#information about it in the movieactor table
#Also actor id is a foreign key as if the actor doesnt exist in the actor table, he cant be an actor in a movie
create table MovieActor(mid int,aid int,role varchar(50),
PRIMARY KEY(mid, aid, role),
FOREIGN KEY(mid)  REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE, 
FOREIGN KEY(aid)  REFERENCES Actor(id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK ((select year from Movie where Movie.id = mid)<(select year(dob) from Actor where id = aid))  ) ENGINE = INNODB;

#################
###PRIMARY KEY NO 7
###FOREIGN KEY NO 6
###CHECK NO 4
#################
#creates review table with movie id(mid) being foreign key as if a movie doesnt exist in the movie table, there no point writing
#information about it in the review table
create table Review(name varchar(20),time timestamp,mid int,rating int,comment varchar(500),
PRIMARY KEY(mid, name),
FOREIGN KEY(mid) REFERENCES Movie(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK(rating between 0 and 5)) ENGINE = INNODB;


create table MaxPersonID(id int) ENGINE = INNODB;


create table MaxMovieID(id int) ENGINE = INNODB;


