-- noinspection SqlNoDataSourceInspectionForFile

-- This should only be run once, to create all the tables for the database.

-- DROP DATABASE IF EXISTS BrewSimDB;
-- CREATE DATABASE BrewSimDB;
-- USE BrewSimDB;

/*  In the command line, run the following to initialize the database.
    createdb brewdb
    psql -U kchoadley brewdb -f createBrewDB.sql
    */

CREATE TABLE grain(
  --Below is generic ingredient attributes
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(255),
  --Below is unique attributes
  region VARCHAR(30),
  potential_extract INT NOT NULL,
  lovibonds INT NOT NULL
);

CREATE TYPE purpose as ENUM('bitter','aroma','dual');
CREATE TABLE hops(
  --Below is generic ingredient attributes
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(255),
  --Below is unique attributes
  region VARCHAR(30),
  alpha_acid DECIMAL(3,1) NOT NULL, --3 = max digits, 1 = precision right of decimal
  purpose purpose,
  aroma VARCHAR(120)
);


CREATE TYPE yeast_type as ENUM('ale','lager','other');
CREATE TABLE yeast(
  --Below is generic ingredient attributes
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  --Below is unique attributes
  region VARCHAR(30),
  brand VARCHAR(30),
  apparent_attenuation DECIMAL(3,2) NOT NULL, --percentage, usually 65%-80%
  yeast_type yeast_type NOT NULL
);

CREATE TABLE additive(
  --Below is generic ingredient attributes
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(255),
  --Below is unique attributes
  use_case VARCHAR(30)
);

CREATE TABLE beer_recipe(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  boil_time INT NOT NULL,
  description VARCHAR(255),
  instructions VARCHAR(1000)
);

CREATE TABLE beer_style(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(255),
  origin VARCHAR(30),
  min_bitterness DECIMAL(5,1) NOT NULL, -- could be over 100
  max_bitterness DECIMAL(5,1) NOT NULL, -- could be over 100, highest found was 2500
  min_color DECIMAL(3,1) NOT NULL, -- scale of 1-40
  max_color DECIMAL(3,1) NOT NULL, -- scale of 1-40
  min_ABV DECIMAL(3,1) NOT NULL, -- percent, usually from 3%-12%
  max_ABV DECIMAL(3,1) NOT NULL -- percent, usually from 3%-12%
);

CREATE TABLE equipment(
  id SERIAL NOT NULL PRIMARY KEY,
  batch_size DECIMAL(7,1), -- In gallons, allows up to 3000 barrel system.
  extract_efficeny DECIMAL(3,1) -- percent, usually 60%-80%
);

CREATE TABLE style_of_recipe(
  recipe_id INT NOT NULL,
  style_id INT NOT NULL,
  PRIMARY KEY (recipe_id), -- there can only be one beer style per recipe
  FOREIGN KEY (style_id)
  REFERENCES beer_style(id)
    ON UPDATE CASCADE ON DELETE CASCADE, -- need to determine if this is correct...
  FOREIGN KEY (recipe_id)
  REFERENCES beer_recipe(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- need to determine if this is correct...
);

CREATE TABLE grain_in_recipe(
  grain_id INT NOT NULL,
  recipe_id INT NOT NULL,
  amount INT NOT NULL,
  PRIMARY KEY (grain_id, recipe_id),
  FOREIGN KEY (recipe_id)
  REFERENCES beer_recipe(id)
    ON UPDATE CASCADE ON DELETE CASCADE, -- need to determine if this is correct...
  FOREIGN KEY (grain_id)
  REFERENCES grain(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- need to determine if this is correct...
);

CREATE TABLE hops_in_recipe(
  hops_id INT NOT NULL,
  recipe_id INT NOT NULL,
  amount INT NOT NULL,
  exposure_time INT NOT NULL,
  PRIMARY KEY (hops_id, recipe_id, exposure_time),
  FOREIGN KEY (recipe_id)
  REFERENCES beer_recipe(id)
    ON UPDATE CASCADE ON DELETE CASCADE, -- need to determine if this is correct...
  FOREIGN KEY (hops_id)
  REFERENCES hops(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- need to determine if this is correct...
);

CREATE TABLE yeast_in_recipe(
  yeast_id INT NOT NULL,
  recipe_id INT NOT NULL,
  PRIMARY KEY (recipe_id), -- because only 1 yeast per recipe
  FOREIGN KEY (recipe_id)
  REFERENCES beer_recipe(id)
    ON UPDATE CASCADE ON DELETE CASCADE, -- need to determine if this is correct...
  FOREIGN KEY (yeast_id)
  REFERENCES yeast(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- need to determine if this is correct...
);

CREATE TABLE additive_in_recipe(
  additive_id INT NOT NULL,
  recipe_id INT NOT NULL,
  amount INT NOT NULL,
  exposure_time INT NOT NULL,
  PRIMARY KEY (additive_id, recipe_id, exposure_time),
  FOREIGN KEY (recipe_id)
  REFERENCES beer_recipe(id)
    ON UPDATE CASCADE ON DELETE CASCADE, -- need to determine if this is correct...
  FOREIGN KEY (additive_id)
  REFERENCES additive(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- need to determine if this is correct...
);