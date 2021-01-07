MATCH (n) DETACH DELETE n;

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/Ismail-Maj/Neo4j/main/data/netflix_shows_with_IMDB_rating.csv" 
AS line 
FIELDTERMINATOR '|' 
WITH line
CREATE (n:Show) 
SET  n = line;

MATCH (n:Show)
WITH n 
WHERE n.type is not null 
MERGE (t:Type {name:lTrim(rTrim(n.type))}) MERGE (t)<-[:TYPE]-(n);

MATCH (n:Show)
WITH n 
WHERE n.PG is not null 
MERGE (c:PG {name:lTrim(rTrim(n.PG))}) MERGE (c)<-[:GUIDELINE]-(n);

MATCH (n:Show)
WITH n 
WHERE n.director is not null 
FOREACH(direc in split(n.director,',') | MERGE (p:Person {name:lTrim(rTrim(direc))}) MERGE (p)-[:DIRECTED]->(n));

MATCH (n:Show)
WITH n 
WHERE n.genres is not null 
FOREACH(genre in split(n.genres,',') | MERGE (g:Genre {name:lTrim(rTrim(genre))}) MERGE (g)<-[:GENRE]-(n));

MATCH (n:Show)
WITH n 
WHERE n.country is not null 
FOREACH(country in split(n.country,',') | MERGE (c:Country {name:lTrim(rTrim(country))}) MERGE (c)<-[:LOCATION]-(n));

MATCH (n:Show) SET n.rating = toFloat(n.rating);
MATCH (n:Show) SET n.popularity = toInteger(n.popularity);
MATCH (n:Show) SET n.release_year = toInteger(n.release_year);
MATCH (n:Show) SET n.duration = toInteger(n.duration);
MATCH (n:Show) SET n.seasons = toInteger(n.seasons);

MATCH (n:Show)
with n, n.cast as elems
WHERE elems is not null
FOREACH(actor in split(elems,',') | CREATE (p:Person {name:lTrim(rTrim(actor))}) CREATE (p)-[:ACTED_IN]->(n));

MATCH (p:Person)
WITH p.name as name, collect(p) as nodes
CALL apoc.refactor.mergeNodes(nodes) yield node
RETURN *;

MATCH (n:Show) REMOVE n.genres, n.director, n.PG, n.type, n.country, n.cast;

CREATE CONSTRAINT ON (n:Show) ASSERT n.show_id IS UNIQUE;
CREATE CONSTRAINT ON (p:Person) ASSERT p.name IS UNIQUE;