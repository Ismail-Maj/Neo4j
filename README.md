## Introduction to Neo4j
**Neo4j** is an open source, **NoSQL**, **ACID** compliant, native **graph** database.
Build upon graph theory, it can be an extremely powerful tool on naturally graph data such as social networks.

For this Introduction, we're going to use a **Netflix** shows data set in the [open data](https://www.kaggle.com/shivamb/netflix-shows?select=netflix_titles.csv) that we extended by scrapping IMDB ratings.
*details in this [notebook](https://github.com/Ismail-Maj/Neo4j/blob/main/notebook.ipynb).*

|      |   show_id | IMDB_id   | type   | title     |   release_year |   rating |   popularity | genres                                          | PG    |   duration |   seasons | director          | date_added      | country                       | cast                                               | description                                        |
|-----:|----------:|:----------|:-------|:----------|---------------:|---------:|-------------:|:------------------------------------------------|:------|-----------:|----------:|:------------------|:----------------|:------------------------------|:---------------------------------------------------|:---------------------------------------------------|
| 3524 |  70131314 | tt1375666 | Movie  | Inception |           2010 |      8.8 |  2.05438e+06 | Action & Adventure, Sci-Fi & Fantasy, Thrillers | PG-13 |        148 |       nan | Christopher Nolan | January 1, 2020 | United States, United Kingdom | Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Pag | In this mind-bending sci-fi thriller, a man runs a |
*The ids can be used to visit information source.*
https://www.imdb.com/title/tt1375666
https://www.netflix.com/title/70131314

In *Neo4j*, data is stored in a property graph, the units of such graph are nodes and relationships.

<p align="center">
  <img src="graph.png" />
</p>
Each node contains properties stored as key-value pairs.
```yaml
{
  "title": "Inception",
  "IMDB_id": "tt1375666",
  "show_id": "70131314", 
  "release_year": 2010,
  "duration": 148,
  "date_added": "January 1, 2020",
  "popularity": 2054380,
  "rating": 8.8,
  "description": "In this mind-bending sci-fi thriller, a man runs an espionage business built around entering the subconscious of his targets to mold their thoughts."
}
```

To query such database we need a **G**raph **Q**uery **L**anguage.
**Cypher** is an open source (*openCypher*) **GQL** created for Neo4j.
Like **SQL**, it can be used to create, read, update and delete data.
It's ASCII-art syntax makes it human readable.

```Cypher
MATCH (p:Person)-[:ACTED_IN]->(n:Shows {title:'Inception'}) RETURN p

"Lukas Haas" "Ellen Page" "Cillian Murphy" "Michael Caine" "Joseph Gordon-Levitt" "Pete Postlethwaite" "Tom Hardy" "Leonardo DiCaprio" "Tom Berenger" "Dileep Rao" "Marion Cotillard"
```








