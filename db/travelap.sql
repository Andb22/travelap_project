
DROP TABLE sites;
DROP TABLE cities;
DROP TABLE countries;

-- setup tables for the database

CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY ,
  name VARCHAR(255) NOT NULL,
  visited BOOLEAN
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  visited BOOLEAN,
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE sites(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  visited BOOLEAN,
  city_id INT4 REFERENCES cities(id) ON DELETE CASCADE
);
