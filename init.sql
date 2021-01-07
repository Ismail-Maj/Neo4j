REASSIGN OWNED BY netflix TO postgres;
DROP OWNED BY netflix;
DROP USER IF EXISTS netflix;
CREATE USER netflix LOGIN PASSWORD 'netflix';
DROP TABLE netflixLibrary;

CREATE TABLE netflixLibrary(
    show_id int unique,
    IMDB_id VARCHAR(100),
    type VARCHAR(500),
    title VARCHAR(500),
    release_year int,
    rating float,
    popularity int,
    genres VARCHAR(500),
    PG VARCHAR(500),
    duration int,
    seasons int,
    director VARCHAR(500),
    date_added DATE,
    country VARCHAR(500),
    casting VARCHAR(2000),
    description VARCHAR(2000) 
);

ALTER TABLE netflixLibrary OWNER TO netflix;


\COPY netflixLibrary FROM 'data/netflix_shows_with_IMDB_rating.csv' DELIMITER '|' CSV HEADER;