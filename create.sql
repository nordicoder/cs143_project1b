create table Movie(id int NOT NULL,title varchar(100) NOT NULL,year int,rating varchar(10),company varchar(50), 
PRIMARY KEY(id))
 ENGINE = INNODB;


create table Actor(id int NOT NULL,last varchar(20),first varchar(20),sex varchar(6),dob date NOT NULL,dod date,
PRIMARY KEY(id),
CHECK(dob < dod)) ENGINE = INNODB;


create table Director(id int NOT NULL,last varchar(20),first varchar(20),dob date NOT NULL,dod date,
PRIMARY KEY(id),
CHECK(dob<dod)) ENGINE = INNODB;


create table MovieGenre(mid int NOT NULL,genre varchar(20),
PRIMARY KEY(mid, genre),
FOREIGN KEY(mid) REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE) ENGINE = INNODB;


create table MovieDirector(mid int,did int,
PRIMARY KEY(mid, did),
FOREIGN KEY(mid)  REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE, 
FOREIGN KEY(did)  REFERENCES Director(id)
ON DELETE CASCADE 
ON UPDATE CASCADE
) ENGINE = INNODB;


create table MovieActor(mid int,aid int,role varchar(50),
PRIMARY KEY(mid, aid, role),
FOREIGN KEY(mid)  REFERENCES Movie(id)
ON DELETE CASCADE 
ON UPDATE CASCADE, 
FOREIGN KEY(aid)  REFERENCES Actor(id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK ((select year from Movie where Movie.id = mid)<(select year(dob) from Actor where id = aid))  ) ENGINE = INNODB;


create table Review(name varchar(20),time timestamp,mid int,rating int,comment varchar(500),
PRIMARY KEY(mid, name),
FOREIGN KEY(mid) REFERENCES Movie(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK(rating between 0 and 5)) ENGINE = INNODB;


create table MaxPersonID(id int) ENGINE = INNODB;


create table MaxMovieID(id int) ENGINE = INNODB;


