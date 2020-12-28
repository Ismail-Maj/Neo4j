-- netflix user must be created beforehand

DROP DATABASE IF EXISTS netflix;

CREATE DATABASE netflix;

CREATE TABLE [IF NOT EXISTS] netflixLibrary(
    ID int UNIQUE KEY,
    imdbID VARCHAR(100),
    category VARCHAR(500),
    title VARCHAR(500),
    director VARCHAR(500),
    cast VARCHAR(500),
    country VARCHAR(500),
    aired_date VARCHAR(500),
    release_year int,
    rating VARCHAR(500),
    duration int,
    genre VARCHAR(500),
    summary VARCHAR(2000),
    rating int,
    ratingPopulation int
)

ALTER DATABASE netflix OWNER TO netflix;