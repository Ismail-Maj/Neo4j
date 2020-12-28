REASSIGN OWNED BY netflix TO postgres;
DROP OWNED BY netflix;
DROP USER IF EXISTS netflix;
CREATE USER netflix LOGIN PASSWORD 'netflix';
DROP TABLE netflixLibrary;

CREATE TABLE netflixLibrary(
    ID int unique,
    IMDB_titleID VARCHAR(100),
    category VARCHAR(500),
    title VARCHAR(500),
    release_year int,
    seasons int,
    movie_duration int,
    average_rating float,
    number_rating int,
    director VARCHAR(500),
    casting VARCHAR(2000),
    country VARCHAR(500),
    date_added DATE,
    parental_guideline VARCHAR(500),
    listed_in VARCHAR(1000),
    summary VARCHAR(2000)
);

ALTER TABLE netflixLibrary OWNER TO netflix;

\COPY netflixLibrary FROM '../Netflix_Library_join_IMDB_rating.csv' DELIMITER '|' CSV HEADER;
