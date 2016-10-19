##########################
##PRIMARY KEY CONSTRAINTS
##########################
INSERT into Actor values(10, 'sachin', 'omkar', 'M', 1988-12-06,NULL);
ERROR 1062 (23000): Duplicate entry '10' for key 'PRIMARY'
#This query tries to insert a tuple with id as 10 which already exists in the table and id is a primary key.

INSERT into Director values(63, 'Keanu', 'Reeves', 1988-03-12, NULL);
ERROR 1062 (23000): Duplicate entry '63' for key 'PRIMARY'
#This query tries to insert a tuple with id as 63 which already exists in the table and id is a primary key.


INSERT into Movie
    -> values(3, 'the war', 1993, 'A', 'Warner');
ERROR 1062 (23000): Duplicate entry '3' for key 'PRIMARY'
#This query tries to insert a tuple with id as 3 which already exists in the table and id is a primary key.


INSERT into MovieGenre
    -> values(2, 'Comedy');
ERROR 1062 (23000): Duplicate entry '2-Comedy' for key 'PRIMARY'
#This query tries to insert a duplicate (id, genre) entry into the table and (id, genre) is a primary key.

##########################
##FOREIGN KEY CONSTRAINTS
##########################
INSERT into MovieActor values(323, 32344, 'hero');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)

#This query tries to insert a tuple with 32344 as aid which is non-existant in the Actor table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

INSERT into MovieGenre values(1, 'Comedy');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)

#This query tries to insert a tuple with 1 as mid which is non-existant in the Movie table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

INSERT into MovieActor values(1, 323, "Hero");
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)


#This query tries to insert a tuple with 1 as mid which is non-existant in the Movie table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

INSERT into MovieDirector
    -> values(1, 3234);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)


#This query tries to insert a tuple with 1 as mid which is non-existant in the Movie table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

INSERT into MovieDirector
    -> values(2, 60);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)

#This query tries to insert a tuple with 60 as did which is non-existant in the Director table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

INSERT into Review
    -> values('Charlie', NULL, 1, 4, 'nice');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)

#This query tries to insert a tuple with 1 as mid which is non-existant in the Movie table(referenced table).
#Hence violates the foreign key constraint.
#######################################################

##########################
##CHECK CONSTRAINTS
##########################

INSERT into Actor values(10, 'sachin', 'omkar', 'M', 1988-12-06,1966-12-23);
#This queries fails to insert into the table as it fails the check constraint which makes sure that data 
#of birth is less than date of death.

INSERT into Director values(101, 'sachin', 'omkar', 'M', 1988-12-06,1966-12-23);
#This queries fails to insert into the table as it fails the check constraint which makes sure that data 
#of birth is less than date of death.

INSERT into MovieActor values(4657,17316, "Sister");
#This queries fails to insert into the table as it fails the check constraint which makes sure that data 
#of birth of the actor in the movie less than year of release of the movie.

INSERT into Review
    -> values('Charlie', NULL, 2, 9, 'nice');
#This queries fails to insert into the table as it fails the check constraint which makes sure that  
#rating given to the movie is between 0 and 5.
