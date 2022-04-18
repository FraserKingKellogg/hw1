-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off
.width 21 20 20

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_title TEXT,
    year_released INTEGER,
    mpaa_rating TEXT
);

CREATE TABLE studio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    studio_name TEXT,
    movies_id INTEGER
);

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  movies_id INTEGER,
  actors_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

--Insert Movies here

INSERT INTO movies (
movie_title,
year_released,
mpaa_rating
)
Values ("Batman Begins",
        2005,
        "PG-13"
)     ,("The Dark Knight",
        2008,
       "PG-13"
)     ,("The Dark Knight Rises",
        2012,
        "PG-13");


-- ADD Actors Here
INSERT INTO actors (
  full_name
)
Values ("Christian Bale"); 

INSERT INTO actors (
  full_name
)
Values ("Michael Caine"); 

INSERT INTO actors (
  full_name
)
Values ("Liam Neeson");

INSERT INTO actors (
  full_name
)
Values ("Katie Holmes");

INSERT INTO actors (
  full_name
)
Values ("Gary Oldman");

INSERT INTO actors (
  full_name
)
Values ("Heath Ledger");

INSERT INTO actors (
  full_name
)
Values ("Aaron Eckhart");

INSERT INTO actors (
  full_name
)
Values ("Maggie Gyllenhaal");

INSERT INTO actors (
  full_name
)
Values ("Tom Hardy");

INSERT INTO actors (
  full_name
)
Values ("Joseph Gordon-Levitt");

INSERT INTO actors (
  full_name
)
Values ("Anne Hathaway");


-- Update to Roles Below

INSERT INTO roles (
actors_id,
character_name,
movies_id
)
Values  (1,
        "Bruce Wayne",
         1),
        (2,
         "Alfred",
         1),
        (3,
         "Ra's Al Ghul",
         1),
        (4,
         "Rachel Dawes",
         1  ),
        (5,
         "Commissioner Gordon ",
         1 ),
        (1,
         "Bruce Wayne",
         2 ),
        (6,
         "Joker",
         2),
        (7,
         "Harvey Dent",
         2),
        (2,
         "Alfred",
         2),
        (8,
         "Rachel Dawes",
         2),
        (1,
         "Bruce Wayne",
         3 ),
        (5,
         "Commissioner Gordon ",
         3 ),
        (9,
         "Bane",
         3),
        (10,
         "John Blake",
         3),
        (11,
         "Selena Kyle",
         3);

-- Insert Studio here
INSERT INTO studio(
    studio_name,
    movies_id)
Values ("Warner Bros",
         1), 
       ("Warner Bros",
         2),
       ("Warner Bros",
         3);



-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
SELECT movies.movie_title, movies.year_released, movies.mpaa_rating, studio.studio_name
FROM studio 
INNER JOIN movies ON movies.id = studio.movies_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
SELECT movies.movie_title, actors.full_name, roles.character_name
FROM actors
INNER JOIN roles ON roles.actors_id = actors.id
INNER JOIN movies ON movies.id = roles.movies_id;