#select concat(first,' ',last) from (Movie join MovieActor on Movie.id=MovieActor.mid) join Actor on Actor.id=MovieActor.aid where Movie.title ='Die Another Day';

#select concat(first,' ',last),count(*) from (Actor join MovieActor on Actor.id = MovieActor.aid) group by(MovieActor.aid) having count(*) > 1;

#Below query finds all movies and actors/directors who did acting as well as directing in the same movie
select concat(first,' ',last),Movie.title from (Actor join MovieActor on Actor.id = MovieActor.aid) join MovieDirector on MovieActor.mid=MovieDirector.mid join Movie on Movie.id =MovieDirector.mid where MovieDirector.did=MovieActor.aid;