DROP TABLE countries;
DROP TABLE cities;
DROP TABLE sites;

CREATE TABLE countries(
  id SERIAL4,
  name VARCHAR,
  visited BOOLEAN
)

CREATE TABLE cities(
  id SERIAL4,
  name VARCHAR,
  visited BOOLEAN,
  country_id SERIAL4 REFERENCES countries(id)
)

CREATE TABLE sites(
  id SERIAL4,
  name VARCHAR,
  visited BOOLEAN,
  city_id SERIAL4 REFERENCES cities(id)
)
